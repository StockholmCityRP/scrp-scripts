-- Made by FAXES
AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1) == '/svrlist' then
        TriggerClientEvent('RestartList', player)
        CancelEvent()
    end
end)

AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1) == '/svr 5' then --                        <- Command used to display the message          Message displayed server wide.
        TriggerClientEvent("chatMessage", -1, " \n —————————————————————— \n SERVER RESTART OM 5 MINUTER \n Kör klart ditt pågående RP scenario och ta dig till ett garage! \n ——————————————————————", {239, 0, 0})
        CancelEvent()
    end
end)

AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1) == '/svr 10' then --                        <- Command used to display the message          Message displayed server wide.
        TriggerClientEvent("chatMessage", -1, " \n —————————————————————— \n SERVER RESTART OM 10 MINUTER \n Kör klart ditt pågående RP scenario och ta dig till ett garage! \n ——————————————————————", {239, 0, 0})
        CancelEvent()
    end
end)

AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1) == '/svr now' then
        TriggerClientEvent("chatMessage", -1, " \n —————————————————————— \n SERVER RESTART PÅGÅR \n Var snäll att logga ut från servern!  \n ——————————————————————", {239, 0, 0})
        CancelEvent()
    end
end)

AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1) == '/svr 30' then
        TriggerClientEvent("chatMessage", -1, " \n —————————————————————— \n SERVER RESTART OM 30 SEKUNDER \n Var snäll att logga ut från servern!  \n ——————————————————————", {239, 0, 0})
        CancelEvent()
    end
end)
-- Made by FAXES
