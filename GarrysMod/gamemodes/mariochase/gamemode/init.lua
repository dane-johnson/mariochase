NOCLEAN = {
   'info_player_mario',
   'info_player_toad',
   'trigger_reset'
}

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("cl_hud.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("player_class/player_mc_base.lua")
AddCSLuaFile("player_class/player_mario.lua")
AddCSLuaFile("player_class/player_toad.lua")
AddCSLuaFile("team.lua")

include("shared.lua")
include("player_ext.lua")

function GM:EntityTakeDamage(tgt, dmg)
   local attacker = dmg:GetAttacker()
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

function GM:PlayerSpawn(ply)
   if ply:Team() == TOAD then
      player_manager.SetPlayerClass(ply, "player_toad")
   elseif ply:Team() == MARIO then
      player_manager.SetPlayerClass(ply, "player_mario")
   else
      player_manager.SetPlayerClass(ply, "player_mc_base")
   end
   hook.Call("PlayerLoadout", GAMEMODE, ply)
   hook.Call("PlayerSetModel", GAMEMODE, ply)
   player_manager.OnPlayerSpawn(ply)
   player_manager.RunClass(ply, "Spawn")
end

function StartHideMode()
   GAMESTATE = "hide"
   GAMEMODE:ResetPlayers()
   StartHideTimer()
end

function StartHideTimer()
   if not timer.Start("hide") then
      timer.Create("hide", 30, 1, StartChaseMode)
   end
end

function StartChaseMode()
   GAMESTATE = "chase"
   for _, ply in ipairs(player.GetAll()) do
      ply:Freeze(false)
   end
end

function change_mario(server, cmd, args)
   local mario
   for _, ply in ipairs(player.GetAll()) do
      if ply:Nick() == args[1] then
         mario = ply
      end
   end
   if mario then
      GAMEMODE:ChangeMario(mario)
      StartHideMode()
   else
      MsgN(args[1] .. " not found")
   end
end

concommand.Add("mc_restart_round", StartHideMode)
concommand.Add("mc_change_mario", change_mario)
