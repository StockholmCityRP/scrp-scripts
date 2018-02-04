-------------------------------------------------------------------------------
-- Title: Speed limiter.
-- Author: Serpico -- twitch.tv/SerpicoTV
-- Description: This script will restict the speed of the vehicle when
--              INPUT_MP_TEXT_CHAT_TEAM is pressed. To disable, press
--              INPUT_VEH_SUB_ASCEND + INPUT_MP_TEXT_CHAT_TEAM
-------------------------------------------------------------------------------

Citizen.CreateThread(function()
	local resetSpeedOnEnter = true
	while true do
		Citizen.Wait(0)
		local playerPed = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(playerPed,false)

		-- This should only happen on vehicle first entry to disable any old values
		if GetPedInVehicleSeat(vehicle, -1) == playerPed and IsPedInAnyVehicle(playerPed, false) then
			if resetSpeedOnEnter then
				maxSpeed = GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel")
				SetEntityMaxSpeed(vehicle, maxSpeed)
				resetSpeedOnEnter = false
			end
			-- Disable speed limiter
			if IsControlJustReleased(0,246) and IsControlPressed(0,131) then
				maxSpeed = GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel")
				SetEntityMaxSpeed(vehicle, maxSpeed)
				showHelpNotification("Hastighetsbegränsare inaktiverad")
			-- Enable speed limiter
			elseif IsControlJustReleased(0,246) then
				cruise = GetEntitySpeed(vehicle)
				SetEntityMaxSpeed(vehicle, cruise)
				cruise = math.floor(cruise * 3.6 + 0.5)
				showHelpNotification("Hastighetsbegränsare inställd på "..cruise.." km/h, tryck ~INPUT_VEH_SUB_ASCEND~ + ~INPUT_MP_TEXT_CHAT_TEAM~ för att inaktivera.")
			end
		else
			resetSpeedOnEnter = true
		end
	end
end)

function showHelpNotification(msg)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandDisplayHelp(0, 0, 1, -1)
end