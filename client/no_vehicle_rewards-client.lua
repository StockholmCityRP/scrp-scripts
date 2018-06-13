Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		DisablePlayerVehicleRewards(PlayerId())
	end
end)