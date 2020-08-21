DEFINE_BASECLASS("player_mc_base")

local PLAYER = {}

PLAYER.NAME = TOAD

function PLAYER:Loadout()
   self.Player:Give("weapon_stunstick")
end

function PLAYER:Spawn()
   if GAMESTATE == "hide" then
      self.Player:Freeze(true)
   end
end

player_manager.RegisterClass("player_toad", PLAYER, "player_mc_base")
