-- Modified version from Scammer's id over head + blip

Citizen.CreateThread(function()
	local sourcePed = GetPlayerPed(-1)
	local targetPed
	
	while true do
	
		-- For every active player in a 32 slot server
		for id = 0, 31 do
			targetPed = GetPlayerPed(id)
			
			-- Is the player connected and not the same as the source?
			if NetworkIsPlayerActive(id) and targetPed ~= GetPlayerPed(-1) then
				
				-- Is the source near the target, and is there a clear view? (so that people cannot see IDs through walls etc)
				if (GetDistanceBetweenCoords(GetEntityCoords(sourcePed), GetEntityCoords(targetPed)) < 15.0001) and HasEntityClearLosToEntity(sourcePed, targetPed, 17) then
					
					-- Create head display (this is safe to be spammed)
					headId = Citizen.InvokeNative(0xBFEFE3321A3F5015, targetPed, ' ' .. GetPlayerServerId(id), false, false, "", false)
					Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, true)
					
					-- Speaking display
					Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 9, NetworkIsPlayerTalking(id))
				else
					-- Remove blip as the player is too far away
					Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, false)
				end
			end
		end
		
		-- We can wait two seconds without losing anything, you do NOT want to run this every 10 frames like other people have done...
		Citizen.Wait(2000)
	end
end)