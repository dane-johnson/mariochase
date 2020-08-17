MARIO = 1
TOAD = 2
RED = Color(255, 0, 0)
BLUE = Color(0, 0, 255)

include("player_class/player_mc_base.lua")
include("player_class/player_mario.lua")
include("player_class/player_toad.lua")
include("team.lua")

GM.Name = "Mario Chase"
GM.Author = "Dane Johnson"
GM.Email = "daneallenjohnson@protonmail.com"
GM.Website = "danejohnson.org"

GAMESTATE = "pregame"


function GM:Initialize()
   print("Mario Chase initializing...")
end

function GM:PlayerInitialSpawn(ply)
   if GAMESTATE  == "pregame" and team.NumPlayers(MARIO) == 0 then
      ply:SetTeam(MARIO)
      player_manager.SetPlayerClass(ply, "player_mario")
   else
      ply:SetTeam(TOAD)
      player_manager.SetPlayerClass(ply, "player_toad")
   end
   if GAMESTATE == "pregame" and team.NumPlayers(MARIO) > 0
   and team.NumPlayers(TOAD) > 0 then
      self:StartHide()
   end

   if GAMESTATE == "hide" and ply:Team() == TOAD then
      ply:Freeze(true)
   end

   print("Added " .. ply:Nick()  .. " to team " .. ply:Team())
end

function GM:StartHide()
   GAMESTATE = "hide"
   for _, ply in ipairs(player.GetAll()) do
      ply:Spawn()
      if ply:Team() == TOAD then
         ply:Freeze(true)
      end
   end
end

function GM:Think()
   if SERVER then
      for _, ply in ipairs(player.GetAll()) do
         ply:UpdateJumpPoint()
      end
   end
end
