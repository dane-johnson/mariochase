include("shared.lua")
include("cl_hud.lua")

hook.Add( "CalcView", "MyCalcView", function( ply, pos, angles, fov )
	local view = {
		origin = pos - ( angles:Forward() * 100 ),
		angles = angles,
		fov = fov,
		drawviewer = true
	}

	return view
end )
