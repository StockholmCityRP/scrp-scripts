secondsUntilKick = 1200 -- AFK kick time limit in seconds
kickWarning = true      -- Warn players if 3/4 of the Time Limit ran up

Citizen.CreateThread(function()
	while true do
		Wait(1000)
		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)
			if currentPos == prevPos then
				if time > 0 then
					if kickWarning and time == math.ceil(secondsUntilKick / 4) then
						TriggerEvent("chatMessage", _U('afk'), {169, 208, 214}, _U('afk_warning', time))
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