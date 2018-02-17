RegisterNetEvent('commands:getname')
AddEventHandler('commands:getname', function(playerName)
	showHelpNotification(playerName)
end)

function showHelpNotification(text)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayHelp(0, 0, 1, -1)
end