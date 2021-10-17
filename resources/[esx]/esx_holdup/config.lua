Config = {}
Config.Locale = 'fr'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 2
Config.TimerBeforeNewRob    = 1800 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

Stores = {
	["paleto_twentyfourseven"] = {
		position = { x = 1736.32, y = 6419.47, z = 35.03 },
		reward = math.random(15000, 30000),
		nameOfStore = "24/7. (Paleto Bay)",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["sandyshores_twentyfoursever"] = {
		position = { x = 1961.24, y = 3749.46, z = 32.34 },
		reward = math.random(15000, 30000),
		nameOfStore = "24/7. (Sandy Shores)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["littleseoul_twentyfourseven"] = {
		position = { x = -709.17, y = -904.21, z = 19.21 },
		reward = math.random(15000, 30000),
		nameOfStore = "24/7. (Little Seoul)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["bar_one"] = {
		position = { x = 1990.57, y = 3044.95, z = 47.21 },
		reward = math.random(15000, 30000),
		nameOfStore = "Yellow Jack. (Sandy Shores)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["ocean_liquor"] = {
		position = { x = -2959.33, y = 388.21, z = 14.00 },
		reward = math.random(15000, 30000),
		nameOfStore = "Robs Liquor. (Great Ocean Highway)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["rancho_liquor"] = {
		position = { x = 1126.80, y = -980.40, z = 45.41 },
		reward = math.random(15000, 30000),
		nameOfStore = "Robs Liquor. (El Rancho Blvd)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["sanandreas_liquor"] = {
		position = { x = -1219.85, y = -916.27, z = 11.32 },
		reward = math.random(15000, 30000),
		nameOfStore = "Robs Liquor. (San Andreas Avenue)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["grove_ltd"] = {
		position = { x = -43.40, y = -1749.20, z = 29.42 },
		reward = math.random(15000, 30000),
		nameOfStore = "LTD Gasoline. (Grove Street)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["mirror_ltd"] = {
		position = { x = 1160.67, y = -314.40, z = 69.20 },
		reward = math.random(15000, 30000),
		nameOfStore = "LTD Gasoline. (Mirror Park Boulevard)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
        ["families_twentyfoursever"] = {
		position = { x = 28.38, y = -1339.81, z = 29.5 },
		reward = math.random(15000, 30000),
		nameOfStore = "24/7. (Superette)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
     },
        ["avenue_twentyfoursever"] = {
		position = { x = -1479.36, y = -374.97, z = 39.16 },
		reward = math.random(15000, 30000),
		nameOfStore = "24/7. (Superette)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
        ["holywood_twentyfoursever"] = {
		position = { x = 378.4, y = 333.08, z = 103.57 },
		reward = math.random(15000, 30000),
		nameOfStore = "24/7. (Superette)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
        ["nord_twentyfoursever"] = {
		position = { x = -3047.27, y = 585.85, z = 7.91 },
		reward = math.random(15000, 30000),
		nameOfStore = "24/7. (Superette)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
        ["norde_twentyfoursever"] = {
		position = { x = -1828.78, y = 799.21, z = 138.18 },
		reward = math.random(15000, 30000),
		nameOfStore = "24/7. (Superette)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
        ["norda_twentyfoursever"] = {
		position = { x = 2549.8, y = 384.82, z = 108.62 },
		reward = math.random(15000, 30000),
		nameOfStore = "24/7. (Superette)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
        ["nordq_twentyfoursever"] = {
		position = { x = 1396.66, y = 3611.06, z = 34.98 },
		reward = math.random(15000, 30000),
		nameOfStore = "24/7. (Superette)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
        ["nordI_twentyfoursever"] = {
		position = { x = 1168.58, y = 2717.98, z = 37.16 },
		reward = math.random(15000, 30000),
		nameOfStore = "24/7. (Superette)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
        ["nordp_twentyfoursever"] = {
		position = { x = 546.32, y = 2663.25, z = 42.16 },
		reward = math.random(15000, 30000),
		nameOfStore = "24/7. (Superette)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
        ["nordo_twentyfoursever"] = {
		position = { x = 2673.04, y = 3286.55, z = 55.24 },
		reward = math.random(15000, 30000),
		nameOfStore = "24/7. (Superette)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
        ["nordx_twentyfoursever"] = {
		position = { x = 1707.76, y = 4920.14, z = 42.06 },
		reward = math.random(15000, 30000),
		nameOfStore = "24/7. (Superette)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
        ["nordf_twentyfoursever"] = {
		position = { x = -3249.51, y = 1004.43, z = 12.83 },
		reward = math.random(15000, 30000),
		nameOfStore = "24/7. (Superette)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0

	}


}
