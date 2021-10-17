Config                            = {}
Config.DrawDistance               = 10
Config.MarkerColor                = {r = 120, g = 120, b = 240}
Config.EnablePlayerManagement     = true -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.ResellPercentage           = 50

Config.Locale                     = 'fr'

Config.LicenseEnable = false -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.Zones = {

	ShopEntering = {
		Pos   = vector3(-793.39, -220.32, 36.08),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = 1
	},

	ShopInside = {
		Pos     = vector3(-787.6650, -242.1929, 37.0796),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 88.43,
		Type    = -1
	},

	ShopOutside = {
		Pos     = vector3(-783.89, -223.68, 36.32),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 330.0,
		Type    = -1
	},

	BossActions = {
		Pos   = vector3(-788.69, -216.02, 36.08),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},

	GiveBackVehicle = {
		Pos   = vector3(-763.73, -242.64, 36.24),
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Type  = (Config.EnablePlayerManagement and 1 or -1)
	},

	ResellVehicle = {
		Pos   = vector3(-767.9, -234.53, 36.08),
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Type  = 1
	}

}