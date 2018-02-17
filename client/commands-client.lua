RegisterNetEvent('commands:getname')
AddEventHandler('commands:getname', function(playerName)
	showHelpNotification(playerName)
end)

RegisterNetEvent('commands:getid')
AddEventHandler('commands:getid', function(source)
	showHelpNotification(_U('gpstools_getid') .. " ~y~" .. GetPlayerServerId(source))
end)

function showHelpNotification(text)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayHelp(0, 0, 1, -1)
end