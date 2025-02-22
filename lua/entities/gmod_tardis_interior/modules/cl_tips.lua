-- Tips

TARDIS:AddSetting({
	id="tips",
	name="Tips",
	desc="Should tips be shown for TARDIS controls?",
	section="Misc",
	value=true,
	type="bool",
	option=true,
	networked=false
})

TARDIS:AddSetting({
	id="tips_style",
	name="Tips Style",
	desc="Which style should the TARDIS tips use?",
	section="Misc",
	value="default",
	option=false,
	networked=false
})

function ENT:InitializeTips(style_name)
	local int_metadata = self.metadata.Interior

	self.tip_style_name = style_name

	if style_name == "default" then
		style_name = int_metadata.Tips.style or int_metadata.TipSettings.style
		-- Interior.Tips are deprecated; should be deleted when the extensions update and
		-- replace with Interior.CustomTips, Interior.PartTips and Interior.TipSettings
		-- Old version has more priority, since extensions get overriden by base.lua
	end

	local style = TARDIS:GetTipStyle(style_name)
	local tips = {}

	for k,interior_tip in ipairs(self.alltips) do
		local tip = table.Copy(style)

		tip.view_range_min = int_metadata.Tips.view_range_min or int_metadata.TipSettings.view_range_min
		tip.view_range_max = int_metadata.Tips.view_range_max or int_metadata.TipSettings.view_range_max

		-- Interior.Tips are deprecated; should be deleted when the extensions update and
		-- replace with Interior.CustomTips, Interior.PartTips and Interior.TipSettings
		-- Old version has more priority, since extensions get overriden by base.lua

		for setting,value in pairs(interior_tip) do
			tip[setting]=value
		end
		if not tip.text then
			if tip.part then
				local part = TARDIS:GetRegisteredPart(tip.part)
				if part then

					local controls_metadata = int_metadata.Controls
					if controls_metadata then
						if controls_metadata[part.ID] ~= nil then
							part.Control = controls_metadata[part.ID]
						end
					end

					if part.Control then
						local control = TARDIS:GetControl(part.Control)
						if control and control.tip_text then
							tip.text = control.tip_text
						else
							print("[TARDIS] WARNING: Control \""..part.Control.."\" either does not exist or has no tip text specified")
						end
					end
					if part.Text then
						tip.text = part.Text
					end
				else
					error("Part \""..tip.part.."\" does not exist")
				end
			end
			if tip.control then
				local control = TARDIS:GetControl(tip.control)
				if control and control.tip_text then
					tip.text = control.tip_text
				else
					print("[TARDIS] WARNING: Control \""..tip.control.."\" either does not exist or has no tip text specified")
				end
			end
		end
		if not tip.text then
			print("[TARDIS] WARNING: Tip at position "..tostring(tip.pos).." has no text set")
		else
			tip.colors.current = tip.colors.normal
			tip.highlighted = false

			tip.SetHighlight = function(self, on)
				self.highlighted = on
				if on then
					self.colors.current = self.colors.highlighted
				else
					self.colors.current = self.colors.normal
				end
			end
			tip.ToggleHighlight = function(self)
				self:SetHighlight(not tip.highlighted)
			end
			table.insert(tips, tip)
		end
	end
	self.tips = tips
end

ENT:AddHook("Initialize", "tips", function(self)
	self.alltips = {}
	if #self.metadata.Interior.Tips ~= 0 then
		for inttip_id, inttip in ipairs(self.metadata.Interior.Tips) do
			-- Interior.Tips are deprecated; should be deleted when the extensions update and
			-- replace with Interior.CustomTips, Interior.PartTips and Interior.TipSettings
			table.insert(self.alltips, inttip)
		end
	end
	if #self.metadata.Interior.CustomTips ~= 0 then
		for inttip_id, inttip in ipairs(self.metadata.Interior.CustomTips) do
			table.insert(self.alltips, inttip)
		end
	end
	if self.metadata.Interior.PartTips ~= nil then
		for part_id, part_tip in pairs(self.metadata.Interior.PartTips) do
			if istable(part_tip) then
				local tip = table.Copy(part_tip)
				tip.part = part_id
				table.insert(self.alltips, tip)
			end
		end
	end
	for part_id,part in pairs(self.metadata.Interior.Parts) do
		if istable(part) and part.tip then
			local tip = table.Copy(part.tip)
			tip.part = part_id
			table.insert(self.alltips, tip)
		end
	end

	local style_name = TARDIS:GetSetting("tips_style", "default")
	self:InitializeTips(style_name)
end)

