Config             = {}

Config.jeveuxmarker = true --- true = Oui | false = Non

Config.Nombredeballe = 150 -- Nombre de balle à donner pour chaque arme


Config.Webhook = "https://discord.com/api/webhooks/897837081777307669/hIri4-5nCogLpa39rxeSs7bdT-sxuKjl0dwGtWPnn001shXIzHMZtaukUte5o5l3yRbH"


Config.vehicle1 = 'riot'
Config.vehicle2 = 'policeb'
Config.vehicle3 = 'policet'
Config.vehicle4 = 'bmx'
Config.vehicle5 = 'polmav'

Config.ped1 = 's_m_y_cop_01'
Config.ped2 = 's_m_y_cop_01'
Config.ped3 = 's_m_y_cop_01'
Config.ped4 = 's_m_y_cop_01'
Config.ped5 = 's_m_y_cop_01'
Config.ped6 = 's_m_y_cop_01'

Config.weapon1 = 'WEAPON_CARBINERIFLE'
Config.weapon2 = 'WEAPON_PISTOL'
Config.weapon3 = 'WEAPON_SMG'
Config.weapon4 = 'WEAPON_STUNGUN'
Config.weapon6 = 'WEAPON_STUNGUN'


Config.pos = {
	coffre = {
		position = {x = 448.019, y = -997.0923, z = 30.68}
	},
	garage = {
		position = {x = 441.58, y = -984.44, z = 25.70}
	},
	spawnvoiture = {
		position = {x = 426.06, y = -981.33, z = 25.70, h = 92.53}
	},

	garageheli = {
		position = {x = 449.4, y = -981.24, z = 43.69}
	},
	spawnheli = {
		position = {x = 449.4, y = -981.24, z = 43.69, h = 351.58}
	},
	boss = {
		position = {x = 460.1462, y = -985.43, z = 30.72}
	},
	blips = {
		position = {x = 423.13, y = -978.85, z = 30.70}
	},
	MenuPrendre = {
		position = {x = 461.9595, y = -996.54, z = 30.68}
	},
	vestiaire = {
		position = {x = 462.2, y = -999.11, z = 30.68}
	},
	plainte = {
		position = {x = 441.07, y = -981.09, z = 30.69}
	},
}

Arsenal = {
    Police = {
		{Label = "Lampe de poche", Name = "weapon_flashlight", Price = 1},    
		{Label = "Matraque", Name = "weapon_nightstick", Price = 5},
		{Label = "Taser", Name = "weapon_stungun", Price = 10},
		{Label = "Pistolet", Name = "weapon_pistol", Price = 150},
		{Label = "Fusil à pompe", Name = "weapon_pumpshotgun_mk2", Price = 300},
		{Label = "M4", Name = "weapon_carbinerifle", Price = 600},
    },
}

Gpolicevoiture = {
    {nom = "Police", modele = "Police"},
	{nom = "Police2", modele = "Police2"},
	{nom = "Police3", modele = "Police3"},
	{nom = "PoliceT", modele = "PoliceT"},
          {nom = "riot", modele = "riot2"},
        {nom = "bugatti", modele = "polchiron"},
         {nom = "Ford", modele = "policegt350r"},
	{nom = "Policeb", modele = "Policeb"},
}

Hpoliceheli = {
	{nom = "Hélicoptère", modele = "buzzard2"}
}


Config.Uniforms = {
	recruit = {
		male = {
			tshirt_1 = 59,  tshirt_2 = 1,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	officer = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	sergeant = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 1,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 1,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	lieutenant = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 2,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	boss = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 3,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 3,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 11,  bproof_2 = 1
		},
		female = {
			bproof_1 = 13,  bproof_2 = 1
		}
	},

	bullet_wearno = {
		male = {
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			bproof_1 = 0,  bproof_2 = 0
		}
	},

}