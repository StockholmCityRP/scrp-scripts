TriggerEvent('es:addGroupCommand', 'lookup', 'user', function(source, args, user)
	if args[1] and GetPlayerName(tonumber(args[1]))then
		TriggerClientEvent("commands:lookup", source, GetPlayerName(tonumber(args[1])))
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Get someones name from their server ID", params = {{name = "id", help = "player id"}}})

TriggerEvent('es:addGroupCommand', 'id', 'user', function(source, args, user)
	TriggerClientEvent('chatMessage', source, _U('commands_getid'), {239, 137, 47}, source)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Returns your server id, usally what staff will ask you"})