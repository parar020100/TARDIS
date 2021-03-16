-- Default

local T={}
T.Base="base"
T.Name="Default"
T.ID="default"
T.Interior={
	Model="models/drmatt/tardis/interior.mdl",
	IdleSound={
		{
			path="tardis/interior_idle_loop.wav",
			volume=0.5
		},
		{
			path="tardis/interior_idle2_loop.wav",
			volume=0.5
		}
	},
	Light={
		color=Color(255,50,0),
		warncolor=Color(255,0,0),
		pos=Vector(0,0,120),
		brightness=5
	},
	Lights={
		{
			color=Color(0,255,0),
			pos=Vector(0,0,-50),
			brightness=2,
			nopower=true
		}
	},
	Portal={
		pos=Vector(316.7,334.9,-36.5),
		ang=Angle(0,230,0),
		width=45,
		height=91
	},
	Fallback={
		pos=Vector(291,305,-75),
		ang=Angle(0,230,0)
	},
	Screens={
		{
			pos = Vector(44.5, -6.5, 39),
			ang = Angle(0, 84.5, 91),
			width = 227.75,
			height = 140,
			visgui_rows = 2,
			power_off_black = true
		}
	},
	Sequences="default_sequences",
	Parts={
		door={
			pos=Vector(300,315,-88.1),
			ang=Angle(0,50,0),
			width=443,
			height=335
		},
		default_rails=true,
		default_throttle={pos=Vector(-8.87,-50,5.5), ang=Angle(-12,-5,24)},
		default_flightlever={pos=Vector(-0.431641, 44.75, 6.4), ang=Angle(-63.913, 137.035, 136.118)},
		default_screen={pos=Vector(42,0.75,27.1), ang=Angle(0,-5,0)},
		default_screenbutton={pos=Vector(44.5,9.75,38.2), ang=Angle(215,85,90)},
		default_helmic={pos=Vector(-26.000000, -41.000000, 4.000000), ang=Angle(0.000, 330.000, 24.500)},
		default_wibblylever={pos=Vector(-48.000000, 18.000000, 5.400000), ang=Angle(335.000, 347.000, 6.000)},
		default_powerlever={pos=Vector(44.000000, -18.000000, 5.500000), ang=Angle(22.000, 328.000, 347.500)},
		default_keyboard={pos=Vector(29.000000, -53.000000, -8.000000), ang=Angle(0.000, 30.000, 50.000)},
		default_hads={pos=Vector(39.000000, 22.750000, 5.828125), ang=Angle(296.260, 78.027, 136.528)},
		default_typewriter={pos=Vector(19.002930, 48.807617, 2.078125), ang=Angle(0.945, 330.128, 339.750)},
		default_repairlever={pos=Vector(-6.623535, 44.351563, 7.000000), ang=Angle(349.000, 5.000, 337.000)},
		default_handbrake={pos=Vector(-40.088379, -21.466797, 7.924805), ang=Angle(290.494, 208.321, 182.157)},
		default_gramophone={pos=Vector(-26.000000, -1.500000, 30.000000), ang=Angle(0.000, 30.000, 0.000)},
		default_biglever={pos=Vector(-9.940000, -65.000000, -52.000000), ang=Angle(0.000, 270.000, 0.000)},
		default_physbrake={pos=Vector(39.000000, -22.750000, 6.914063), ang=Angle(303.286, 6.660, 148.819)},
		default_isomorphic={pos=Vector(-39.500000, 22.000000, 6.629883), ang=Angle(290.762, 195.000, 137.777)},
		default_atomaccel={pos=Vector(20.000000, -37.669998, 1.750000), ang=Angle(0.000, 0.000, 0.000)},
		default_directionalpointer={pos=Vector(12.500000, -24.500000, 23.000000), ang=Angle(0.000, 30.000, 0.000)},
		default_float={pos=Vector(-2.5, -45.5, 7.75), ang=Angle(-56.714, -54.280, 148.819)},
		default_blacksticks={pos=Vector(4.480469, -43.906372, 7.000000), ang=Angle(13.000, 0.000, 24.176)},
		default_longflighttoggle={pos=Vector(-37.242310, -27.915344, 7.428223), ang=Angle(338.000, 28.721, 15.000)},
		default_longflightdemat={pos=Vector(-43.168457, -31.015625, 4.700000), ang=Angle(22.000, 209.224, 348.000)},
	},
	Tips={
		view_range_min=70,
		view_range_max=90,
		{pos = Vector(52, 31, 1),            part = "default_hads",             down = true},
		{pos = Vector(19, 48.80, 2.07),      part = "default_typewriter"},
		{pos = Vector(42, 0.75, 29.1),       part = "default_screen",           down = true},
		{pos = Vector(47, 10, 38),           part = "default_screenbutton",     right = true},
		{pos = Vector(44, -18, 5.5),         part = "default_powerlever",       right = true},
		{pos = Vector(52, -30, 0),           part = "default_physbrake",        down = true},
		{pos = Vector(29, -53, -8),          part = "default_keyboard",         right = true, down = true},
		--{pos = Vector(4.48, -43.9, 7),       part = "default_blacksticks"}, --cloak control which isn't ready yet
		{pos = Vector(-8.87, -50, 5.5),      part = "default_throttle",         down = true},
		{pos = Vector(-9.94, -65, -12),      part = "default_biglever"},
		{pos = Vector(-37.24, -27.91, 7.42), part = "default_longflighttoggle"},
		{pos = Vector(-52, -29, 2),          part = "default_handbrake",        down = true},
		{pos = Vector(-8, 45, 9),            part = "default_repairlever",      right = true},
		{pos = Vector(-1, 59, 2),            part = "default_flightlever",      right = true, down = true},
		{pos = Vector(-2, -60, 1),           part = "default_float",            right = true, down = true},
		{pos = Vector(-52, 29, 2),           part = "default_isomorphic",       down = true},
		{pos = Vector(20, -38, 6),           part = "default_atomaccel",        right = true},
		{pos = Vector(12.5, -24.5, 23),      part = "default_directionalpointer"},
		{pos = Vector(-26, -41, 4),          part = "default_helmic",           right = true, view_range_max = 70, view_range_min = 50 }, --less view range since there's a lot stuff there
		{pos = Vector(-43.16, -31.01, 4.7),  part = "default_longflightdemat",  right = true, down = true},
		{pos = Vector(-26, -1.50, 40),       part = "default_gramophone",       right = true, down = true},
		{pos = Vector(-48, 18, 5.4),         part = "default_wibblylever",      right = true},
	},
	Seats={
		{
			pos=Vector(130,-96,-30),
			ang=Angle(0,40,0)
		},
		{
			pos=Vector(125,55,-30),
			ang=Angle(0,135,0)
		}
	}
}
T.Exterior={
	Parts={
		door=true
	}
}
TARDIS:AddInterior(T)
