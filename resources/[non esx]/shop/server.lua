ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('{-WayZe#0001-}::BuyPain')
AddEventHandler('{-WayZe#0001-}::BuyPain', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 50
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('bread', 1)
        TriggerClientEvent('esx:showNotification', source, "Vous venez d'acheter ~g~1x Pain")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('{-WayZe#0001-}::BuyChocolat')
AddEventHandler('{-WayZe#0001-}::BuyChocolat', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 100
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('chocolate', 1)
        TriggerClientEvent('esx:showNotification', source, "Vous venez d'acheter ~g~1x Chocolat")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('{-WayZe#0001-}::BuyEau')
AddEventHandler('{-WayZe#0001-}::BuyEau', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 75
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('water', 1)
        TriggerClientEvent('esx:showNotification', source, "Vous venez d'acheter ~g~1x Eau")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('{-WayZe#0001-}::BuyCocacola')
AddEventHandler('{-WayZe#0001-}::BuyCocacola', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 100
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('cocacola', 1)
        TriggerClientEvent('esx:showNotification', source, "Vous venez d'acheter ~g~1x Coca cola")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)