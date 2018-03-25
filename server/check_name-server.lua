AddEventHandler('playerConnecting', function(name, setCallback, deferrals)
	-- Mark this connection as deferred, this is to prevent problems while checking player identifiers.
	deferrals.defer()
	
	-- Save source in case we somehow lose it (which happens a lot)
	local _source = source
	
	-- Letting the user know what's going on.
	deferrals.update('Validating player name . . .')
	
	-- Needed, not sure why.
	Citizen.Wait(100)
	
	local playerName = GetPlayerName(_source)
	local allowed    = true
	local reason     = nil
	
	-- Check if player name is empty
	if playerName == nil then
		playerName = 'unknown'
		reason = 'unknown player name, please wait until attempting to connect again'
		allowed = false
	end
	
	-- Don't allow short user names
	local nameLength = string.len(playerName)
	if nameLength > 25 or nameLength < 7 then
		if reason == nil then
			reason = 'your player name is too short or too long. The name limit min: 7 | max: 25.'
		end
		allowed = false
	end
	
	-- Don't allow special characters (doesn't always work)
	local count = 0
	for i in playerName:gmatch('[abcdefghijklmnopqrstuvwxyzåäöABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789 -]') do
		count = count + 1
	end
	if count ~= nameLength then
		if reason == nil then
			reason = 'your player name contains special characters that are not allowed on this server.'
		end
		allowed = false
	end
	
	-- Does the player carry a first and last name?
	-- 
	-- Example:
	-- Allowed:     'Bob Joe'
	-- Not allowed: 'Bob'
	-- Not allowed: 'Bob joe'
	local spacesInName    = 0
	local spacesWithUpper = 0
	for word in string.gmatch(playerName, '%S+') do
	
		if string.match(word, '%u') then
			spacesWithUpper = spacesWithUpper + 1
		end
	
		spacesInName = spacesInName + 1
	end
	
	if spacesInName < 2 then
		if reason == nil then
			reason = 'your player name does not contain a first and last name.'
		end
		allowed = false
	end
	
	if spacesWithUpper ~= spacesInName then
		if reason == nil then
			reason = 'your first and surname must start with a capital letter.'
		end
		allowed = false
	end
	
	if allowed then
		deferrals.done()
	else
		deferrals.done('You cannot connect with your current player name. Reason: ' .. reason .. ' If you belive that something is wrong, please contact the SCRP staff')
	end
end)