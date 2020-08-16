DEFINE_BASECLASS("player_default")

local PLAYER = {}

PLAYER.Name = "Mario"

PLAYER.MaxHealth = 30
PLAYER.StartHealth = 30
PLAYER.CrouchedWalkSpeed = 1.0

player_manager.RegisterClass("player_mario", PLAYER, "player_mc_base")
