local second = 1000
local minute = 60 * second

Citizen.CreateThread(function()
	Citizen.Wait(60 * minute)
	sendAlert()
	Citizen.Wait(60 * minute)
	sendAlert()
	Citizen.Wait(60 * minute)
	sendAlert()
	Citizen.Wait(30 * minute)
	sendAlert()
	Citizen.Wait(15 * minute)
	sendAlert()
	Citizen.Wait(10 * minute)
	sendAlert()
end)

function sendAlert()
	TriggerClientEvent('chatMessage', -1, "Restart: ", { 0, 0, 0 }, "00, 04, 08, 12, 16, 20")
end