-- Modified version from Scammer's id over head + blip

Citizen.CreateThread(function()
	
	--Wait just a bit so that everything can load
	Citizen.Wait(2000)
	
	while true do
	
		-- For every active player in a 32 slot server
		for id = 0, 31 do
			
			-- Is the player connected and not the same as the source?
			if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= GetPlayerPed(-1) and GetPlayerName(id) ~= nil then
				
				-- Is the source near the target, and is there a clear view? (so that people cannot see IDs through walls etc)
				if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(GetPlayerPed(id))) < 15.0001) and HasEntityClearLosToEntity(GetPlayerPed(-1), GetPlayerPed(id), 17) then
					
					-- Create head display (this is safe to be spammed)
					headId = Citizen.InvokeNative(0xBFEFE3321A3F5015, GetPlayerPed(id), ' ' .. GetPlayerServerId(id), false, false, "", false)
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
		Citizen.Wait(1000)
	end
end)