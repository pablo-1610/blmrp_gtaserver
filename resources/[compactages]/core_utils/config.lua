Config = {}

Config.Map = {
  {name="Quartier Ballas",color=27, id=484,x=79.32, y = -1917.64, z = 21.07},
  {name="Quartier Vagos",color=46, id=484,x=338.41, y = -2042.79, z = 21.27},
  {name="Quartier Families",color=69, id=484,x=-29.19, y = -1462.58, z = 31.06},
  {name="Villa Famille Irlandaise",color=4, id=378,x=1436.94, y = 1103.8033, z = 114.08},
  {name="Villa CosaNostra",color=40, id=378,x=-1518.3732, y = 125.994, z = 72.490},
  {name="Villa Cayo",color=40, id=378,x=5039.4592, y = -5759.7875, z = 15.6801},
  {name="Pont de Cayo Perico",color=19, id=677,x=1290.648, y = -3327.031, z = 5.94},
  {name="Quartier 410th",color=40, id=484,x=-71.358192443848, y = -342.20205688477, z = 42.156223297119}


}


local blips = {


 -- {title="Douane" ,colour=1, id=521, x = 5153.6967, y = -4935.83, z = 30.87},

  {title="Reseau Cayo",colour=83, id=564, x = 5265.95, y = -5427.62, z = 65.59},

  {title="fete Cayo",colour=34, id=480, x = 4893.24, y = -4924.63, z = 3.36}

 }
     
Citizen.CreateThread(function()

  for _, info in pairs(blips) do
     info.blip = AddBlipForCoord(info.x, info.y, info.z)
     SetBlipSprite(info.blip, info.id)
     SetBlipDisplay(info.blip, 4)
     SetBlipScale(info.blip, 1.0)
     SetBlipColour(info.blip, info.colour)
     SetBlipAsShortRange(info.blip, true)
   BeginTextCommandSetBlipName("STRING")
     AddTextComponentString(info.title)
     EndTextCommandSetBlipName(info.blip)
   end
end) 


Config.Pos = {

	    S  = {

		text = "Bienvenue\nSur le Serveur ~b~BLM RP~w~ !\nPasse un bon moment !",

		Pos = {x = -530.39,   y = -229.2, z = 36.7},

	},

        H  = {

		text = "Si vous avez ~r~raté~w~ la ~r~création~w~ \n de ~r~votre personnage~w~ faites un \n ~r~/register~w~ ! ",

		Pos = {x = -538.09,   y = -216.43, z = 37.65},

  }
}


