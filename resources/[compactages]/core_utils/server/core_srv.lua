-- PiggiBack

RegisterServerEvent('cmg2_animations:sync')
AddEventHandler('cmg2_animations:sync', function(target, animationLib, animation, animation2, distans, distans2, height,targetSrc,length,spin,controlFlagSrc,controlFlagTarget,animFlagTarget)
	print("got to srv cmg2_animations:sync")
	TriggerClientEvent('cmg2_animations:syncTarget', targetSrc, source, animationLib, animation2, distans, distans2, height, length,spin,controlFlagTarget,animFlagTarget)
	print("triggering to target: " .. tostring(targetSrc))
	TriggerClientEvent('cmg2_animations:syncMe', source, animationLib, animation,length,controlFlagSrc,animFlagTarget)
end)

RegisterServerEvent('cmg2_animations:stop')
AddEventHandler('cmg2_animations:stop', function(targetSrc)
	TriggerClientEvent('cmg2_animations:cl_stop', targetSrc)
end)

-- esx_announce

TriggerEvent('es:addGroupCommand', 'announce', "mod", function(source, args, user)
	TriggerClientEvent('announce', -1, "~o~ANNONCE", table.concat(args, " "), 5)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Autorisations insuffisantes !")
end, {help = "Annoncer un message à l'ensemble du serveur", params = {{name = "announcement", help = "Le message à annoncer"}}})

-- AFK Kick

RegisterServerEvent("kickForBeingAnAFKDouchebag")
AddEventHandler("kickForBeingAnAFKDouchebag", function()
	DropPlayer(source, "Vous avez été Kick car votre inactivité a été > 15 minutes.")
end)