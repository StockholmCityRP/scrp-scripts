-- Made by FAXES
RegisterNetEvent('RestartList')
AddEventHandler('RestartList', function()
	TriggerEvent("chatMessage", "Restart", {255, 0, 0}, "^3 /svr 5 [Sets 5 mins], /svr 10 [Sets 10 mins], /svr now [Restart Now]")
--		^->^ Edit the list if you wish            ^This sets the color                     ^List
	end)
-- Made by FAXES