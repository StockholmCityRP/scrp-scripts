function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
		}
	else
		return nil
	end
end

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	local name = getIdentity(source)
	local fullName = name.firstname .. " " .. name.lastname
	if sm[1] == "/ooc" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "OOC | " .. fullName, { 128, 128, 128 }, string.sub(msg,5))
	end
	if sm[1] == "//" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "OOC | " .. fullName, { 128, 128, 128 }, string.sub(msg,5))
	end
	if sm[1] == "/twt" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^0[^4Twitter^0] (^5@" .. fullName .. "^0)", { 0, 153, 204 }, string.sub(msg,5))
	end
	if sm[1] == "/me" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "Me | " .. fullName, { 255, 0, 0 }, string.sub(msg,5))
	end
	if sm[1] == "/news" then
		CancelEvent()
                TriggerClientEvent('chatMessage', -1, "News | " .. fullName, { 255, 0, 0 }, string.sub(msg,5))
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
