AddEventHandler('es:chatMessage', function(source, command_args, user)
	local data = json.encode({
		username = GetPlayerName(source),
		content  = command_args
	})

	PerformHttpRequest(GetConvar("chat_webhook", "none"), function(err, text, headers) end, 'POST', data, { ['Content-Type'] = 'application/json' })
end)