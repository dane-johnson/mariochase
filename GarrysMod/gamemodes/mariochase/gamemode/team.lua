local MARIO = 1
local RED = Color(255, 0, 0)
local TOAD = 2
local BLUE = Color(0, 0, 255)


team.SetUp(MARIO, "Mario", RED)
team.SetSpawnPoint(MARIO, {"info_player_mario"})
team.SetUp(TOAD, "Toad", BLUE)
team.SetSpawnPoint(TOAD, {"info_player_toad"})
