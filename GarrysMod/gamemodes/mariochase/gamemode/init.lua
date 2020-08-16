AddCSLuaFile("cl_init.lua")
AddCSLuaFile("cl_hud.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("player_class/player_mc_base.lua")
AddCSLuaFile("player_class/player_mario.lua")
AddCSLuaFile("player_class/player_toad.lua")
AddCSLuaFile("team.lua")

include("shared.lua")
include("player_ext.lua")

NOCLEAN = {
   'info_player_mario',
   'info_player_toad',
   'trigger_reset'
}


function GM:EntityTakeDamage(tgt, dmg)
   local attacker = dmg:GetAttacker()
   print(attacker:GetClass())
   if IsValid(tgt) and tgt:IsPlayer() and tgt:Team() == MARIO and
   IsValid(attacker) and attacker:IsPlayer() and attacker:Team() == TOAD then
      -- Let it be
   else
      return true
   end
end

function GM:PlayerSetModel(ply)
   if ply:Team() == MARIO then
      ply:SetModel("models/player/odessa.mdl")
      ply:SetColor(RED)
   else
      ply:SetModel("models/player/police.mdl")
      ply:SetColor(BLUE)
   end
end
