local second = 1000
local minute = 60 * second

Citizen.CreateThread(function()
	Citizen.Wait(0.5 * minute)
	print("Servern har varit levande i 30 sekunder!")
end)