ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

------------ Création du Menu / Sous Menu -----------

RMenu.Add('example', 'main', RageUI.CreateMenu("Boutique", "Boutique"))
RMenu.Add('example', 'boisson', RageUI.CreateSubMenu(RMenu:Get('example', 'main'), "Boissons", "Menu Boissons"))
RMenu.Add('example', 'nourriture', RageUI.CreateSubMenu(RMenu:Get('example', 'main'), "Nourritures", "Menu Nourritures"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('example', 'main'), true, true, true, function()

            RageUI.Button("Boisson", "Choisi ta Boisson !", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('example', 'boisson'))

            RageUI.Button("Nourriture", "Choisi ta Nourriture !", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('example', 'nourriture'))
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('example', 'boisson'), true, true, true, function()

            RageUI.Button("Eau", "Acheter de ~b~l'Eau~w~ pour ~g~75$", {RightLabel = "~g~75$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('{-WayZe#0001-}::BuyEau')
                end
            end)

        RageUI.Button("Coca cola", "Acheter du ~r~Coca cola~w~ pour ~g~100$", {RightLabel = "~g~100$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('{-WayZe#0001-}::BuyCocacola')
                end
            end)

        end, function()
        end)

            RageUI.IsVisible(RMenu:Get('example', 'nourriture'), true, true, true, function()

                RageUI.Button("Pain", "Acheter du ~o~Pain~w~ pour ~g~50$", {RightLabel = "~g~50$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('{-WayZe#0001-}::BuyPain')
                    end
                end)

                RageUI.Button("Chocolat", "Acheter du ~y~Chocolat~w~ pour ~g~100$", {RightLabel = "~g~100$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('{-WayZe#0001-}::BuyChocolat')
                    end
                end)
                        
            end, function()
                ---Panels
            end, 1)
    
            Citizen.Wait(0)
        end
    end)



    ---------------------------------------- Position du Menu --------------------------------------------

    local position = {
        {x = -706.08,  y = -914.44,  z = 19.2},
        {x = 4500.47,  y = -4517.81,  z = 4.41},
        {x = 1959.84,  y = 3740.44,  z = 32.36},
        {x = 373.875, y = 325.896, z = 102.566+0.50},
        {x = 2557.458, y = 382.282, z = 107.622+0.50},
        {x = -3038.939, y = 585.954, z = 6.908+0.50},
        {x = -3241.927, y = 1001.462, z = 11.830+0.50},
        {x = 547.431, y = 2671.710, z = 41.156+0.50},
        {x = 1961.464, y = 3740.672, z = 31.343+0.50},
        {x = 2678.916, y = 3280.671,z =  54.241+0.50},
        {x = 1729.216, y = 6414.131, z = 34.037+0.50},
        {x = 1135.808, y = -982.281,z =  45.415+0.50},
        {x = -1222.915,y =  -906.983, z = 11.326+0.50},
        {x = -1487.553,y =  -379.107, z = 39.163+0.50},
        {x = -2968.243, y = 390.910, z = 14.043+0.50},
        {x = 1166.02, y = 2708.930,z =  37.157+0.50},
        {x = 1392.562, y = 3604.684, z = 33.980+0.50},
        {x = 26.14, y = -1347.37, z = 29.5+0.50},
        {x = -48.519, y = -1757.514,z =  28.421+0.50},
        {x = 1163.373, y = -323.801, z = 68.205+0.50},
        {x = -707.501,y =  -914.260, z = 18.215+0.50},
        {x = -1820.523,y =  792.518, z = 137.118+0.50},
        {x = 1698.388,y =  4924.404, z = 41.063+0.50}
    }  
    
    local blips = {
        {title="Boutique", colour=2, id=52, x = -706.08,  y = -914.44,  z = 19.2},
        {title="Boutique", colour=2, id=52, x = 1959.84,  y = 3740.44,  z = 32.36},
        {title="Boutique", colour=2, id=52, x = 4500.47,  y = -4517.81,  z = 4.41},
        {title="Boutique", colour=2, id=52, x = 373.875, y = 325.896, z = 102.566+0.50},
        {title="Boutique", colour=2, id=52, x = 2557.458, y = 382.282, z = 107.622+0.50},
        {title="Boutique", colour=2, id=52, x = -3038.939, y = 585.954, z = 6.908+0.50},
        {title="Boutique", colour=2, id=52, x = -3241.927, y = 1001.462, z = 11.830+0.50},
        {title="Boutique", colour=2, id=52, x = 547.431, y = 2671.710, z = 41.156+0.50},
        {title="Boutique", colour=2, id=52, x = 1961.464, y = 3740.672, z = 31.343+0.50},
        {title="Boutique", colour=2, id=52, x = 2678.916, y = 3280.671,z =  54.241+0.50},
        {title="Boutique", colour=2, id=52, x = 1729.216, y = 6414.131, z = 34.037+0.50},
        {title="Boutique", colour=2, id=52, x = 1135.808, y = -982.281,z =  45.415+0.50},
        {title="Boutique", colour=2, id=52, x = -1222.915,y =  -906.983, z = 11.326+0.50},
        {title="Boutique", colour=2, id=52, x = -1487.553,y =  -379.107, z = 39.163+0.50},
        {title="Boutique", colour=2, id=52, x = -2968.243, y = 390.910, z = 14.043+0.50},
        {title="Boutique", colour=2, id=52, x = 1166.02, y = 2708.930,z =  37.157+0.50},
        {title="Boutique", colour=2, id=52, x = 1392.562, y = 3604.684, z = 33.980+0.50},
        {title="Boutique", colour=2, id=52, x = 26.14, y = -1347.37, z = 29.5+0.50},
        {title="Boutique", colour=2, id=52, x = 1163.373, y = -323.801, z = 68.205+0.50},
        {title="Boutique", colour=2, id=52, x = -1820.523,y =  792.518, z = 137.118+0.50},
        {title="Boutique", colour=2, id=52, x = -48.519, y = -1757.514, z =  28.421+0.50},
        {title="Boutique", colour=2, id=52, x = -707.501,y =  -914.260, z = 18.215+0.50},
        {title="Boutique", colour=2, id=52, x = 1698.388,y =  4924.404, z = 41.063+0.50}
  }
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
    
            for k in pairs(position) do
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
    
                if dist <= 1.0 then

                   RageUI.Text({
                        message = "Touche [~g~E~w~] pour acceder à la ~g~Boutique",
                        time_display = 1
                    })
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('example', 'main'), not RageUI.Visible(RMenu:Get('example', 'main')))
                    end
                end
            end
        end
    end)

Citizen.CreateThread(function()

        for _, info in pairs(blips) do
          info.blip = AddBlipForCoord(info.x, info.y, info.z)
          SetBlipSprite(info.blip, info.id)
          SetBlipDisplay(info.blip, 4)
          SetBlipScale(info.blip, 0.9)
          SetBlipColour(info.blip, info.colour)
          SetBlipAsShortRange(info.blip, true)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(info.title)
          EndTextCommandSetBlipName(info.blip)
        end
    end)