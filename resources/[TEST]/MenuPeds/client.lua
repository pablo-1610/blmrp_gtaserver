ESX = nil

AddEventHandler('playerSpawned', function()
	isDead = false
end)

AddEventHandler('esx:onPlayerDeath', function()
	isDead = true
	RageUI.CloseAll()
	ESX.UI.Menu.CloseAll()
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

RegisterNetEvent('setgroup')
AddEventHandler('setgroup', function()
    group = true
end)    

Citizen.CreateThread(function()
    while true do
        
        Citizen.Wait( 5000 )

        if NetworkIsSessionStarted() then
            TriggerServerEvent( "verifvip")
        end
    end
end )

function OpenPedsMenu()
local OpenedPedsMenu = false
local PedsMenu = RageUI.CreateMenu("Menu Peds", "MENU ~y~VIP~s~", 10, 200)
local PedsSubMenu = RageUI.CreateSubMenu(PedsMenu, "Menu Peds", "Peds disponibles", 10, 200)
local PedsSubCusMenu = RageUI.CreateSubMenu(PedsMenu, "Menu Peds", "Personnalisation", 10, 200)

local Options = {
    List1 = 1
}

local Customs = {
    List1 = 1,
    List2 = 1,
    List4 = 1,
    List5 = 1,
    List6 = 1,
    List7 = 1, 
    List8 = 1
}

PedsMenu.Closable = true
PedsMenu:DisplayHeader(true)
PedsSubMenu:DisplayHeader(true)
PedsMenu.EnableMouse = false;
PedsSubMenu.EnableMouse = false;
PedsSubCusMenu.EnableMouse = false;
PedsMenu:SetRectangleBanner(0, 0, 0, 255)
PedsSubMenu:SetRectangleBanner(0, 0, 0, 255)
PedsSubCusMenu:SetRectangleBanner(0, 0, 0, 255)

    if OpenedPedsMenu then
        OpenedPedsMenu = false
        RageUI.Visible(PedsMenu, false)
        return;
    else
        OpenedPedsMenu = true
        RageUI.Visible(PedsMenu, true)
        CreateThread(function()
            while OpenedPedsMenu do
                Wait(1.0)
                RageUI.IsVisible(PedsMenu, function()
                    local ped = GetPlayerPed(-1)
                    local playername = GetPlayerName(PlayerId())
                    
                    RageUI.Separator("Utilisateur : ~h~~y~".. playername .. '~s~')

                    RageUI.Separator("Status : ~h~~y~VIP~s~")

                    RageUI.Button("Liste des peds", "Voir la liste des peds disponibles.", {RightLabel = "→→"}, true, {
                    }, PedsSubMenu);

                    RageUI.Button("Animaux", "~c~Bientôt disponible / Soon.                ~b~V2~s~", {RightBadge = RageUI.BadgeStyle.Lock}, false, {   
                    });

                    RageUI.Separator("~y~~h~↓~s~ Autres ~y~~h~↓~s~")

                    RageUI.Button("Personnalisation", "Modifier son ped.", {RightLabel = "→→"}, true, {
                    }, PedsSubCusMenu);

                    RageUI.List("Options", {"Reset personnage", "Choisir manuellement", "Informations"}, Options.List1, "Options divers", {}, true, {
                        onListChange = function(i, Item)
                            Options.List1 = i;
                        end,
                        onSelected = function(i, Item)
                            if Options.List1 == 2 then
                                Citizen.Wait(200)
                                InputPed()
                            end
                            if Options.List1 == 1 then
                                ResetPed()
                                ParticleMaker("scr_rcbarry2", "scr_clown_bul", 0.5)
                                Citizen.Wait(1)
                            end
                            if Options.List1 == 3 then
                                Advancednotif('Menu Peds', '~y~Revenge~s~', 'Plus d\'informations sur le discord !~n~~y~discord.gg~s~/2JkJRK2w4h', 'CHAR_REVENGE', 1)
                            end
                        end,
                    })

                    RageUI.Button("~r~Fermer~s~", nil, {RightLabel = ""}, true, {
                        onSelected = function() 
                            RageUI.CloseAll()
                            Advancednotif('Menu Peds', '~y~Revenge~s~', 'À bientôt !~s~', 'CHAR_REVENGE', 1)
                        end
                    });


                end)

                RageUI.IsVisible(PedsSubCusMenu, function ()
                    local ped = GetPlayerPed(-1)

                    RageUI.List("Visage", {"1", "2", "3"}, Customs.List1, "", {}, true, {
                        onListChange = function(i, Item)
                            Customs.List1 = i;
                        end,
                        onActive = function()
                            if Customs.List1 == 1 then
                                SetCus(ped, 0, 0, 0, 0)
                            end
                            if Customs.List1 == 2 then
                                SetCus(ped, 0, 0, 1, 0)
                            end
                            if Customs.List1 == 3 then
                                SetCus(ped, 0, 1, 1, 0)
                            end
                        end, 
					})

                    RageUI.List("Cheveux", {"1", "2", "3", "4"}, Customs.List2, "", {}, true, {
                        onListChange = function(i, Item)
                            Customs.List2 = i;
                        end,
                        onActive = function()
                            if Customs.List2 == 1 then
                                SetCus(ped, 2, 0, 0, 0)
                            end
                            if Customs.List2 == 2 then
                                SetCus(ped, 2, 1, 1, 0)
                            end
                            if Customs.List2 == 3 then
                                SetCus(ped, 2, 2, 1, 0)
                            end
                            if Customs.List2 == 4 then
                                SetCus(ped, 2, 3, 1, 0)
                            end
                        end, 
					})

                    RageUI.List("Haut", {"1", "2", "3", "4", "5", "6"}, Customs.List4, "", {}, true, {
                        onListChange = function(i, Item)
                            Customs.List4 = i;
                        end,
                        onActive = function()
                            if Customs.List4 == 1 then
                                SetCus(ped, 3, 0, 0, 0)
                            end
                            if Customs.List4 == 2 then
                                SetCus(ped, 3, 0, 1, 0)
                            end
                            if Customs.List4 == 3 then
                                SetCus(ped, 3, 0, 2, 0)
                            end
                            if Customs.List4 == 4 then
                                SetCus(ped, 3, 1, 0, 0)
                            end
                            if Customs.List4 == 5 then
                                SetCus(ped, 3, 1, 1, 0)
                            end
                            if Customs.List4 == 6 then
                                SetCus(ped, 3, 1, 2, 0)
                            end
                        end, 
					})

                    RageUI.List("Bas", {"1", "2", "3", "4"}, Customs.List5, "", {}, true, {
                        onListChange = function(i, Item)
                            Customs.List5 = i;
                        end,
                        onActive = function()
                            if Customs.List5 == 1 then
                                SetCus(ped, 4, 0, 0, 0)
                            end
                            if Customs.List5 == 2 then
                                SetCus(ped, 4, 0, 1, 0)
                            end
                            if Customs.List5 == 3 then
                                SetCus(ped, 4, 1, 0, 0)
                            end
                            if Customs.List5 == 4 then
                                SetCus(ped, 4, 1, 1, 0)
                            end
                        end, 
					})

                    RageUI.List("Chaussures", {"1", "2", "3"}, Customs.List6, "", {}, true, {
                        onListChange = function(i, Item)
                            Customs.List6 = i;
                        end,
                        onActive = function()
                            if Customs.List6 == 1 then
                                SetCus(ped, 6, 0, 0, 0)
                            end
                            if Customs.List6 == 2 then
                                SetCus(ped, 6, 0, 1, 0)
                            end
                            if Customs.List6 == 3 then
                                SetCus(ped, 6, 1, 0, 0)
                            end
                        end, 
					})

                    RageUI.List("Chapeau", {"1", "2", "3", "4", "5", "6"}, Customs.List8, "", {}, true, {
                        onListChange = function(i, Item)
                            Customs.List8 = i;
                        end,
                        onActive = function()
                            if Customs.List8 == 1 then
                                Clear(ped, 0)
                            end
                            if Customs.List8 == 2 then
                                SetProp(ped, 0, 0, 0, 0)
                            end
                            if Customs.List8 == 3 then
                                SetProp(ped, 0, 0, 1, 0)
                            end
                            if Customs.List8 == 4 then
                                SetProp(ped, 0, 0, 2, 0)
                            end
                            if Customs.List8 == 5 then
                                SetProp(ped, 0, 1, 0, 0)
                            end
                            if Customs.List8 == 6 then
                                SetProp(ped, 0, 1, 1, 0)
                            end
                        end, 
					})

                    RageUI.List("Lunettes", {"1", "2", "3", "4"}, Customs.List7, "", {}, true, {
                        onListChange = function(i, Item)
                            Customs.List7 = i;
                        end,
                        onActive = function()
                            if Customs.List7 == 1 then
                                Clear(ped, 1)
                            end
                            if Customs.List7 == 2 then
                                SetProp(ped, 1, 0, 0, 0)
                            end
                            if Customs.List7 == 3 then
                                SetProp(ped, 1, 0, 1, 0)
                            end
                            if Customs.List7 == 4 then
                                SetProp(ped, 1, 1, 0, 0)
                            end
                        end, 
					})

                end)

                RageUI.IsVisible(PedsSubMenu, function()

					RageUI.Separator("~y~↓~s~ Liste des peds ~y~↓~s~")

					RageUI.Button("Tonton", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "tonton", 445, 344, 260, 417, 500)
                        end,   
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_m_y_downtown_01')
                        end 
					});

                    RageUI.Button("Lamar", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "lamardavis", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('ig_lamardavis')
                        end
					});

                    RageUI.Button("Mec musclé", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "BabyD", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('u_m_y_babyd')
                        end
					});

                    RageUI.Button("Prêtre", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "priest", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('ig_priest')
                            
                        end
					});

                    RageUI.Button("Prisonnier 1", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()
                            RenderSprite("RageUI", "Prisoner01", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('u_m_y_prisoner_01')
                            
                        end
					});

                    RageUI.Button("Prisonnier 2", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()
                            RenderSprite("RageUI", "Prisoner01SMY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('s_m_y_prisoner_01')
                            
                        end
					});

                    RageUI.Button("Prisonnier 3", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()
                            RenderSprite("RageUI", "rashkovsky", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('ig_rashcosvki')
                            
                        end
					});

                    RageUI.Button("Clochard 1", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "militarybum", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('u_m_y_militarybum')
                            
                        end
					});

                    RageUI.Button("Mécano 1", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "mp_m_waremech_01", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('mp_m_waremech_01')
                            
                        end
					});

                    RageUI.Button("Mécano 2", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Mp_m_weapexp_01", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('mp_m_weapexp_01')
                            
                        end
					});

                    RageUI.Button("Mécano 3", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Mp_m_weapwork_01", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('mp_m_weapwork_01')
                            
                        end
					});

                    RageUI.Button("Mécano Benny's", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Benny", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('ig_benny')
                            
                        end
					});

                    RageUI.Button("Autopsie", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "autopsy", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('s_m_y_autopsy_01')
                            
                        end
					});

                    RageUI.Button("Docteur 1", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Doctor01SMM", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('s_m_m_doctor_01')
                            
                        end
					});

                    RageUI.Button("Paramedic 1", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "paramedic01", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('s_m_m_paramedic_01')
                            
                        end
					});

                    RageUI.Button("LSPD 1", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Cop01SMY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('s_m_y_cop_01')
                            
                        end
					});

                    RageUI.Button("LSPD 2 (Femme)", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Cop01SFY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('s_f_y_cop_01')
                            
                        end
					});

                    RageUI.Button("LSPD 3 (Desert)", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "CopCutscene", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('csb_cop')
                            
                        end
					});

                    RageUI.Button("Dealer", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Dealer01SMY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('s_m_y_dealer_01')
                            
                        end
					});

                    RageUI.Button("Lester", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "lestercrest", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('ig_lestercrest')
                            
                        end
					});

                    RageUI.Button("Mec cagoulé", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "ChiCold01GMM", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_m_m_chicold_01')
                            
                        end
					});

                    RageUI.Button("Ballas 1", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "BallaEast01GMY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_m_y_ballaeast_01')
                            
                        end
					});

                    RageUI.Button("Ballas 2", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "BallaOrig01GMY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_m_y_ballaorig_01')
                            
                        end
					});

                    RageUI.Button("Ballas 3", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "BallasOG", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('ig_ballasog')
                            
                        end
					});

                    RageUI.Button("Ballas 4", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "BallaSout01GMY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_m_y_ballasout_01')
                            
                        end
					});

                    RageUI.Button("Families 1", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "famca01", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_m_y_famca_01')
                            
                        end
					});

                    RageUI.Button("Families 2", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "famdnf01", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_m_y_famdnf_01')
                            
                        end
					});

                    RageUI.Button("Families 3", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "famfor01", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_m_y_famfor_01')
                            
                        end
					});

                    RageUI.Button("Families 4 (Femme)", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "families01", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_f_y_families_01')
                            
                        end
					});

                    RageUI.Button("Marabunta 1", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "SalvaBoss01", 445, 344, 260, 417, 500)
                        end, 
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_m_y_salvaboss_01')
                            
                        end   
					});
        
                    RageUI.Button("Marabunta 2", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "SalvaGoon01", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_m_y_salvagoon_01')
                            
                        end
					});

                    RageUI.Button("Marabunta 3", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "SalvaGoon02", 445, 344, 260, 417, 500)
                        end,   
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_m_y_salvagoon_02')
                            
                        end
					});

                    RageUI.Button("Marabunta 4", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "SalvaGoon03", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_m_y_salvagoon_03')
                            
                        end
					});

                    RageUI.Button("Vagos 1", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "mexgoon01", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_m_y_mexgoon_01')
                            
                        end
					});

                    RageUI.Button("Vagos 2", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "mexgoon02", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_m_y_mexgoon_02')
                            
                        end
					});

                    RageUI.Button("Vagos 3", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "mexgoon03", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_m_y_mexgoon_03')
                            
                        end
					});

                    RageUI.Button("Mexicain 1", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "mexlabor01", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_m_m_mexlabor_01')
                            
                        end
					});

                    RageUI.Button("Mexicain 2", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "mexthug01", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_m_y_mexthug_01')
                            
                        end
					});

                    RageUI.Button("Mexicain 3", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "mexboss01", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_m_m_mexboss_01')
                            
                        end
					});

                    RageUI.Button("Mexicain 4", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "mexboss02", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_m_m_mexboss_02')
                            
                        end
					});

                    RageUI.Button("Mexicain 5", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "mexcntry01", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_m_m_mexcntry_01')
                            
                        end
					});

                    RageUI.Button("Mexicain 6", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "mexgang01", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('g_m_y_mexgang_01')
                            
                        end
					});

                    RageUI.Button("Mexicain 7", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "rampmex", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('ig_ramp_mex')
                            
                        end
					});

                    RageUI.Button("Latino 1", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "EastSA01AMM", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_m_m_eastsa_01')
                            
                        end
					});

                    RageUI.Button("Latino 2", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Eastsa01AMY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_m_y_eastsa_01')
                            
                        end
					});

                    RageUI.Button("Latino 3", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "EastSa02AMM", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_m_m_eastsa_02')
                            
                        end
					});

                    RageUI.Button("Latino 4 (Femme)", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "eastsa03afy", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_f_y_eastsa_03')
                            
                        end
					});

                    RageUI.Button("Latino 5 (Femme)", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "EastSA02AFY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_f_y_eastsa_02')
                            
                        end
					});

                    RageUI.Button("Homme plage 1", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Beach01AMM", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_m_m_beach_01')
                            
                        end
					});

                    RageUI.Button("Homme plage 2", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Beach02AMM", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_m_m_beach_02')
                            
                        end
					});

                    RageUI.Button("Homme plage 3", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Beach01AMO", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_m_o_beach_01')
                            
                        end
					});

                    RageUI.Button("Homme plage 4 (Touriste)", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Beach01AMY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_m_y_beach_01')
                            
                        end
					});

                    RageUI.Button("Homme plage 5", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Beach02AMY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_m_y_beach_02')
        
                        end
					});

                    RageUI.Button("Femme plage 1", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "BayWatch01SFY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('s_f_y_baywatch_01')
                            
                        end
					});

                    RageUI.Button("Femme plage 2", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Beach01AFM", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_f_m_beach_01')
                            
                        end
					});

                    RageUI.Button("Vigile", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Doorman01SMY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('s_m_y_doorman_01')
                            
                        end
					});

                    RageUI.Button("Clown", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Clown01SMY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('s_m_y_clown_01')
                            
                        end
					});

                    RageUI.Button("Femme 1", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "BevHills01AFM", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_f_m_bevhills_01')
                            
                        end
					});

                    RageUI.Button("Femme 2", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "BoatStaff01F", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('mp_f_boatstaff_01')
                            
                        end
					});

                    RageUI.Button("Femme 3", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Bevhills01AFY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_f_y_bevhills_01')
                            
                        end
					});

                    RageUI.Button("Femme 4", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "BevHills02AFM", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_f_m_bevhills_02')
                            
                        end
					});

                    RageUI.Button("Femme 5", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "BevHills02AFY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_f_y_bevhills_02')
                            
                        end
					});

                    RageUI.Button("Femme 6", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "Bevhills03AFY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_f_y_bevhills_03')
                            
                        end
					});

                    RageUI.Button("Femme 7", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "BevHills04AFY", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('a_f_y_bevhills_04')
                            
                        end
					});

                    RageUI.Button("Femme 8", nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onActive = function()--              --   --
                            RenderSprite("RageUI", "BikerChic", 445, 344, 260, 417, 500)
                        end,    
                        onSelected = function()
                            ParticleMaker("scr_rcbarry2", "scr_clown_appears", 0.5) Citizen.Wait(100)
                            SpawnPed('u_f_y_bikerchic')
                            
                        end
					});

				end)

            end
        end)
    end
end

RegisterCommand("peds", function() 
    if group == false then
        RageUI.CloseAll()
        Citizen.Wait(200)
    elseif group == true then 
        OpenPedsMenu()
    end
end)

TriggerEvent('chat:addSuggestion', '/peds', 'Ouvrir le menu peds (VIP)', {})
   