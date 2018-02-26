-- https://wiki.fivem.net/wiki/Weapons
local vehWeapons = {
	0x1D073A89, -- WEAPON_PUMPSHOTGUN
	0x83BF0278, -- WEAPON_CARBINERIFLE
	0x05FC3C11, -- WEAPON_SNIPERRIFLE
	0x678B81B1, -- WEAPON_NIGHTSTICK
}

local hasBeenInPoliceVehicle = false

local alreadyHaveWeapon = {}

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(10)

		if(IsPedInAnyPoliceVehicle(GetPlayerPed(-1))) then
			if(not hasBeenInPoliceVehicle) then
				hasBeenInPoliceVehicle = true
			end
		else
			if(hasBeenInPoliceVehicle) then
				for i,k in pairs(vehWeapons) do
					if(not alreadyHaveWeapon[i]) then
						RemoveWeaponFromPed(GetPlayerPed(-1), k)
					end
				end
				hasBeenInPoliceVehicle = false
			end
		end

	end

end)

Citizen.CreateThread(function()

	while true do
		if(not IsPedInAnyVehicle(GetPlayerPed(-1))) then
			for i=1,#vehWeapons do
				if(HasPedGotWeapon(GetPlayerPed(-1), vehWeapons[i], false)==1) then
					alreadyHaveWeapon[i] = true
				else
					alreadyHaveWeapon[i] = false
				end
			end
		end
		Citizen.Wait(5000)
	end

end)