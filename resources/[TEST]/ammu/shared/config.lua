Config = {
    getESX = "esx:getSharedObject",
    Ammunation = {
        showBlip = true, -- Afficher les blips sur la carte // oui = true | non = false
        showMarker = true, -- Afficher les marker // oui = true | non = false
        Menu = {
            Title = "Armurerie",
	        Subtitle = "Achetez vos armes",
        },
        Marker = { -- https://docs.fivem.net/docs/game-references/markers/ & https://htmlcolorcodes.com/fr/
            Type = 2, 
            Size = {0.2, 0.2, 0.2},  -- x, y, z
            Color = {0, 89, 255}, -- r, g, b
            Rotation = 180.0,
        },
        Positions = {
            infoBlip = { -- https://docs.fivem.net/docs/game-references/blips/
                Name = "Armurerie",
                Sprite = 110,
				Display = 4,
				Scale = 0.6,
				Color = 1,
				Range = true,
            },
            interactionZone = { -- Position x,y,z pour les intéractions & blips
                {pos = vector3(2567.6, 294.3, 108.7)},
                {pos = vector3(22.0, -1107.2, 29.8)},
                {pos = vector3(252.3, -50.0, 69.9)},
                {pos = vector3(5064.10, -4591.11, 2.85)},
                {pos = vector3(-330.2, 6083.8, 31.4)},
                {pos = vector3(1693.4, 3759.5, 34.7)},
                {pos = vector3(-662.1, -935.3, 21.8)},
            },
        },
        Items = {
            whiteWeapon = {
                { label = "Couteau", description = "Ce couteau à lame de 17 cm en acier au carbone est doté d'un double tranchant et d'une partie dentelée pour mieux s'enfoncer et découper.", item = "weapon_knife", type = "weapon", price = "5000" },
				{ label = "Batte de baseball", description = "Batte de baseball en aluminium avec une poignée en cuir. Légère et résistante, parfaite pour les battants.", item = "weapon_hatchet", type = "weapon", price = "10000" },
				{ label = "Poing américain", description = "Discret et efficace, parfaitement adapté pour casser les dents ou assommer une personne.", item = "weapon_knuckle", type = "weapon", price = "7500" },
            },
            letalWeapon = {
                { label = "Pétoire", description = "Le flingue idéal pour sortir à Vinewood. Moins précis qu'un bouchon de bouteille, mais deux fois plus dangereux et puissant.", item = "weapon_snspistol", type = "weapon", price = "90000" },
				{ label = "Pistolet", description = "Arme à feu portative, à canon court, qui se tient d'une seule main. Légère et maniable, une arme pouvant causé de très gros dégâts.", item = "weapon_pistol", type = "weapon", price = "175000" },
            },
            accessories = {
                { label = "Chargeur (x12m)", description = "Performant, discret contenant des balles de qualitées partant à plus de 1000km/h lors d'un tir.", item = "clip", type = "item", price = "200" },
				{ label = "Gilet par balle", description = "Léger et résistant, l'équipement idéal pour se protéger face au obus des armes létales.", item = "kevlar", type = "item", price = "10000" },
            },
        },
    },
}
