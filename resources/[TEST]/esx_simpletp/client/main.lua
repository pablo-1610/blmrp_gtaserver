ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()																							
	while true do
		Citizen.Wait(1)
		player = GetPlayerPed(-1)
		coords = GetEntityCoords(player)
		
		for k, v in pairs(Config.Teleport) do
			if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.View then 
				ESX.Game.Utils.DrawText3D(vector3(v.Pos.x, v.Pos.y, v.Pos.z), v.Text, 1.2, 4)
				if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Activate then
					if IsControlJustPressed(0, 38) then
						if Config.OnlyCars then
							if IsPedInAnyVehicle(player, false) then
								if Config.Blackout then
									DoScreenFadeOut(1000)
									Citizen.Wait(1500)
								end
								SetEntityHeading(player, v.Heading)
								ESX.Game.Teleport(GetVehiclePedIsUsing(player), v.Posout)
								if Config.Blackout then
									DoScreenFadeIn(1500)
								end
							end
						else
							if not IsPedInAnyVehicle(player, false) then
								if Config.Animation then
									RequestAnimDict("timetable@jimmy@doorknock@")
									while not HasAnimDictLoaded("timetable@jimmy@doorknock@") do
									Citizen.Wait(1000)
									end
										
									Citizen.Wait(200)
									TaskPlayAnim(player,"timetable@jimmy@doorknock@","knockdoor_idle",1.0, 1.0, 3000, 9, 1.0, 0, 0, 0)
									Citizen.Wait(3000)
								end
								if Config.Blackout then
									DoScreenFadeOut(1000)
									Citizen.Wait(1500)
								end
								SetEntityHeading(player, v.Heading)
								ESX.Game.Teleport(player, v.Posout) 
								if Config.Blackout then
									DoScreenFadeIn(1500)
								end
							end
						end
					end
				end
			end
		end
    	end
end)


key_to_teleport = 38

positions = {
    --[[
    {{Teleport1 X, Teleport1 Y, Teleport1 Z, Teleport1 Heading}, {Teleport2 X, Teleport 2Y, Teleport 2Z, Teleport2 Heading}, {Red, Green, Blue}, "Text for Teleport"}
    ]]
    {{1867.42, 3666.11, 32.80, 0}, {1863.09, 3673.94, 33.1, 0},{36,237,157}, "First Teleport"}, -- Outside the Sheriff's Station
    {{1860.72, 3661.49, 33.00, 0}, {1855.02, 3673.86, 33.3, 0},{255, 157, 0}, "Testing 2nd Teleport"},
}

-----------------------------------------------------------------------------
-------------------------DO NOT EDIT BELOW THIS LINE-------------------------
-----------------------------------------------------------------------------

local player = GetPlayerPed(-1)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)

        for _,location in ipairs(positions) do
            teleport_text = location[4]
            loc1 = {
                x=location[1][1],
                y=location[1][2],
                z=location[1][3],
                heading=location[1][4]
            }
            loc2 = {
                x=location[2][1],
                y=location[2][2],
                z=location[2][3],
                heading=location[2][4]
            }
            Red = location[3][1]
            Green = location[3][2]
            Blue = location[3][3]

            DrawMarker(1, loc1.x, loc1.y, loc1.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, Red, Green, Blue, 200, 0, 0, 0, 0)
            DrawMarker(1, loc2.x, loc2.y, loc2.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, Red, Green, Blue, 200, 0, 0, 0, 0)

            if CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc1.x, loc1.y, loc1.z, 2) then 
                alert(teleport_text)
                
                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc2.heading)
                    else
                        SetEntityCoords(player, loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(player, loc2.heading)
                    end
                end

            elseif CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc2.x, loc2.y, loc2.z, 2) then
                alert(teleport_text)

                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc1.heading)
                    else
                        SetEntityCoords(player, loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(player, loc1.heading)
                    end
                end
            end            
        end
    end
end)

function CheckPos(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end

function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end
