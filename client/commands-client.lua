ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(50)
	end
end)

RegisterNetEvent('commands:lookup')
AddEventHandler('commands:lookup', function(playerName)
	ESX.ShowNotification(_U('commands_lookup', playerName))
end)

RegisterNetEvent('commands:addy')
AddEventHandler('commands:addy', function(y)
	local sourcePed = GetPlayerPed(-1)
	SetEntityCoords(sourcePed, GetEntityCoords(sourcePed) + y)
end)