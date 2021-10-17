Citizen.CreateThread(function()
	while true do
		SetDiscordAppId(885573543448961094)

	-- Grand --
		SetDiscordRichPresenceAsset('1')
        SetDiscordRichPresenceAssetText('SunFive')

	-- Petit --
 SetDiscordRichPresenceAssetSmall('2')
SetDiscordRichPresenceAssetSmallText('https://discord.gg/FDa455ZZcn')

	-- Bouton --

		SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/FDa455ZZcn")

		players = {}
		for i = 0, 255 do
			if NetworkIsPlayerActive( i ) then
				table.insert( players, i )
			end
		end

	-- Deuxième Bouton --

		SetDiscordRichPresenceAction(1, "Se Connecter", "fivem://connect/141.94.78.244")

		players = {}
		for i = 0, 255 do
			if NetworkIsPlayerActive( i ) then
					table.insert( players, i )
			end
		end

	-- NB joueurs--

		SetRichPresence(GetPlayerName(PlayerId()) .. " - ".. #players .. "/64") -- nombre de slots

		Citizen.Wait(60000)
	end
end)
