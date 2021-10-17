---- discord : https://discord.gg/pRXCnA8
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(90000)
        TriggerClientEvent("Boutique:Notification", -1, "N'hésitez pas à jeter un coup d'oeil à notre boutique (L) !")
    end
end)

RegisterServerEvent("boutique:getpoints")
AddEventHandler("boutique:getpoints", function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
	local _source = source
    if id_system_l_o_s == "steam" then
    license = xPlayer.getIdentifier()
    elseif id_system_l_o_s == "license" then
    license = ESX.GetIdentifierFromId(source)
    end
	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier=@identifier', {
        ['@identifier'] = license
	}, function(data)
		local poi = data[1].fivecoin
		TriggerClientEvent('boutique:retupoints', _source, poi)
	end)
end
end)

ESX.RegisterServerCallback('boutique:GetCodeBoutique', function(source, cb)
    local xPlayer  = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.getIdentifier() .."'", {}, function (result)
        cb(result[1].boutique_id)
    end)
end)

RegisterServerEvent('shop:vehiculeboutique')
AddEventHandler('shop:vehiculeboutique', function(vehicleProps, plate)
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)', {
        ['@owner']   = xPlayer.identifier,
        ['@plate']   = vehicleProps.plate,
        ['@vehicle'] = json.encode(vehicleProps)
    }, function(rowsChange)
        PerformHttpRequest(discord_webhook.url, function(err, text, headers) end, 'POST', json.encode({username = "", content = xPlayer.getName() .. " à acheter un véhicule boutique."}), { ['Content-Type'] = 'application/json' })
    end)
end
end)

ESX.RegisterServerCallback('Boutique:DonnePoint', function(source, cb, point, boutique_id)
    local xPlayer  = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil then
   MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
        --print(result[1].fivecoin)
        if result[1].fivecoin >= tonumber(point) then
            local newpoint = result[1].fivecoin - tonumber(point)
            MySQL.Async.execute("UPDATE `users` SET `fivecoin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.getIdentifier() .."'", {}, function() end)
            MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `boutique_id` = '".. boutique_id .."'", {}, function (result2)
                local addpoint = result2[1].fivecoin + tonumber(point)
                local xPlayer2 = ESX.GetPlayerFromIdentifier(result2[1].license)
                PerformHttpRequest(discord_webhook.url, function(err, text, headers) end, 'POST', json.encode({username = "Boutique", content = "Transaction : " .. point .. " crédit(s) de la part de " .. xPlayer.getName() .. " a " .. xPlayer2.getName()}), { ['Content-Type'] = 'application/json' })
                xPlayer2.triggerEvent("Boutique:Notification", "Vous avez recu " .. point .. " crédit(s) de la part de " .. xPlayer.getName())
                MySQL.Async.execute("UPDATE `users` SET `fivecoin`= '".. addpoint .."' WHERE `boutique_id` = '".. boutique_id .."'", {}, function() end)
            end)
            cb(true)
        else
            cb(false)
        end
    end)
end
end)

RegisterServerEvent('boutique:deltniop')
AddEventHandler('boutique:deltniop', function(point)
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
	local _source = source
    if id_system_l_o_s == "steam" then
        license = xPlayer.getIdentifier()
    elseif id_system_l_o_s == "license" then
        license = ESX.GetIdentifierFromId(source)
    end
	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier=@identifier', {
        ['@identifier'] = license
	}, function(data)
        local poi = data[1].fivecoin
        npoint = poi -point

        MySQL.Async.execute('UPDATE `users` SET `fivecoin`=@point  WHERE identifier=@identifier', {
            ['@identifier'] = license,
            ['@point'] = npoint 
        }, function(rowsChange)
        end)
    end)
end
end)


RegisterServerEvent('give:money')
AddEventHandler('give:money', function(w)
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
	local _source = source
    xPlayer.addMoney(w)
    PerformHttpRequest(discord_webhook.url, function(err, text, headers) end, 'POST', json.encode({username = "", content = xPlayer.getName() .. " à acheter de l'argent boutique."}), { ['Content-Type'] = 'application/json' })
    end
end)

RegisterServerEvent('give:weapon')
AddEventHandler('give:weapon', function(w)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addWeapon(w, 100)
    PerformHttpRequest(discord_webhook.url, function(err, text, headers) end, 'POST', json.encode({username = "", content = xPlayer.getName() .. " à acheter une arme boutique."}), { ['Content-Type'] = 'application/json' })
end)


---- discord : https://discord.gg/pRXCnA8

