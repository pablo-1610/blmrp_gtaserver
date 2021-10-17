----------------------------------------
--Dev by Thom512#0990 for Patoche#4702--
----------------------------------------

local Shop = {x = 2555.45,  y = 4663.12,  z = 33.07}
local NPC = {
    {seller = true, model = "ig_g", x = 2555.45,  y = 4663.12,  z = 33.07, h = 200.0},
    {seller = false, model = "csb_mweather", x = 2553.45,  y = 4665.32,  z = 33.08, h = 205.0},
    {seller = false, model = "csb_mweather", x = 2557.54,  y = 4665.99,  z = 32.97, h = 140.0},
}


ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
    for _, v in pairs(NPC) do
        RequestModel(GetHashKey(v.model))
        while not HasModelLoaded(GetHashKey(v.model)) do
            Wait(1)
        end
        local npc = CreatePed(4, v.model, v.x, v.y, v.z, v.h,  false, true)
        SetPedFleeAttributes(npc, 0, 0)
        SetPedDropsWeaponsWhenDead(npc, false)
        SetPedDiesWhenInjured(npc, false)
        SetEntityInvincible(npc , true)
        FreezeEntityPosition(npc, true)
        SetBlockingOfNonTemporaryEvents(npc, true)
        if v.seller then 
            RequestAnimDict("missfbi_s4mop")
            while not HasAnimDictLoaded("missfbi_s4mop") do
                Wait(1)
            end
            TaskPlayAnim(npc, "missfbi_s4mop" ,"guard_idle_a" ,8.0, 1, -1, 49, 0, false, false, false)
        else
            GiveWeaponToPed(npc, GetHashKey("WEAPON_ADVANCEDRIFLE"), 2800, true, true)
        end
    end
end)
    
_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Vendeur d'armes","~b~Armes lourdes", 5, 100,"shopui_title_gr_gunmod", "shopui_title_gr_gunmod",nil,255,255,255,230)
_menuPool:Add(mainMenu)

function AddShopsIllegalMenu()
    _menuPool:CloseAllMenus()
    mainMenu:Clear()
    for _,v in pairs(Config.Weapons) do
        local weapitem = NativeUI.CreateItem(ESX.GetWeaponLabel(v.weapon), "")
        weapitem:RightLabel(v.price.."$", Colours.Red , Colours.Black)
        mainMenu:AddItem(weapitem)
    end
    mainMenu.OnItemSelect = function(_,item,Index)
        ESX.TriggerServerCallback('weapon512:buyWeapon', function(bought)
            if bought then
                DisplayBoughtScaleform(Config.Weapons[Index].weapon, Config.Weapons[Index].price)
            else
                PlaySoundFrontend(-1, 'ERROR', 'HUD_AMMO_SHOP_SOUNDSET', false)
            end
        end, Config.Weapons[Index].weapon, Config.Weapons[Index].price)
    end
    mainMenu:Visible(true)
end

function DisplayBoughtScaleform(weaponName, price)
	local scaleform = ESX.Scaleform.Utils.RequestScaleformMovie('MP_BIG_MESSAGE_FREEMODE')
	local sec = GetGameTimer() + 4000
	BeginScaleformMovieMethod(scaleform, 'SHOW_WEAPON_PURCHASED')
	PushScaleformMovieMethodParameterString("Tu as acheté un ".. ESX.GetWeaponLabel(weaponName).." pour ".. price .. "$")
	PushScaleformMovieMethodParameterString(ESX.GetWeaponLabel(weaponName))
	PushScaleformMovieMethodParameterInt(GetHashKey(weaponName))
	PushScaleformMovieMethodParameterString('')
	PushScaleformMovieMethodParameterInt(100)
	EndScaleformMovieMethod()
	PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
	Citizen.CreateThread(function()
		while sec > GetGameTimer() do
			Citizen.Wait(0)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end
	end)
end

_menuPool:RefreshIndex()
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        _menuPool:MouseEdgeEnabled (false);
        isNearShop = false
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Shop.x, Shop.y, Shop.z)
        if dist <= 2.5 then
            isNearShop = true
            ESX.ShowHelpNotification("~INPUT_TALK~ pour parler avec le ~r~vendeur")
            if IsControlJustPressed(1,51) then 
                AddShopsIllegalMenu()
            end
        end
        if isNearShop and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
		end
		if not isNearShop and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			mainMenu:Visible(false)
		end
    end
end)





