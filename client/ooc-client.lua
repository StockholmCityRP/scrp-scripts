Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/ooc',  _U('ooc_help'),  {{name=_U('ooc_argument_name'), help=_U('ooc_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/twt',  _U('twt_help'),  {{name=_U('ooc_argument_name'), help=_U('ooc_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/me',   _U('me_help'),   {{name=_U('ooc_argument_name'), help=_U('ooc_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/nyheterna', _U('news_help'), {{name=_U('ooc_argument_name'), help=_U('ooc_argument_help')}})
end)
