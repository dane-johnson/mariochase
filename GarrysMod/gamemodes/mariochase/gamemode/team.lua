GM.TeamBased = true -- So we can use all this

function GM:CreateTeams()
   team.SetUp(MARIO, "Mario", RED)
   team.SetSpawnPoint(MARIO, {"info_player_mario"})
   team.SetUp(TOAD, "Toad", BLUE)
   team.SetSpawnPoint(TOAD, {"info_player_toad"})
end

function GM:ChangeMario(new_mario)
   for _, ply in ipairs(player.GetAll()) do
      if ply == new_mario then
         ply:SetTeam(MARIO)
      else
         ply:SetTeam(TOAD)
      end
   end
end
