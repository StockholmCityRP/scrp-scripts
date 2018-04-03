Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/ooc',  _U('ooc_help'),  {{name=_U('ooc_argument_name'), help=_U('ooc_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/twt',  _U('twt_help'),  {{name=_U('ooc_argument_name'), help=_U('ooc_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/me',   _U('me_help'),   {{name=_U('ooc_argument_name'), help=_U('ooc_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/news', _U('news_help'), {{name=_U('ooc_argument_name'), help=_U('ooc_argument_help')}})
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/ooc')
		TriggerEvent('chat:removeSuggestion', '/twt')
		TriggerEvent('chat:removeSuggestion', '/me')
		TriggerEvent('chat:removeSuggestion', '/news')
	end
end)