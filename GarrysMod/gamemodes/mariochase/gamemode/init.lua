AddCSLuaFile("cl_init.lua")
AddCSLuaFile("cl_hud.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("player_class/player_mc_base.lua")
AddCSLuaFile("team.lua")

include("shared.lua")
include("player_ext.lua")

function GM:PlayerInitialSpawn(ply)
   player_manager.SetPlayerClass(ply, 'player_mc_base')
end

NOCLEAN = {
   'info_player_mario',
   'info_player_toad',
   'trigger_reset'
}