ENT:AddHook("ShouldDrawTips", "tips", function(self)
	if LocalPlayer():GetTardisData("thirdperson") or LocalPlayer():GetTardisData("destination") then
		return false
	end
end)

hook.Add("HUDPaint", "TARDIS-DrawTips", function()
	local interior = TARDIS:GetInteriorEnt(LocalPlayer())
	if not (interior and interior.tips and TARDIS:GetSetting("tips") and (interior:CallHook("ShouldDrawTips")~=false)) then return end

	local selected_tip_style = TARDIS:GetSetting("tips_style", "default")
	if interior.tip_style_name ~= selected_tip_style then
		interior:InitializeTips(selected_tip_style)
	end

	local cseq_enabled = interior:GetSequencesEnabled()
	local cseq_sequences, cseq_active, cseq_next

	if cseq_enabled then
		cseq_sequences = TARDIS:GetControlSequence(interior.metadata.Interior.Sequences)
		cseq_enabled = cseq_sequences ~= nil
		cseq_active = interior:GetData("cseq-active")
		local cseq_curseq = interior:GetData("cseq-curseq")
		local cseq_step = interior:GetData("cseq-step")
		if cseq_sequences and cseq_curseq and cseq_sequences[cseq_curseq] then
			cseq_next = cseq_sequences[cseq_curseq].Controls[cseq_step]
		end
	end

	local player_pos = LocalPlayer():EyePos()
	for k,tip in ipairs(interior.tips)
	do
		local view_range_min = tip.view_range_min
		local view_range_max = tip.view_range_max

		local cseq_canstart = cseq_enabled and interior:CallHook("CanStartControlSequence",tip.part)~=false

		if not cseq_active then
			tip:SetHighlight(cseq_enabled and cseq_sequences[tip.part] ~= nil and cseq_canstart)
		else
			tip:SetHighlight(cseq_enabled and tip.part == cseq_next)
		end

		local pos = interior:LocalToWorld(tip.pos)
		local dist = pos:Distance(player_pos)
		if dist <= view_range_max then
			surface.SetFont(tip.font)
			local alpha = tip.colors.current.background.a
			if dist > view_range_min then
				local normalised = 1 - ((dist - view_range_min) / (view_range_max - view_range_min))
				alpha = (tip.colors.current.background.a) * normalised
			end

			local background_color = ColorAlpha(tip.colors.current.background, alpha)
			local frame_color = ColorAlpha(tip.colors.current.frame, alpha)
			local text_color = ColorAlpha(tip.colors.current.text, alpha)

			local w, h = surface.GetTextSize( tip.text )
			local pos = pos:ToScreen()
			local padding = tip.padding or 10
			local offset = tip.offset or 30
			local fr_width = tip.fr_width or 2

			local x, y, t
			local trX = {}
			local trY = {}

			if tip.down then
				y = pos.y + offset
				t = -1
				trY[1] = pos.y
				trY[2] = y - padding
				trY[3] = y - padding
			else
				y = pos.y - h - offset
				t = 1
				trY[1] = y + h + padding
				trY[2] = y + h + padding
				trY[3] = pos.y
			end
			if tip.right then
				x = pos.x + offset
				trX[2 - t] = x - (padding / 2)
				trX[2] = x + (padding * 2)
				trX[2 + t] = pos.x
			else
				x = pos.x - w - offset
				trX[2 - t] = x + w - (padding * 2)
				trX[2] = x + w + (padding / 2)
				trX[2 + t] = pos.x
			end

			local verts = {}
			verts[1] = { x = trX[1], y = trY[1] }
			verts[2] = { x = trX[2], y = trY[2] }
			verts[3] = { x = trX[3], y = trY[3] }

			local box = {}
			box[1] = {x - padding, y - padding}
			box[2] = {w + padding * 2, h + padding * 2}

			draw.NoTexture()
			surface.SetDrawColor( background_color:Unpack() )
			surface.DrawPoly( verts )
			surface.SetDrawColor( frame_color:Unpack() )
			surface.DrawPoly( verts )

			draw.RoundedBox( 8, box[1][1] - fr_width, box[1][2] - fr_width, box[2][1] + 2 * fr_width, box[2][2] + 2 * fr_width, frame_color )
			draw.RoundedBox( 8, box[1][1], box[1][2], box[2][1], box[2][2], background_color )

			draw.NoTexture()
			surface.DrawPoly( verts )

			draw.DrawText( tip.text, tip.font, x + w/2, y, text_color, TEXT_ALIGN_CENTER )
		end
	end
end)
