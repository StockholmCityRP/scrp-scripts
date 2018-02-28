Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        DisablePlayerVehicleRewards(PlayerId())
    end
end)