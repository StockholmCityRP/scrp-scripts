RegisterServerEvent('afkkick:kickplayer')
AddEventHandler('afkkick:kickplayer', function()
	DropPlayer(source, _U('afk_kicked_message'))
end)