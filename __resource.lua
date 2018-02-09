-- https://wiki.fivem.net/wiki/Resource_manifest

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'An series of scripts'

version '1.0.0'

-- server scripts
server_scripts {
	"@mysql-async/lib/MySQL.lua",
	"server/deletepoliceweapons-server.lua",
	"server/deletevehicle-server.lua",
	"server/ooc-server.lua",
	"server/afkkick-server.lua",
	"server/discordbot_server.lua",
	"server/gpstools-server.lua"
}

-- client scripts
client_scripts {
	"client/fixtraffic-client.lua",
	"client/NoDrivingCopCar-client.lua",
	"client/NoNPCDrop-client.lua",
	"client/deletepoliceweapons-client.lua",
	"client/pointfinger-client.lua",
	"client/deletevehicle-client.lua",
	"client/speed_limit-client.lua",
	"client/NoDriveBy-client.lua",
	"client/idhead_client.lua",
	"client/afkkick-client.lua",
	"client/handsup-client.lua",
	"client/gpstools-client.lua"
}