CMX = nil

s = 1000

Citizen.CreateThread(
    function()
        while CMX == nil do
            TriggerEvent(
                "esx:getSharedObject",
                function(obj)
                    CMX = obj
                end
            )

            Citizen.Wait(s)
        end
    end
)

RegisterNetEvent(Config.Status .. ":onTick")

AddEventHandler(
    Config.Status .. ":onTick",
    function(status)
        TriggerEvent(
            Config.Status .. ":getStatus",
            "hunger",
            function(status)
                food = status.val / 10000
            end
        )

        TriggerEvent(
            Config.Status .. ":getStatus",
            "thirst",
            function(status)
                thirst = status.val / 10000
            end
        )

        if (Config.Stress) then
            TriggerEvent(
                Config.Status .. ":getStatus",
                "stress",
                function(status)
                    stress = status.val / 10000
                end
            )
        end
    end
)

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(s)

            if (Config.HideMinimap) then
                if IsPedSittingInAnyVehicle(PlayerPedId()) then
                    DisplayRadar(true)
                else
                    DisplayRadar(false)
                end
            else
                DisplayRadar(true)
            end

            if (Config.Stress) then
                localStress = stress
            else
                localStress = false
            end

            local hudPosition

            if IsPedSittingInAnyVehicle(PlayerPedId()) or not Config.HideMinimap then
                hudPosition = "right"
            else
                hudPosition = "left"
            end

            SendNUIMessage(
                {
                    hud = Config.Hud,
                    pauseMenu = IsPauseMenuActive(),
                    armour = GetPedArmour(PlayerPedId()),
                    health = GetEntityHealth(PlayerPedId()) - 100,
                    food = food,
                    thirst = thirst,
                    stress = localStress,
                    hudPosition = hudPosition
                }
            )
        end
    end
)