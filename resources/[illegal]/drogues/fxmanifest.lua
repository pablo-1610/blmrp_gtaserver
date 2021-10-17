fx_version 'adamant'

game 'gta5'

------------ RAGEUI ------------

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua"
}


client_scripts {
    '@es_extended/locale.lua',
    'weed/cl_weed.lua',
    'coke/cl_coke.lua',
    'opium/cl_opium.lua',
    'meth/cl_meth.lua',
    'ecstasy/cl_ecstasy.lua',
    'lsd/cl_lsd.lua',
    'vente/vente.lua'
}

server_scripts {
    '@es_extended/locale.lua',
    '@mysql-async/lib/MySQL.lua',
    'server/server.lua'
}

dependencies {
	'es_extended',
}
