TriggerEvent('es:addGroupCommand', 'setgps', 'user', function(source, args, user)

  TriggerClientEvent("gpstools:setgps", source, {
    x = tonumber(args[1]),
    y = tonumber(args[2])
  })

end, function(source, args, user)
  TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Sets the GPS to the specefied coords", params = {{name = "x", help = "X coords"}, {name = "y", help = "Y coords"}}})
