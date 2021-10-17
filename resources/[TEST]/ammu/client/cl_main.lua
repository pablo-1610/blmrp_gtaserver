local Function = {} or {};

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.getESX, function(obj) ESX = obj end)
        Citizen.Wait(10)
    end  

    if Config.Ammunation.showBlip then
        for k,v in pairs(Config.Ammunation.Positions.interactionZone) do
            local blip = AddBlipForCoord(v.pos)
            SetBlipSprite(blip, Config.Ammunation.Positions.infoBlip.Sprite)
            SetBlipDisplay(blip, Config.Ammunation.Positions.infoBlip.Display)
            SetBlipScale(blip, Config.Ammunation.Positions.infoBlip.Scale)
            SetBlipColour(blip, Config.Ammunation.Positions.infoBlip.Color)
            SetBlipAsShortRange(blip, Config.Ammunation.Positions.infoBlip.Range)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.Ammunation.Positions.infoBlip.Name)
            EndTextCommandSetBlipName(blip)                    
        end
    end

    while true do
        local interval = 1500

        for k,v in pairs(Config.Ammunation.Positions.interactionZone) do
            local myCoords, interactionPos = GetEntityCoords(PlayerPedId()), v.pos
            if #(myCoords-interactionPos) < 1.0 then
                interval = 0
                Function.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder à l'armurerie")
                if IsControlJustReleased(0, 54) then
                    openMenu()
                end
            elseif #(myCoords-interactionPos) < 10.0 then 
                interval = 0
                DrawMarker(Config.Ammunation.Marker.Type, interactionPos, 0, 0, 0, Config.Ammunation.Marker.Rotation, nil, nil, Config.Ammunation.Marker.Size[1], Config.Ammunation.Marker.Size[2], Config.Ammunation.Marker.Size[3], Config.Ammunation.Marker.Color[1], Config.Ammunation.Marker.Color[2], Config.Ammunation.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
            end
        end
        Wait(interval)
    end
end)

Function.ShowHelpNotification = function(msg)
    AddTextEntry('HelpNotification', msg)
	BeginTextCommandDisplayHelp('HelpNotification')
    EndTextCommandDisplayHelp(0, false, true, -1)
end

RegisterNetEvent('rz-weapon:useClip')
AddEventHandler('rz-weapon:useClip', function()
	local playerPed = PlayerPedId()
	if IsPedArmed(playerPed, 4) then
		local hash = GetSelectedPedWeapon(playerPed)
		if hash then
			TriggerServerEvent('rz-weapon:removeClip')
			AddAmmoToPed(playerPed, hash, 25)
			ESX.ShowNotification("Vous avez ~b~utilisé~s~ 1x chargeur")
		else
			ESX.ShowNotification("~r~Action Impossible~s~ : Vous n'avez pas d'arme en main !")
		end
	else
		ESX.ShowNotification("~r~Action Impossible~s~ : Ce type de munition ne convient pas !")
	end
end)