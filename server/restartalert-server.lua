-- Made by FAXES
AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1) == '/svrlist' then
        TriggerClientEvent('RestartList', player)
        CancelEvent()
    end
end)

AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1) == '/svr 5' then --                        <- Command used to display the message          Message displayed server wide.
        TriggerClientEvent("chatMessage", -1, " \n —————————————————————— \n SERVER RESTART IN 5 MINUTES \n Please Finish Your Current RP Senario \n ——————————————————————", {239, 0, 0})
        CancelEvent()
    end
end)

AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1) == '/svr 10' then --                        <- Command used to display the message          Message displayed server wide.
        TriggerClientEvent("chatMessage", -1, " \n —————————————————————— \n SERVER RESTART IN 10 MINUTES \n Please Finish Your Current RP Senario \n ——————————————————————", {239, 0, 0})
        CancelEvent()
    end
end)

AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1) == '/svr now' then
        TriggerClientEvent("chatMessage", -1, " \n —————————————————————— \n SERVER RESTART IS IN PROGRESS \n Please Rejoin the server  \n ——————————————————————", {239, 0, 0})
        CancelEvent()
    end
end)
-- Made by FAXES