Citizen.CreateThread(function()
    ESX = nil
    
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


CreateThread(function()
	while true do
		-- draw every frame
		Wait(0)
		DrawMarker(Config.MarkerID, Config.Blipcoord.x, Config.Blipcoord.y, Config.Blipcoord.z + 2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 0, 0, 50, false, true, 2, nil, nil, false)
	end
end)





_menuPool = NativeUI.CreatePool()
if Config.Blip then
local name = Config.Blipname or 'Pet-Shop'
		local npc = GetHashKey(Config.SellerNPC)
		local blip = AddBlipForCoord(Config.Blipcoord.x, Config.Blipcoord.y, Config.Blipcoord.z)
        SetEntityInvincible(NPCPed, true)
        SetBlockingOfNonTemporaryEvents(NPCPed, true) 
        FreezeEntityPosition(lol, true)
		SetBlipSprite (blip, Config.BlipID)
		SetBlipScale  (blip, 0.65)
		SetBlipDisplay(blip, 4)
		SetBlipColour (blip, Config.BlipColorID)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName('STRING') 
		AddTextComponentString(name)
		EndTextCommandSetBlipName(blip)
end

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
    ESX.TriggerServerCallback("PetL", function(modell)
        print(modell)
    mainmenu = NativeUI.CreateMenu(Translation[Config.Locale]['MainMenuName'], Translation[Config.Locale]['MainMenuDesc'])
    _menuPool:Add(mainmenu)
	_menuPool:RefreshIndex()
	_menuPool:MouseControlsEnabled (false)
	_menuPool:MouseEdgeEnabled (false)
	_menuPool:ControlDisablingEnabled(false)
	mainmenu:Visible(true)

    local BuyMenu = NativeUI.CreateItem(Translation[Config.Locale]['BuyItemName'], Translation[Config.Locale]['BuyItemDesc'])
    local SellMenu = NativeUI.CreateItem(Translation[Config.Locale]['SellItemName'], Translation[Config.Locale]['SellItemDesc'])
    mainmenu:AddItem(BuyMenu)
    mainmenu:AddItem(SellMenu)
 if modell == nil then
    SellMenu:Enabled(false)
 else
    BuyMenu:Enabled(false)
 end
BuyMenu.Activated = function(sender,index)
mainmenu:Visible(false)
buyshopmenu()
end

SellMenu.Activated = function(sender,index)
    mainmenu:Visible(false)
    sellmenu()
end
end)
end


function buyshopmenu()
    buymenu = NativeUI.CreateMenu(Translation[Config.Locale]['BuyMenuName'],"")
    _menuPool:Add(buymenu)
	_menuPool:RefreshIndex()
	_menuPool:MouseControlsEnabled (false)
	_menuPool:MouseEdgeEnabled (false)
	_menuPool:ControlDisablingEnabled(false)
	buymenu:Visible(true)
    ESX.TriggerServerCallback("PetL", function(modell)
        ESX.TriggerServerCallback('PetL:getjob', function(job)
    for k, v in pairs(Config.Pets) do
            local Pet = NativeUI.CreateItem(v.name, "")
        buymenu:AddItem(Pet)
        Pet:RightLabel('~g~' .. v.price .. Config.Currency)


        if v.model == nil or v.model == modell then
            Pet:Enabled(false)
        end
        if v.job ~= nil and v.job ~= job then
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
    TriggerServerEvent("PetL:InsertPet", v.model, v.price, result)
    end
end
end)
end)
end 

function sellmenu()
    sellmenu2 = NativeUI.CreateMenu(Translation[Config.Locale]['SellMenuName'],"")
    _menuPool:Add(sellmenu2)
	_menuPool:RefreshIndex()
	_menuPool:MouseControlsEnabled (false)
	_menuPool:MouseEdgeEnabled (false)
	_menuPool:ControlDisablingEnabled(false)
	sellmenu2:Visible(true)
    local yes = NativeUI.CreateItem("~g~" ..Translation[Config.Locale]['yes'], "")
    local no = NativeUI.CreateItem("~r~" .. Translation[Config.Locale]['no'], "")
    sellmenu2:AddItem(yes)
    sellmenu2:AddItem(no)
    no.Activated = function(sender,index)
        sellmenu2:Visible(false)
        openMenu()
    end

    
    yes.Activated = function(sender,index)
        ESX.TriggerServerCallback("PetL", function(modell)
            for k, v in pairs(Config.Pets) do
                if v.model == modell then
                    TriggerServerEvent("PetL:Money", v.price)
                end
            end
        end)
        TriggerEvent("DogL:deleteped")
        TriggerServerEvent("PetL:DeletePet", source)
        notify(Translation[Config.Locale]['sold'])
        sellmenu2:Visible(false)
        openMenu()
    end

end

