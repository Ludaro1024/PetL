Citizen.CreateThread(function()
    ESX = nil
    
    while ESX == nil do
        TriggerEvent(Config.ESXEvent, function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)





_menuPool = NativeUI.CreatePool()
local name = Config.Blipname or 'Pet-Shop'
		
		local blip = AddBlipForCoord(Config.Blipcoord.x, Config.Blipcoord.y, Config.Blipcoord.z)
		SetBlipSprite (blip, Config.BlipID)
		SetBlipScale  (blip, 0.65)
		SetBlipDisplay(blip, 4)
		SetBlipColour (blip, Config.BlipColorID)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName('STRING') 
		AddTextComponentString(name)
		EndTextCommandSetBlipName(blip)

Citizen.CreateThread(function()
    while true do
        _menuPool:ProcessMenus()
        Citizen.Wait(0)
        local pedCoord = GetEntityCoords(PlayerPedId())
        if GetDistanceBetweenCoords(Config.Petmenu.x, Config.Petmenu.y, Config.Petmenu.z, pedCoord) < 3.0 then
            ESX.ShowHelpNotification(Translation[Config.Locale]['notify'])
            if IsControlJustReleased(0, 38) then
                openMenu()
				end
            end
    end
end)
