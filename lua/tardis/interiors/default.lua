-- Default

local T={}
T.Base="base"
T.Name="Default"
T.ID="default"
T.Interior={
	Model="models/drmatt/tardis/interior.mdl",
	IdleSound={
		{
			path="drmatt/tardis/default/interior_idle_loop.wav",
			volume=0.5
		},
		{
			path="drmatt/tardis/default/interior_idle2_loop.wav",
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
	Sequences = "default_sequences",
	Parts = {
		door = {
			pos = Vector(300,315,-88.1),
			ang = Angle(0,50,0),
			width = 443,
			height = 335
		},
		default_rails = true,
		default_throttle           = {pos = Vector(-8.87,-50,5.5),                    ang = Angle(-12,-5,24),                 tip = {pos = Vector(-8.87, -50, 5.5), down = true},},
		default_flightlever        = {pos = Vector(-0.431641, 44.75, 6.4),            ang = Angle(-63.913, 137.035, 136.118), tip = {pos = Vector(-1, 59, 2), down = true},},
		default_screen             = {pos = Vector(42,0.75,27.1),                     ang = Angle(0,-5,0),                    tip = {pos = Vector(42, 0.75, 29.1), down = true},},
		default_screenbutton       = {pos = Vector(44.5,9.75,38.2),                   ang = Angle(215,85,90),                 tip = {pos = Vector(47, 10, 38), right = true},},
		default_wibblylever        = {pos = Vector(-48, 18, 5.4),                     ang = Angle(335, 347, 6),               tip = {pos = Vector(-48, 18, 5.4), right = true},},
		default_enginerelease      = {pos = Vector(-61.229, 21.622, -4.514),          ang = Angle(90, 90.911, -90),           tip = {pos = Vector(-61.229, 21.622, -4.514), down = true},},
		default_doorbutton         = {pos = Vector(-60.782, -25.129, -6.108),         ang = Angle(0, 65.911, -81.515),        tip = {pos = Vector(-62.699, -24.23, -5.506), down = true},},
		default_powerlever         = {pos = Vector(44, -18, 5.5),                     ang = Angle(22, 328, 347.5),            tip = {pos = Vector(44, -18, 5.5), right = true},},
		default_keyboard           = {pos = Vector(29, -53, -8),                      ang = Angle(0, 30, 50),                 tip = {pos = Vector(29, -53, -8), right = true, down = true},},
		default_hads               = {pos = Vector(39, 22.75, 5.828125),              ang = Angle(296.260, 78.027, 136.528),  tip = {pos = Vector(52, 31, 1), down = true},},
		default_typewriter         = {pos = Vector(19.002930, 48.807617, 2.078125),   ang = Angle(0.945, 330.128, 339.750),   tip = {pos = Vector(19, 48.80, 2.07)},},
		default_repairlever        = {pos = Vector(-6.623535, 44.351563, 7),          ang = Angle(349, 5, 337),               tip = {pos = Vector(-8, 45, 9), right = true},},
		default_redecoratebutton   = {pos = Vector(-6.412, 53.588, 1.556),            ang = Angle(9.445, 46.482, -21.861),    tip = {pos = Vector(-6.542, 54.408, 3.081), down = true, right = true},},
		default_handbrake          = {pos = Vector(-40.088379, -21.466797, 7.924805), ang = Angle(290.494, 208.321, 182.157), tip = {pos = Vector(-52, -29, 2), down = true},},
		default_gramophone         = {pos = Vector(-26, -1.5, 30),                    ang = Angle(0, 30, 0),                  tip = {pos = Vector(-26, -1.50, 40), right = true, down = true},},
		default_biglever           = {pos = Vector(-9.94, -65, -52),                  ang = Angle(0, 270, 0),                 tip = {pos = Vector(-9.94, -65, -12)},},
		default_physlock           = {pos = Vector(39.5, -22.75, 6.914063),           ang = Angle(303.286, 6.660, 148.819),   tip = {pos = Vector(52, -30, 0), down = true},},
		default_isomorphic         = {pos = Vector(-39.5, 22, 6.629883),              ang = Angle(290.762, 195, 137.777),     tip = {pos = Vector(-52, 29, 2), down = true},},
		default_atomaccel          = {pos = Vector(20, -37.669998, 1.75),             ang = Angle(0, 0, 0),                   tip = {pos = Vector(20, -38, 6), right = true},},
		default_directionalpointer = {pos = Vector(12.5, -24.5, 23),                  ang = Angle(0, 30, 0),                  tip = {pos = Vector(12.5, -24.5, 23)},},
		default_float              = {pos = Vector(-2.5, -45.5, 7.75),                ang = Angle(-56.714, -54.280, 148.819), tip = {pos = Vector(-2, -60, 1), right = true, down = true},},
		default_blacksticks        = {pos = Vector(4.480469, -43.906372, 7),          ang = Angle(13, 0, 24.176),             --[[tip = {pos = Vector(4.48, -43.9, 7)},]]}, --cloak control which isn't ready yet
		default_longflighttoggle   = {pos = Vector(-37.242310, -27.915344, 7.428223), ang = Angle(338, 28.721, 15),           tip = {pos = Vector(-37.24, -27.91, 7.42)},},
		default_dematcircuit       = {pos = Vector(-43.168457, -31.015625, 4.7),      ang = Angle(22, 209.224, 348),          tip = {pos = Vector(-43.16, -31.01, 4.7), right = true, down = true},},
		default_helmic = {
			pos = Vector(-26, -41, 4),
			ang = Angle(0, 330, 24.5),
			tip = {
				pos = Vector(-26, -41, 4),
				right = true,
				view_range_max = 70, --less view range since there's a lot stuff in the way
				view_range_min = 50
			},
		},
	},
	Tips={
		view_range_min=70,
		view_range_max=90,
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
	},
	BreakdownEffectPos = Vector(0, 0, 40)
}
T.Exterior={
	Parts={
		door=true
	}
}
TARDIS:AddInterior(T)
