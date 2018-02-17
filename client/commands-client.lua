Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(50)
	end
end)

RegisterNetEvent('commands:lookup')
AddEventHandler('commands:lookup', function(playerName)
	ESX.ShowNotification(_U('commands_lookup') .. " ~b~" .. playerName)
end)

RegisterNetEvent('commands:getid')
AddEventHandler('commands:getid', function(source)
	ESX.ShowNotification(_U('commands_getid') .. " ~y~" .. GetPlayerServerId(source))
end)