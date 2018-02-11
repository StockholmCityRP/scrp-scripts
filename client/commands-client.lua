RegisterNetEvent('commands:getname')
AddEventHandler('commands:getname', function(target)
	showHelpNotification(GetPlayerName(target))
end)

function showHelpNotification(text)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayHelp(0, 0, 1, -1)
end