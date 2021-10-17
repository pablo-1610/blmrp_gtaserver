Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 31
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 151, g = 134, b = 67 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true -- only turn this on if you are using esx_license
Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.ArmyStations = {

	ARMY = {

		Blip = {
			Pos     = { x = 4969.971, y = -5143.38, z = 2.46 },
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 17,
		},
		-- https://wiki.fivem.net/wiki/Weapons
		AuthorizedWeapons = {

			{ name = 'WEAPON_NIGHTSTICK',     price = 500 },
                        { name = 'weapon_combatmg',       price = 500 },
                        
                      
                        { name = 'weapon_rpg',            price = 500 },
			{ name = 'WEAPON_COMBATPISTOL',   price = 500 },
			{ name = 'WEAPON_ASSAULTSMG',     price = 500 },
			{ name = 'WEAPON_SAWNOFFSHOTGUN', price = 500 },
			{ name = 'WEAPON_STUNGUN',        price = 500 },
			{ name = 'WEAPON_CARBINERIFLE',   price = 500 },
                        { name = 'WEAPON_SNIPERRIFLE',    price = 500 },

		},

		Cloakrooms = {
			{ x = 4925.256, y = -5243.536, z = 2.52 },
		},

		Armories = {
			{ x = 5000.25, y = -5166.0, z = 2.76 },
		},

		Vehicles = {
			{
				Spawner    = { x = 4993.112, y = -5193.185, z = 2.507 },
				SpawnPoint = { x = 4986.106, y = -5104.103, z = 2.58 },
				Heading    = 334.0,
			}
		},

		Helicopters = {
			{
				Spawner    = { x = 4979.035, y = -5103.042, z = 2.91 },
				SpawnPoint = { x = -2478.04, y =  3261.14, z = 149.291 },
				Heading    = 0.0,
			}
		},

		VehicleDeleters = {
			{ x = 5014.32, y = -5176.52, z = 2.51 },
			{ x = 5014.32, y = -5176.52, z = 2.51 },

		},

		BossActions = {
			{ x = 4954.315, y = -5108.34, z = 3.77 }
		},

	},

}

-- https://wiki.fivem.net/wiki/Vehicles
Config.AuthorizedVehicles = {
	Shared = {
		{
			model = 'barrage',
			label = 'Voiture de l armé'
		},

                {
			model = 'hunter',
			label = 'Helicopters'
		},


		{
			model = 'vetir',
			label = 'Camion Transports d unités'
		},

		{
			model = 'khanjali',
			label = 'Tank de l armé '
		},

		{
			model = 'insurgent2',
			label = 'Insurgent'
		},

	},

	recruit = {

	},

	officer = {

	},

	sergeant = {

	},

	lieutenant = {
	},

	boss = {

	}
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	cadet_wear = {
		male = {
			['tshirt_1'] = 131,  ['tshirt_2'] = 10,
			['torso_1'] = 221,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 106,		['arms2'] = 7,
			['pants_1'] = 87,   ['pants_2'] = 5,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0	
	},
		female = {
			['tshirt_1'] = 131,  ['tshirt_2'] = 10,
			['torso_1'] = 221,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 87,   ['pants_2'] = 5,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0	
		}
	},
	army_wear = {
		male = {
			['tshirt_1'] = 131,  ['tshirt_2'] = 10,
			['torso_1'] = 221,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 87,   ['pants_2'] = 5,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0	
		},
		female = {
			['tshirt_1'] = 131,  ['tshirt_2'] = 10,
			['torso_1'] = 221,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 87,   ['pants_2'] = 5,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0	
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 131,  ['tshirt_2'] = 10,
			['torso_1'] = 221,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 87,   ['pants_2'] = 5,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0	
		},
		female = {
			['tshirt_1'] = 131,  ['tshirt_2'] = 10,
			['torso_1'] = 221,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 87,   ['pants_2'] = 5,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0	
		}
	},
	lieutenant_wear = {
		male = {
			['tshirt_1'] = 131,  ['tshirt_2'] = 10,
			['torso_1'] = 221,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 87,   ['pants_2'] = 5,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0	
		},
		female = {
			['tshirt_1'] = 131,  ['tshirt_2'] = 10,
			['torso_1'] = 221,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 87,   ['pants_2'] = 5,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0	
		}
	},
	commandant_wear = {
		male = {
			['tshirt_1'] = 131,  ['tshirt_2'] = 13,
			['torso_1'] = 221,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 87,   ['pants_2'] = 3,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,

		},
		female = {
			['tshirt_1'] = 131,  ['tshirt_2'] = 13,
			['torso_1'] = 221,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 87,   ['pants_2'] = 3,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,

		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 8
		},
		female = {
			['bproof_1'] = 10,  ['bproof_2'] = 8
	--	}
	--},
--	gilet_wear = {
	--	male = {
			--['tshirt_1'] = 10,  ['tshirt_2'] = 8
	--	},
		--female = {
	--		['tshirt_1'] = 10,  ['tshirt_2'] = 8
		}
	}

}