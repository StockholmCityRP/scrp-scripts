RegisterNetEvent('gpstools:setgps')
AddEventHandler('gpstools:setgps', function(pos)

	pos.x = pos.x + 0.0
	pos.y = pos.y + 0.0

	SetNewWaypoint(pos.x, pos.y)
	showHelpNotification("The coords have been added to your GPS!")
end)

function showHelpNotification(text)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayHelp(0, 0, 1, -1)
end 