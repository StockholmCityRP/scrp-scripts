Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local player = GetPlayerPed(-1)
		if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(player))) then
			local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(player))
			local lock = GetVehicleDoorLockStatus(veh)

			if lock == 7 then
				SetVehicleDoorsLocked(veh, 2)
			end

			local pedd = GetPedInVehicleSeat(veh, -1)

			if pedd then
				SetPedCanBeDraggedOut(pedd, false)
			end
		end
	end
end)