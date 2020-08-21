include("shared.lua")
include("cl_hud.lua")

hook.Add(
   "CalcView", "MyCalcView",
   function( ply, pos, angles, fov )
      -- Fix the camera getting dutched
      local pitch, yaw = angles:Unpack()
      angles:SetUnpacked(pitch, yaw, 0)
      local view = {
         origin = pos - ( angles:Forward() * 100 ),
         angles = angles,
         fov = fov,
         drawviewer = true
      }
      return view
   end
)
