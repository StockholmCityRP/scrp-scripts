function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]
		return identity['firstname'] .. ' ' .. identity['lastname']
	else
		return 'Unknown'
	end
end

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	local name = getIdentity(source)
	if sm[1] == "/ooc" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "OOC | " .. name, { 128, 128, 128 }, string.sub(msg,5))
	end
	if sm[1] == "/twt" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^0[^4Twitter^0] (^5@" .. name .. "^0)", { 0, 153, 204 }, string.sub(msg,5))
	end
	if sm[1] == "/me" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "Me | " .. name, { 255, 0, 0 }, string.sub(msg,5))
	end
	if sm[1] == "/news" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "News | " .. name, { 255, 0, 0 }, string.sub(msg,5))
	end
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end
