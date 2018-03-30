TriggerEvent('es:addGroupCommand', 'setgps', 'user', function(source, args, user)
	TriggerClientEvent("gpstools:setgps", source, {
		x = tonumber(args[1]),
		y = tonumber(args[2])
	})
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Sets the GPS to the specified coords", params = {{name = "x", help = "X coords"}, {name = "y", help = "Y coords"}}})

TriggerEvent('es:addGroupCommand', 'getpos', 'user', function(source, args, user)
	TriggerClientEvent("gpstools:getpos", source)

end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Gets the player's current position"})

TriggerEvent('es:addGroupCommand', 'togglegps', 'user', function(source, args, user)
	TriggerClientEvent("gpstools:togglegps", source)

end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Toggle the big gps"})

TriggerEvent('es:addGroupCommand', 'tpwaypoint', 'admin', function(source, args, user)
	TriggerClientEvent("gpstools:tpwaypoint", source, args[1])

end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "TP to the way-point selected on GPS", params = {{name = "y compensation", help = "compensate the Y coords so that you don't fall through the world until the game realizes it and puts you back."}}})