RegisterServerEvent("afkkick:kickplayer")
AddEventHandler("afkkick:kickplayer", function()
	DropPlayer(source, "You have been kicked for being AFK.")
end)