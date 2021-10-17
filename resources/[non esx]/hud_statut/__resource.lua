fx_version 'adamant'
game 'gta5'
lua54 'no'

name 'CMX STATUS HUD v3'
description 'STATUS HUD FOR FIVEM'
author '! canarioᵈᵉᵛ#0001'
version '1.2.0'

ui_page ('html/index.html')
files (
    {
        '**/**/*.js',
        '**/**/*.png',
        '**/**/*.css',
        '**/*.html'
    }
)

client_scripts (
    {
        'client/*.lua'
    }
)

shared_scripts (
    {
        'config/*.lua'
    }
)