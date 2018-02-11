-- CONFIG --

-- AFK Kick Time Limit (in seconds)
secondsUntilKick = 600

-- Warn players if 3/4 of the Time Limit ran up
kickWarning = true

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1000)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if time > 0 then
					if kickWarning and time == math.ceil(secondsUntilKick / 4) then
						TriggerEvent("chatMessage", "WARNING", {255, 0, 0}, _U('afk_warning_1') .. time .. _U('afk_warning_2'))
					end

					time = time - 1
				else
					TriggerServerEvent("afkkick:kickplayer")
				end
			else
				time = secondsUntilKick
			end

			prevPos = currentPos
		end
	end
end)