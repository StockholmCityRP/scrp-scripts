RegisterServerEvent("PoliceVehicleWeaponDeleter:askDropWeapon")
AddEventHandler("PoliceVehicleWeaponDeleter:askDropWeapon", function(wea)
	TriggerClientEvent("PoliceVehicleWeaponDeleter:drop", source, wea)
end)