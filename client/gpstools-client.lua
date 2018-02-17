local isMinimapEnabled = false

RegisterNetEvent('gpstools:setgps')
AddEventHandler('gpstools:setgps', function(pos)
	SetNewWaypoint(pos.x, pos.y)
	showHelpNotification(_U('gpstools_setgps_ok'))
end)

RegisterNetEvent('gpstools:getpos')
AddEventHandler('gpstools:getpos', function()
	local pos = GetEntityCoords(GetPlayerPed(-1))
	local formattedText = "x: " .. pos.x .. ", y: " .. pos.y .. ", z: " .. pos.z
	TriggerEvent('chatMessage', 'SYSTEM', { 0, 0, 0 }, formattedText)
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

RegisterNetEvent('gpstools:tpwaypoint')
AddEventHandler('gpstools:tpwaypoint', function()
	local playerPed = GetPlayerPed(-1)
	local WaypointHandle = GetFirstBlipInfoId(8)
	if DoesBlipExist(WaypointHandle) then
		local coord = Citizen.InvokeNative(0xFA7C7F0AADF25D09, WaypointHandle, Citizen.ResultAsVector())
		SetEntityCoords(playerPed, coord.x, coord.y, coord.z)
	else
		showHelpNotification(_U('gpstools_tp_no_waypoint'))
	end
end)

function showHelpNotification(text)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayHelp(0, 0, 1, -1)
end