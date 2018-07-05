ESX = nil
local isMinimapEnabled = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(50)
	end
end)

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
		local coord = GetBlipInfoIdCoord(blip)
		local groundFound = false
		local groundCheckHeights = {0.0, 50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 350.0, 400.0,450.0, 500.0, 550.0, 600.0, 650.0, 700.0, 750.0, 800.0}
		local coordZ
		for i, height in ipairs(groundCheckHeights) do
			RequestCollisionAtCoord(coord.x, coord.y, height)
			Citizen.Wait(0)

			SetEntityCoordsNoOffset(playerPed, coord.x, coord.y, height, 0, 0, 1)

			local foundGround, z = GetGroundZFor_3dCoord(coord.x, coord.y, height)
			if foundGround then
				coordZ = z + 3
				groundFound = true
				break
			end
		end
	
		if not groundFound then
			coordZ = 100
			TriggerEvent('esx:addWeapon', 'GADGET_PARACHUTE', 0)
		end

		SetEntityCoordsNoOffset(playerPed, coord.x, coord.y, coordZ, 0, 0, 1)
		
	else
		showHelpNotification(_U('gpstools_tp_no_waypoint'))
	end
end)

function showHelpNotification(text)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayHelp(0, 0, 1, -1)
end