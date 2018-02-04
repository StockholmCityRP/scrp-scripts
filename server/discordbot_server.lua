AddEventHandler('es:chatMessage', function(source, command_args, user)
	PerformHttpRequest('discord_weebhook_url', function(err, text, headers) end, 'POST', json.encode({username = user, content = source}), { ['Content-Type'] = 'application/json' })
end)