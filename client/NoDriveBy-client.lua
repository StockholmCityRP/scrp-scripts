Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		playerPed = GetPlayerPed(-1)
		car = GetVehiclePedIsIn(playerPed, false)
		if car then
			SetPlayerCanDoDriveBy(PlayerId(), false)
		end
	end
end)