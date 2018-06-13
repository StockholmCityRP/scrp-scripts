local secondsUntilKick = 1200 -- AFK kick time limit in seconds
local kickWarning = true      -- Warn players if 3/4 of the Time Limit ran up
local timer = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)
			if currentPos == prevPos then
				if timer > 0 then
					if kickWarning and timer == math.ceil(secondsUntilKick / 4) then
						TriggerEvent("chatMessage", _U('afk'), {169, 208, 214}, _U('afk_warning', timer))
					end

					timer = timer - 1
				else
					TriggerServerEvent('afkkick:kickplayer')
				end
			else
				timer = secondsUntilKick
			end
			prevPos = currentPos
		end
	end
end)