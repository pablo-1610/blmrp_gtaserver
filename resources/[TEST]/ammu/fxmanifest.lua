fx_version('bodacious')
game('gta5')

author 'Razzway'
description 'This is an ammunation on RageUI v2 Libs compatible (w/ESX Framework)'
version '1.0'

shared_scripts {
    'shared/config.lua',
}

client_scripts {
    'vendors/RageUI/RMenu.lua',
    'vendors/RageUI/menu/RageUI.lua',
    'vendors/RageUI/menu/Menu.lua',
    'vendors/RageUI/menu/MenuController.lua',
    'vendors/RageUI/components/*.lua',
    'vendors/RageUI/menu/elements/*.lua',
    'vendors/RageUI/menu/items/*.lua',
    'vendors/RageUI/menu/panels/*.lua',
    'vendors/RageUI/menu/panels/*.lua',
    'vendors/RageUI/menu/windows/*.lua',

    'client/cl_main.lua',
    'client/cl_menu.lua',
}

server_scripts {
    'server/sv_main.lua',
}