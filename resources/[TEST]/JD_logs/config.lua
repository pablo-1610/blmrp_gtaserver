Config = {}

Config.AllLogs = true																								-- Enable/Disable All Logs Channel
Config.postal = true  																								-- set to false if you want to disable nerest postal (https://forum.cfx.re/t/release-postal-code-map-minimap-new-improved-v1-2/147458)
Config.username = "SunFive" 																							-- Bot Username
Config.avatar = "https://cdn.discordapp.com/attachments/875406292125122591/875414124048289792/los_Santos.png"				-- Bot Avatar
Config.communtiyName = "SunFive"																						-- Icon top of the embed
Config.communtiyLogo = ""		-- Icon top of the embed
Config.FooterText = "2020 - 2021 © Prefech"																			-- Footer text for the embed
Config.FooterIcon = ""			-- Footer icon for the embed


Config.weaponLog = true  			-- set to false to disable the shooting weapon logs
Config.InlineFields = true			-- set to false if you don't want the player details next to each other

Config.playerID = true				-- set to false to disable Player ID in the logs
Config.steamID = true				-- set to false to disable Steam ID in the logs
Config.steamURL = true				-- set to false to disable Steam URL in the logs
Config.discordID = true				-- set to false to disable Discord ID in the logs
Config.license = true				-- set to false to disable license in the logs
Config.IP = true					-- set to false to disable IP in the logs

-- Change color of the default embeds here
-- It used Decimal or Hex color codes. They will both work.
Config.BaseColors ={				-- For more info have a look at the docs: https://docs.prefech.com
	chat = "#A1A1A1",				-- Chat Message
	joins = "#3AF241",				-- Player Connecting
	leaving = "#F23A3A",			-- Player Disconnected
	deaths = "#000000",				-- Shooting a weapon
	shooting = "#2E66F2",			-- Player Died
	resources = "#EBEE3F",			-- Resource Stopped/Started	
}


Config.webhooks = {					-- For more info have a look at the docs: https://docs.prefech.com
	all = "https://discord.com/api/webhooks/888117959124475924/rZNflNIhdsQB10F0YxeT9jBGxjxrlTelbt7I1WnMPI5yH2zOaPtAimOrugNW3h0mZ_dm",		-- All logs will be send to this channel
	chat = "https://discord.com/api/webhooks/888117959124475924/rZNflNIhdsQB10F0YxeT9jBGxjxrlTelbt7I1WnMPI5yH2zOaPtAimOrugNW3h0mZ_dm",		-- Chat Message
	joins = "https://discord.com/api/webhooks/888118080180465734/WGyCRLnLxAEBn3aFhwDQfjHGHNA-MPa1gHFuET1JVYTAUy8Mi1c0CYht0nnz4QzQJh7E",		-- Player Connecting
	leaving = "https://discord.com/api/webhooks/888118080180465734/WGyCRLnLxAEBn3aFhwDQfjHGHNA-MPa1gHFuET1JVYTAUy8Mi1c0CYht0nnz4QzQJh7E",	-- Player Disconnected
	deaths = "https://discord.com/api/webhooks/888118315422195712/xz-TeFFVMQndNP07tK7G3rW1TLwXPXZDCQo4NYg6zWcovXCX1k-hNh7vWxm_PND5oUft",		-- Shooting a weapon
	shooting = "https://discord.com/api/webhooks/888118640753377290/mw1YqkvxY93k0WIFucykA0f-EDx0PbTOhAwGZiW7_BywVXsEEDx2aJQqACoCHU9j0K1L",	-- Player Died
	resources = "https://discord.com/api/webhooks/888118739302756402/tcpWNahj_wFJgKOmvG6HjMC9AA6UiwIh1OCgC4fIV8ROCOj1G3xEYiTZx77IqNbosJvj",	-- Resource Stopped/Started	
}

Config.TitleIcon = {			-- For more info have a look at the docs: https://docs.prefech.com
	chat = "💬",				-- Chat Message
	joins = "📥",				-- Player Connecting
	leaving = "📤",				-- Player Disconnected
	deaths = "💀",				-- Shooting a weapon
	shooting = "🔫",			-- Player Died
	resources = "🔧",			-- Resource Stopped/Started	
}

Config.Plugins = {
	--["PluginName"] = {color = "#FFFFFF", icon = "🔗", webhook = "DISCORD_WEBHOOK"},
	["NameChange"] = {color = "#03fc98", icon = "🔗", webhook = "DISCORD_WEBHOOK"},
}


 --Debug shizzels :D
Config.debug = false
Config.versionCheck = "1.3.0"