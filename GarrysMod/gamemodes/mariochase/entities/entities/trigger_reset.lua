ENT.Base = "base_brush"
ENT.Type = "brush"

ENT.Enabled = true

function ENT:Touch(ply)
   if ply:IsPlayer() then
      ply:ResetToJumpPoint()
   end
end
