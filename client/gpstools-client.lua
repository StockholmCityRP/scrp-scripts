local isMinimapEnabled = false

RegisterNetEvent('gpstools:setgps')
AddEventHandler('gpstools:setgps', function(pos)
	-- add required decimal or else it wont work
	pos.x = pos.x + 0.00
	pos.y = pos.y + 0.00
	
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
	local blip = GetFirstBlipInfoId(8)

	if DoesBlipExist(blip) then
		--local coord = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
		local coord = GetBlipInfoIdCoord(blip)
		SetEntityCoords(playerPed, coord.x, coord.y, coord.z)
		ClearPedTasksImmediately(playerPed)
		SetEntityCoords(playerPed, coord.x, coord.y, coord.z)

		RequestCollisionAtCoord(coord.x, coord.y, coord.z)
		while not HasCollisionLoadedAroundEntity(playerPed) do
			Citizen.Wait(0)
			RequestCollisionAtCoord(coord.x, coord.y, coord.z)
		end
	else
		showHelpNotification(_U('gpstools_tp_no_waypoint'))
	end
end)

function showHelpNotification(text)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayHelp(0, 0, 1, -1)
end