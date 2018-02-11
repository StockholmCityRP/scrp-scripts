Citizen.CreateThread(function()
	while true do
		Wait(1)
		playerPed = GetPlayerPed(-1)
		car = GetVehiclePedIsIn(playerPed, false)
		if car then
			SetPlayerCanDoDriveBy(PlayerId(), false)
		end
	end
end)