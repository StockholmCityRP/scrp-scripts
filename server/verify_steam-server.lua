-- https://forum.fivem.net/t/want-to-only-allow-players-authenticated-with-a-third-party-provider-like-steam/57846/2
-- Modified version! The one above is 100% broken

AddEventHandler('playerConnecting', function(name, setCallback, deferrals)
	-- mark this connection as deferred, this is to prevent problems while checking player identifiers.
	deferrals.defer()

	-- save source
	local s = source

	-- letting the user know what's going on.
	deferrals.update("Checking for steam identifier...")

	-- Needed, not sure why.
	Citizen.Wait(100)

	-- check for steam identifier
	local allowed = false
	local steamNumber
	for number,id in ipairs(GetPlayerIdentifiers(s)) do
		if string.find(id, "steam:") then
			allowed = true -- if the identifier is a steam identifier, allow the player.
			steamNumber = number -- verify the array order
			break
		end
	end

	if allowed and steamNumber == 1 then
		deferrals.done()
	elseif steamNumber ~= 1 then
		deferrals.done("Your Steam identifier was found, but the identifier order is all wrong! For security reasons we cannot let you in the server, please try restarting Steam / FiveM / your computer")
	else
		deferrals.done("Could not verify your Steam session! For security reasons you cannot be let in to the server, make sure Steam is running and try again. If the problem persists then you will have to contact the staff of this server.")
	end
end)