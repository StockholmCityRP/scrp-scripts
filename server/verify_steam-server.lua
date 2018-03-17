-- https://forum.fivem.net/t/want-to-only-allow-players-authenticated-with-a-third-party-provider-like-steam/57846/2

AddEventHandler('playerConnecting', function(name, setCallback, deferrals)
	-- mark this connection as deferred, this is to prevent problems while checking player identifiers.
	deferrals.defer()

	-- letting the user know what's going on.
	deferrals.update("Checking for steam identifier...")

	-- save source
	local s = source

	-- check for steam identifier
	local allowed = false
	for id in ipairs(GetPlayerIdentifiers(s)) do
		if string.find(id, "steam:") then allowed = true end -- if the identifier is a steam identifier, allow the player.
	end

	if allowed then
		deferrals.done()
	else
		deferrals.done("Could not verify your Steam session! For security reasons you cannot be let in to the server, make sure Steam is running and try again. If the problem persists then you will have to contact the staff of this server.")
	end
end)