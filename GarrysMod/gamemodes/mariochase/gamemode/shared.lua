include("player_class/player_mc_base.lua")
include("team.lua")

GM.Name = "Mario Chase"
GM.Author = "Dane Johnson"
GM.Email = "daneallenjohnson@protonmail.com"
GM.Website = "danejohnson.org"

function GM:Initialize()
   print("Mario Chase initializing...")
end

function GM:Think()
   if SERVER then
      for _, ply in ipairs(player.GetAll()) do
         ply:UpdateJumpPoint()
      end
   end
end
