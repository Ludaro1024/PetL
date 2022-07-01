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
        if GetDistanceBetweenCoords(Config.Blipcoord.x, Config.Blipcoord.y, Config.Blipcoord.z, pedCoord) < 3.0 then
            ESX.ShowHelpNotification(Translation[Config.Locale]['notify'])
            if IsControlJustReleased(0, 38) then
                openMenu()
				end
            end
    end
end)

function openMenu()
    mainmenu = NativeUI.CreateMenu(Translation[Config.Locale]['MainMenuName'], Translation[Config.Locale]['MainMenuDesc'])
    _menuPool:Add(mainmenu)
	_menuPool:RefreshIndex()
	_menuPool:MouseControlsEnabled (false)
	_menuPool:MouseEdgeEnabled (false)
	_menuPool:ControlDisablingEnabled(false)
	mainmenu:Visible(true)
    local BuyMenu = NativeUI.CreateItem(Translation[Config.Locale]['BuyItemName'], Translation[Config.Locale]['BuyItemDesc'])
    local SellMenu = NativeUI.CreateItem(Translation[Config.Locale]['SellItemName'], Translation[Config.Locale]['SelItemDesc'])
    mainmenu:AddItem(BuyMenu)
    mainmenu:AddItem(SellMenu)
BuyMenu.Activated = function(sender,index)
mainmenu:Visible(false)
buyshopmenu()
    end
end


function buyshopmenu()
    buymenu = NativeUI.CreateMenu(Translation[Config.Locale]['BuyMenuName'],"")
    _menuPool:Add(buymenu)
	_menuPool:RefreshIndex()
	_menuPool:MouseControlsEnabled (false)
	_menuPool:MouseEdgeEnabled (false)
	_menuPool:ControlDisablingEnabled(false)
	buymenu:Visible(true)
    ESX.TriggerServerCallback('PetL:getpetmodel', function(modell, job)
    for k, v in pairs(Config.Pets) do
            local Pet = NativeUI.CreateItem(v.name, "")
        buymenu:AddItem(Pet)
        Pet:RightLabel('~b~' .. v.price .. Config.Currency)

        if v.model == modell then
            Pet:Enabled(false)
        end
        if v.job ~= nil and v.job == job then
            Pet:Enabled(false)
        end
    Pet.Activated = function(sender,index)
    buymenu:Visible(false)
    local Text =  Translation[Config.Locale]['ChooseNickname']
AddTextEntry(Text, Text)
DisplayOnscreenKeyboard(1, Text, "", "", "", "", "", Config.NicknameLength)  
        while(UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0);
            Wait(0);
        end
        if(GetOnscreenKeyboardResult()) then
            result = GetOnscreenKeyboardResult()
        end
    notify(Translation[Config.Locale]['Bought'])
    TriggerServerEvent("PetL:InsertPet", v.model, v.price, v.nickname)
    end
end
end)
end 
