local meta = FindMetaTable("Player")

local ZERO = Vector()

function meta:SetJumpPoint()
   self.JumpPoint = self:GetPos()
end

function meta:ResetToJumpPoint()
   local vel = self:GetVelocity()
   self:SetPos(self.JumpPoint)
   -- For some reason setting player velocity just adds velocity
   -- This sets it to zero
   self:SetVelocity(vel * -1)
end

function meta:UpdateJumpPoint()
   if self:OnGround() then
      self:SetJumpPoint()
   end
end
