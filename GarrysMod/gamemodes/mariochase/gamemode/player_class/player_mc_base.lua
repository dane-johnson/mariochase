DEFINE_BASECLASS("player_default")

local PLAYER = {}

PLAYER.WalkSpeed = 300
PLAYER.RunSpeed = 300

function PLAYER:Loadout()
   -- You get nothing
end

player_manager.RegisterClass("player_mc_base", PLAYER, "player_default")
