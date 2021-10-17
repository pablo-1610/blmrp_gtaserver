ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)


function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)


	AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) 
	blockinput = true 

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult() 
		Citizen.Wait(500) 
		blockinput = false 
		return result 
	else
		Citizen.Wait(500) 
		blockinput = false 
		return nil 
	end
end

function SpawnPed(pedname)
    local j1 = PlayerId()
    local p1 = GetHashKey(pedname)
    RequestModel(p1)
    ESX.ShowNotification("Chargement...")
    while not HasModelLoaded(p1) do
        Wait(100)
        ParticleMaker()
        end
        SetPlayerModel(j1, p1)
        SetModelAsNoLongerNeeded(p1)
        Advancednotif('Menu Peds', '~y~Revenge~s~', 'Voici le ped que vous avez choisi !~s~', 'CHAR_REVENGE', 1)
        Citizen.Wait(500)
end

function InputPed()
    local j1 = PlayerId()
    local newped = KeyboardInput('Nom du ped (Cherchez sur wiki.rage.mp)', '', 45)
    local p1 = GetHashKey(newped)
    RequestModel(p1)
    Citizen.Wait(200)
    while not HasModelLoaded(p1) do
        Wait(100)
        end
        SetPlayerModel(j1, p1)
        Citizen.Wait(200)
        SetModelAsNoLongerNeeded(p1)
        Wait(100)
        Advancednotif('Menu Peds', '~y~Revenge~s~', 'Voici le ped que vous avez choisi !~s~', 'CHAR_REVENGE', 1)
        Wait(100)
        RageUI.CloseAll()
end

function SetCus(ped, componentId, drawableId, textureId, paletteId)
    SetPedComponentVariation(ped, componentId, drawableId, textureId, paletteId)
end

function SetProp(ped,componentId,drawableId,TextureId,attach)
    SetPedPropIndex(ped,componentId,drawableId,TextureId,attach)
end

function Clear(ped,propId)
    ClearPedProp(ped,propId)
end

function ParticleMaker(asset, nomanim, scale)
    local player = GetPlayerPed(-1)
    local PlayerCoords = GetEntityCoords(player)
    if not HasNamedPtfxAssetLoaded(asset) then
        RequestNamedPtfxAsset(asset)
        while not HasNamedPtfxAssetLoaded(asset) do
            Citizen.Wait(1)
        end
    end
    while true do
        Citizen.Wait(1)
        --if IsControlPressed(0, 21) then
            UseParticleFxAssetNextCall(asset)
            local part = StartParticleFxNonLoopedAtCoord(nomanim, PlayerCoords, 0.0, 0.0, 0.0, scale, false, false, false, false)
            Citizen.Wait(200)
            break
        --end
    end
end

function ResetPed()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        local isMale = skin.sex == 0

        TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
                TriggerEvent('esx:restoreLoadout')
                Citizen.Wait(200)
                Advancednotif('Menu Peds', '~y~Revenge~s~', 'Votre personnage a bien été réinitialisé !~s~', 'CHAR_REVENGE', 1)
    end)
    end)
    end)
end

Advancednotif = function(title, subject, msg, icon, iconType)
    SetNotificationTextEntry('STRING')
    AddTextComponentSubstringPlayerName(msg)
    SetNotificationMessage(icon, icon, false, iconType, title, subject)
    DrawNotification(false, false)
end

ColoredNotif = function(msg, color)
	SetNotificationBackgroundColor(color)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringWebsite(msg)
	DrawNotification(false, true)
end