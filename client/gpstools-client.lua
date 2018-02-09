local isMinimapEnabled = false

RegisterNetEvent('gpstools:setgps')
AddEventHandler('gpstools:setgps', function(pos)

	pos.x = pos.x + 0.0
	pos.y = pos.y + 0.0

	SetNewWaypoint(pos.x, pos.y)
	showHelpNotification("The coords have been added to your GPS!")
end)

RegisterNetEvent('gpstools:getpos')
AddEventHandler('gpstools:getpos', function()
	local pos = GetEntityCoords(GetPlayerPed(-1))
	local formattedText = "x: " .. pos.x .. ", y: " .. pos.y .. ", z: " .. pos.z
	TriggerEvent('chatMessage', 'SYSTEM', { 0, 0, 0 }, formattedText)
end)

RegisterNetEvent('gpstools:getid')
AddEventHandler('gpstools:getid', function()
	showHelpNotification("Your id is: todo")
end)

RegisterNetEvent('gpstools:togglegps')
AddEventHandler('gpstools:togglegps', function()
	if not isMinimapEnabled then
		SetRadarBigmapEnabled(true, false)
		isMinimapEnabled = true
	else
		SetRadarBigmapEnabled(false, false)
		isMinimapEnabled = false
	end
end)

function showHelpNotification(text)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayHelp(0, 0, 1, -1)
end