-- SparroW MTA :https://sparrow-mta.blogspot.com
-- Facebook :https://www.facebook.com/sparrowgta/
-- İyi Oyunlar...

local screenH, screenW = guiGetScreenSize()
local x, y = (screenH/1920), (screenW/1080)
local tableChat = {}
local tableServido = {}
local servidorInfo = false
local progress01   = false
local cor          = {}
local enableChat   = true

function chat ()
showChat(false)
     if isTimer(chatT) or bind and enableChat then
         local doRemove = { top = { }, bottom = { } }
         for i, v in pairs ( tableChat ) do
	      	 if i >= (v.mxc or 5) then 
	    	     table.remove ( tableChat, 1)
	    		 return
	    	 end
		     local width = dxGetTextWidth(tostring(v.message:gsub("#%x%x%x%x%x%x", "")), x*1.20, "default-bold") 
		         dxDrawImage (44*x, screenW-(1100-(i*65))*y, width+200*x, 60*y, "files/walpaper2.png", 0, 0, 0, tocolor(0, 0, 0, 130))
		         dxDrawImage (44*x, screenW-(1100-(i*65))*y, width+200*x, 60*y, "files/walpaper.png", 0, 0, 0, tocolor(v.corR, v.corG, v.corB, 170))
				 dxDrawImage (44*x, screenW-(1100-(i*65))*y, 34*x, 31*y, "icon/"..(v.imagem)..".png", 0, 0, 0, tocolor(255,255,255, 170))
                 dxDrawText(tostring(v.player:gsub("#%x%x%x%x%x%x", "")).."\n#FFFFFF"..tostring(v.message:gsub("#%x%x%x%x%x%x", "")), 80*x, screenW-(1900-(i*130))*y, 426*x, 835*y, tocolor(254, 254, 254, 244), x*1.20, "default-bold", "left", "center", false, false, false, true, false)
		 end
		 else
		 if bind then
			 bind = false
			 text = nil
		 end
		 cor[1] = tocolor(1, 0, 0, 165)
	     if isCursorOnElement(x*35, y*54, x*35, y*35) then 
			 cor[1] = tocolor(1, 0, 0, 100) 
		     dxDrawRectangle(x*74, y*55, x*238, y*33, tocolor(0, 149, 219, 255), false)
		     if enableChat then
		    	 dxDrawText("Sohbeti gizlemek için tıkla.", x*85, y*55, x*312, y*88, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "left", "center", false, false, false, false, false)
		     else
                 dxDrawText("Sohbeti açmak için tıkla.", x*85, y*55, x*312, y*88, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "left", "center", false, false, false, false, false)
		     end
		 end
	     dxDrawRectangle(x*35, y*54, x*35, y*35, tocolor(1, 0, 0, 165), false)
		 if enableChat then
		     dxDrawText("<", x*33, y*54, x*74, y*95, tocolor(255, 255, 255, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
		 else
             dxDrawText(">", x*33, y*54, x*74, y*95, tocolor(255, 255, 255, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
		 end
     end
	 if bind then
	     local txt = dxGetTextWidth(guiGetText(boxText):gsub("#%x%x%x%x%x%x", ""), x*1.40, "default-bold")
		 if math.floor(txt) < 461 then
	    	 cor[2] = tocolor(1, 0, 0, 165)
	         if isCursorOnElement(x*511, y*375, x*40, y*40) then 
		    	 cor[2] = tocolor(1, 0, 0, 100) 
	    	     dxDrawRectangle(x*560, y*375, x*238, y*39, tocolor(0, 149, 219, 160), false)
	    	     if enableChat then
	     	    	 dxDrawText("Sohbeti gizlemek için tıkla.", x*570, y*750, x*238, y*39, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "left", "center", false, false, false, false, false)
	    	     else
                      dxDrawText("Sohbeti açmak için tıkla.", x*570, y*750, x*238, y*39, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "left", "center", false, false, false, false, false)
	    	     end
	    	 end
		     dxDrawRectangle(x*511, y*375, x*40, y*39, cor[2], false)
             dxDrawText("<", x*505, y*375, x*558, y*417, tocolor(255, 255, 255, 255), x*1.10, "pricedown", "center", "center", false, false, false, false, false)
	    	 dxDrawRectangle(x*45, y*375, x*461, y*39, tocolor(1, 0, 0, 150), false)
		     dxDrawText(string.sub(guiGetText(boxText), x*1.2), x*140, y*387, x*504, y*413, tocolor(255, 255, 255, 160), x*1.1, "default-bold", "left", "top", false, false, false, false, false)
             dxDrawText((text or "RZK"), x*45, y*375, x*129, y*414, tocolor(255, 254, 254, 156), x*1.20, "default-bold", "center", "center", false, false, false, false, false)
		 else
	    	 dxDrawRectangle(x*45, y*375, x*txt, y*39, tocolor(1, 0, 0, 150), false)
	    	 dxDrawText(string.sub(guiGetText(boxText), x*1.2), x*140, y*387, x*504, y*413, tocolor(255, 255, 255, 160), x*1.1, "default-bold", "left", "top", false, false, false, false, false)
             dxDrawText((text or "RZK"), x*45, y*375, x*129, y*414, tocolor(255, 254, 254, 156), x*1.20, "default-bold", "center", "center", false, false, false, false, false)
		 end
	 end
end
addEventHandler("onClientRender", getRootElement(), chat)

local chatsTable = {
     {'twitter', true, '', 0, 115, 169, 'twt'},
	 {'ano', false, 'Anonimo', 67, 67, 67, 'ano'},
	 {'fr', true, '', 119, 255, 0, 'frp'},
	 {'olx', true, '', 157, 0, 255, 'olx'},
	 {'local', true, '', 255, 196, 0, 'local'},
}

local function getArgumentIndex (argument)
     for i=1, #chatsTable do
	     print(argument..' == '..chatsTable[i][1])
	     if argument == chatsTable[i][1] then
		     return i
		 end
	 end
end

function serverInformations (player, typ, text)
     if text and enableChat then
	 removeEventHandler("onClientRender", getRootElement(), chat)
	 addEventHandler("onClientRender", getRootElement(), chat)
		 showChat(false)
		 local time = tim or 50
		 local index = getArgumentIndex (typ)
		     if chatsTable[index][2] then
	    	     sur = "@"..getPlayerName(player).." #00AAFF["..(getElementData(player, "char:id") or 0).."]"
			 else
			     sur = chatsTable[index][3]
			 end
			 r = tonumber(chatsTable[index][4])
			 g = tonumber(chatsTable[index][5])
			 b = tonumber(chatsTable[index][6])
			 img = chatsTable[index][7]
         local data = { 
		 mxc     = 6,
		 message = text,
		 corR    = r,
		 corG    = g,
		 corB    = b,
		 player  = sur,
         imagem  = img
	     }		
		 if isTimer(chatT) then
		     killTimer(chatT)
		 end
		 chatT = setTimer(function() end, 20000, 1)
         table.insert(tableChat, data)	 
	 end
end
addEvent("chat:box", true)
addEventHandler("chat:box", resourceRoot, serverInformations)

addEventHandler("onClientResourceStart", resourceRoot,
    function()
         boxText = guiCreateEdit(x*0, y*0, x*0, y*0, "", false)    
		 guiSetVisible(boxText, false)
		 guiEditSetMaxLength ( boxText, 41 )
		 guiSetAlpha(boxText, 0)
		 showChat(false)
    end
)

addEventHandler("onClientVehicleStartEnter", root, 
function(player,seat,door)
	 if (player == localPlayer and bind)then
	     cancelEvent()
     end
end)
 
 addEventHandler("onClientVehicleStartExit", root, 
function(player,seat,door)
	 if (player == localPlayer and bind)then
	     cancelEvent()
     end
end)
 
addEventHandler("onClientKey", root,
function(key, press)  
     if key == "enter" then
	     if guiGetText(boxText) ~= "" then
		     if sett and press then
			 --    if not isTimer(antSpawn) then
		             triggerServerEvent("mat:chat", resourceRoot, localPlayer, sett, guiGetText(boxText))
					 antSpawn = setTimer(function() end, 20000, 1)
					 guiSetText(boxText, "")
    	             text = nil
         	    	 guiSetVisible(boxText, false)
        	    	 showCursor(false)
					 setTimer(function()
					     bind = false
					 end, 10, 1)
		     end
		 else
			 setTimer(function()
				 bind = false
			 end, 10, 1)
    	     text = nil
    	     guiSetVisible(boxText, false)
    	     showCursor(false)
	     end
	 elseif key == "tab" then
	     bind = false
	     text = nil
	     guiSetVisible(boxText, false)
	     showCursor(false)
     end
	 if not isCursorShowing () then
         if key == "t" then
    	     if not bind and not press then
    		     if enableChat then
        	         bind = true
        	         text = "Twitter"
        		     sett = "twitter"
        		     showCursor(true)
        			 guiFocus(boxText)
         		     guiSetVisible(boxText, true)
					 guiSetAlpha (boxText, 0)
        			 if not press then
          	    	     guiSetText(boxText, "")
        			 end
    			 end
    		 end
    	 elseif key == "y" then
    	     if not bind and not press then
    		     if enableChat then
    	             bind = true
    	             text = "Rol Chat"
     	    	     sett = "fr"
    	    	     showCursor(true)
    	      		 guiFocus(boxText)
    	    	     guiSetVisible(boxText, true)
         	    	 guiSetText(boxText, "")
     		     end
    		 end
	     elseif key == "u" then
	         if not bind and not press then
		         if enableChat then
    	             bind = true
    	             text = "Anonim Chat"
    		         sett = "ano"
    		         showCursor(true)
    			     guiFocus(boxText)
    		         guiSetVisible(boxText, true)
    	    	     guiSetText(boxText, "")
		         end
		     end
	     elseif key == "o" then
	         if not bind and not press then
		         if enableChat then
     	             bind = true
    	             text = "OLX"
    		         sett = "olx"
    		         showCursor(true)
    			     guiFocus(boxText)
    		         guiSetVisible(boxText, true)
    	    	     guiSetText(boxText, "")
		         end
		     end
	     elseif key == "i" then
	         if not bind and not press then
		          if enableChat then
    	             bind = true
    	             text = "Local Chat"
    		         sett = "local"
    		         showCursor(true)
    			     guiFocus(boxText)
    		         guiSetVisible(boxText, true)
    	    	     guiSetText(boxText, "")
		         end
			 end
		 end
	 end
end)

addEventHandler("onClientKey", root, function(key, press) 
     if(bind == true) then 
         cancelEvent() 
     end 
end) 

addEventHandler("onClientClick", root,
function (button, state)
     if state == "down" then 
         if isCursorOnElement(x*35, y*54, x*35, y*35) then 
             if enableChat then
			     enableChat = false
				 showCursor(false)
				 bind = false
				 if isTimer(chatT) then
		             killTimer(chatT)
		         end
             else
			     enableChat = true
             end			 
         elseif isCursorOnElement(x*511, y*375, x*40, y*40) then 
             if enableChat and bind == true then
			     enableChat = false
				 bind = false
				 showCursor(false)
				 if isTimer(chatT) then
		             killTimer(chatT)
		         end
             else
			     if bind then
			         enableChat = true
				 end
             end			 
         end
	 end
end)
 
local x,y = guiGetScreenSize()
 function isCursorOnElement(x,y,w,h)
     if isCursorShowing () then
	     local mx,my = getCursorPosition ()
     	 local fullx,fully = guiGetScreenSize()
	     cursorx,cursory = mx*fullx,my*fully
	     if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
	    	 return true
	     else
		     return false
		 end
	end
end