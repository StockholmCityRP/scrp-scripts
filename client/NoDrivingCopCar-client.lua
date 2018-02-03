Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedInAnyPoliceVehicle(GetPlayerPed(PlayerId())) then
            local veh = GetVehiclePedIsUsing(GetPlayerPed(PlayerId()), false)
            if (GetPedInVehicleSeat(veh, -1) == GetPlayerPed(PlayerId())) then
                if (PlayerData.job ~= nil and (PlayerData.job.name ~= 'police' or PlayerData.job.name ~= 'ambulance')) then
                  ESX.ShowNotification("Civiler får inte åka runt i polisbilar!")
                  SetVehicleUndriveable(veh, true)
                end
            end
        end
    end
end)