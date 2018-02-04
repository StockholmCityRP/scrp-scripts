-- https://wiki.fivem.net/wiki/Resource_manifest

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'An series of scripts'

version '1.0.0'

-- server scripts
server_scripts {
	"server/deletepoliceweapons-server.lua",
	"server/deletevehicle-server.lua"
}

-- client scripts
client_scripts {
	"client/handsup-client.lua",
	"client/fixtraffic-client.lua",
	"client/NoDrivingCopCar-client.lua",
	"client/NoNPCDrop-client.lua",
	"client/deletepoliceweapons-client.lua",
	"client/pointfinger-client.lua",
	"client/deletevehicle-client.lua",
	"client/speed_limit-client.lua",
	"client/NoDriveBy-client.lua",
	"client/idhead_client.lua"
}