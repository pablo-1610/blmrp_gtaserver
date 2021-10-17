-- SparroW MTA :https://sparrow-mta.blogspot.com
-- Facebook :https://www.facebook.com/sparrowgta/
-- İyi Oyunlar...

addEvent("mat:chat", true)
addEventHandler("mat:chat", resourceRoot, 
function (thePlayer, set, ...)
     if set and {...} then
     local tableM = {...}
     local first = tableM[1] 
	 table.remove(tableM, 1)
	     if string.sub(first,1,1) == "/" then 
		     local command = string.sub(first, 2, string.len(first)) 
			 executeCommandHandler( command, thePlayer)
		 else
	         if set == "local" then
		         local x,y,z = getElementPosition(thePlayer)
                 local players = getElementsWithinRange(x, y, z, 50, "player")
                 local player = nil
                 for i = 1, #players do
	                 player = players[i] -- it's your player
					 triggerClientEvent(player, "chat:box", resourceRoot, thePlayer, set, first)
                 end
	         else
			     local players = getElementsByType("player")
                 local player = nil
                 for i = 1, #players do
				     player = players[i]
	                 triggerClientEvent(player, "chat:box", resourceRoot, thePlayer, set, first)
				 end
			 end
	     end
	 end
end)

function serverInformations(player, msg)
     if isElement(player) and msg then
	     triggerClientEvent(player, "chat:box", resourceRoot, player, 'mat', msg)
	 end
end