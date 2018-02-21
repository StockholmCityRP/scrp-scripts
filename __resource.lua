-- https://wiki.fivem.net/wiki/Resource_manifest

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'An series of scripts'

version '1.0.0'

-- server scripts
server_scripts {
	"@mysql-async/lib/MySQL.lua",
	"@es_extended/locale.lua",
	"locates/en.lua",
	"locates/sv.lua",
	"config.lua",
	"server/deletepoliceweapons-server.lua",
	"server/deletevehicle-server.lua",
	"server/ooc-server.lua",
	"server/afkkick-server.lua",
	"server/discordbot_server.lua",
	"server/gpstools-server.lua",
	"server/commands-server.lua",
	"server/restart_alert-server.lua"
}

-- client scripts
client_scripts {
	"@es_extended/locale.lua",
	"locates/en.lua",
	"locates/sv.lua",
	"config.lua",
	"client/fixtraffic-client.lua",
	"client/NoNPCDrop-client.lua",
	"client/deletepoliceweapons-client.lua",
	"client/pointfinger-client.lua",
	"client/deletevehicle-client.lua",
	"client/speed_limit-client.lua",
	"client/NoDriveBy-client.lua",
	"client/afkkick-client.lua",
	"client/handsup-client.lua",
	"client/gpstools-client.lua",
	"client/commands-client.lua",
	"client/ooc-client.lua"
	"client/ragdoll-client.lua",
}
