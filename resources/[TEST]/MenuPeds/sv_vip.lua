ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local vips = { -- Steam hex des personnes autorisées
    'steam:11000014898bbed',
    'steam:11000013df9c499',
    'steam:000000000000000'
}

RegisterServerEvent('verifvip')
AddEventHandler('verifvip', function()
	local id = source
	if isVip(id) then
		TriggerClientEvent("setgroup", source)
	end
end)

function isVip(player)
    local allowed = false
    for i,id in ipairs(vips) do
        for x,pid in ipairs(GetPlayerIdentifiers(player)) do
            if string.lower(pid) == string.lower(id) then
                allowed = true
            end
        end
    end
    return allowed
end
