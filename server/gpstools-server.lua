TriggerEvent('es:addGroupCommand', 'setgps', 'user', function(source, args, user)
	TriggerClientEvent("gpstools:setgps", source, {
		x = tonumber(args[1]),
		y = tonumber(args[2])
})

end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Sets the GPS to the specefied coords", params = {{name = "x", help = "X coords"}, {name = "y", help = "Y coords"}}})

TriggerEvent('es:addGroupCommand', 'getpos', 'user', function(source, args, user)
	TriggerClientEvent("gpstools:getpos", source, args)

end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Gets the player's current position", params = { name = "id", help = "player id" }})

