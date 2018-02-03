Citizen.CreateThread(function()
    while true
        do
            -- 1.
        SetVehicleDensityMultiplierThisFrame(0.5)
        --SetPedDensityMultiplierThisFrame(0.2)
        --SetRandomVehicleDensityMultiplierThisFrame(1.0)
        --SetParkedVehicleDensityMultiplierThisFrame(1.0)
        --SetScenarioPedDensityMultiplierThisFrame(2.0, 2.0)
       
        --local playerPed = GetPlayerPed(-1)
        --local pos = GetEntityCoords(playerPed)
        --RemoveVehiclesFromGeneratorsInArea(pos['x'] - 900.0, pos['y'] - 900.0, pos['z'] - 900.0, pos['x'] + 900.0, pos['y'] + 900.0, pos['z'] + 900.0);
       
       
        -- 2.
        --SetGarbageTrucks(0)
        --SetRandomBoats(0)
        --SetRandomBus(0)
        Citizen.Wait(2)
    end
 
end)