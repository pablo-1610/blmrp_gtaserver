function openMenu()
    local mainMenu = RageUI.CreateMenu(Config.Ammunation.Menu.Title, Config.Ammunation.Menu.Subtitle)

    local selectedButton = 1
    local index = 1
    local indexName = {"Armes Blanches", "Armes Létales", "Accessoires"}

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while mainMenu do
        Wait(1)
        RageUI.IsVisible(mainMenu, function()
            RageUI.List('Choix du type :', indexName, index, nil, {}, true, {
                onListChange = function(Index, Item)
                    index = Index;
                    selectedButton = Index;
                end,
            }) 
            if selectedButton == 1 then
                for k,v in pairs(Config.Ammunation.Items.whiteWeapon) do
                    RageUI.Button(v.label, v.description, {RightLabel = "".. v.price.."~g~ $"}, true, {
                        onSelected = function()
                            TriggerServerEvent("rz-ammunation:buyWeapon", v.item, v.type, v.price) 
                            RageUI.CloseAll()
                        end
                    })
                end
            elseif selectedButton == 2 then
                for k,v in pairs(Config.Ammunation.Items.letalWeapon) do
                    RageUI.Button(v.label, v.description, {RightLabel = "".. v.price.."~g~ $"}, true, {
                        onSelected = function()
                            TriggerServerEvent("rz-ammunation:buyWeapon", v.item, v.type, v.price) 
                            RageUI.CloseAll()
                        end
                    })
                end
            elseif selectedButton == 3 then
                for k,v in pairs(Config.Ammunation.Items.accessories) do
                    RageUI.Button(v.label, v.description, {RightLabel = "".. v.price.."~g~ $"}, true, {
                        onSelected = function()
                            TriggerServerEvent("rz-ammunation:buyWeapon", v.item, v.type, v.price) 
                            RageUI.CloseAll()
                        end
                    })
                end
            end
        end)
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType('mainMenu', true)
        end
    end
end
