ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("afkkick:kickplayer")
AddEventHandler("afkkick:kickplayer", function()
	DropPlayer(source, _U('afk_kicked_message'))
end)