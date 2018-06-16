AddEventHandler('esx:playerLoaded', function(source)
	TriggerClientEvent('esx:showNotification', -1, _U('message_joined', GetPlayerName(source)))
end)

AddEventHandler('esx:playerDropped', function(reason)
	if reason ~= "Disconnected." then
		TriggerClientEvent('esx:showNotification', -1, _U('message_left_reason', GetPlayerName(source), reason))
	else
		TriggerClientEvent('esx:showNotification', -1, _U('message_left', GetPlayerName(source)))
	end
end)