-- source https://forum.fivem.net/t/help-stop-npc-to-attack/77864/2?u=hawaii_beach
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		SetEveryoneIgnorePlayer(PlayerId(), true)
		SetPlayerCanBeHassledByGangs(PlayerId(), true)
	end
end)