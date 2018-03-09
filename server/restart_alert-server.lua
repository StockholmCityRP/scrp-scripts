local second = 1000
local minute = 60 * second

Citizen.CreateThread(function()
	while true do
		SetTimeout(30 * minute, function()
			TriggerClientEvent('chatMessage', -1, "Restart: ", { 0, 0, 0 }, "00, 04, 08, 12, 16, 20")
		end)
	end
end)