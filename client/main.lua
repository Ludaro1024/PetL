
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local hashund = true
local idd = nil
local iddd = nil
local lol = nil
local pedpet = GetHashKey(Config.PetModel)

function CreatePedd()
    RequestModel(pedpet)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
lol = CreatePed(4, pedpet, playerCoords.x - 10, playerCoords.y, playerCoords.z, 269.6115, true, false)
FreezeEntityPosition(lol, false)
TaskFollowToOffsetOfEntity(lol, playerPed, 0, 0, 0, 1073741824.0, -1, 5, true)
--setpedkeeptask(lol, true)
function followped(loll)
TaskFollowToOffsetOfEntity(loll, playerPed, 0, 0, 0, 1073741824.0, -1, 5, true)
--setpedkeeptask(loll, true)
end
------print(lolr)
idd2 = NetworkGetNetworkIdFromEntity(lol)
idd = NetworkGetEntityFromNetworkId(idd2)
--print(idd)
AddEventHandler('onResourceStop', function()
    DeletePed(idd)
    end)
return idd
end
local ECM = exports["ContextMenu"]
local isPedDoingAnimation = "no"

ECM:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)

if IsEntityAVehicle(hitEntity) then
    local auto = ECM:AddItem(0, Translation[Config.Locale]['GetIncar'], function()
        local dictionary = "creatures@rottweiler@incar@"
        local animation = "sit"
        SetPedNeverLeavesGroup(idd, false)
        ClearPedTasksImmediately(idd
        TaskEnterVehicle(idd, hitEntity, 20000, 0, 1.5, 1, 0)
    end)
    
end

ESX.TriggerServerCallback('dogscript:getpet', function(pett)
if idd == nil and pett  then
local rufen = ECM:AddItem(0, Translation[Config.Locale]['Calldog'], function()
    CreatePedd()
    local dictionary = "rcmnigel1c"
    local animation = "hailing_whistle_waive_a"
    RequestAnimDict(dictionary)
    while (not HasAnimDictLoaded(dictionary)) do Citizen.Wait(0) end
    TaskPlayAnim(PlayerPedId(), dictionary, animation, 1.0, 0.0, -1, 1, 0, 0, 0, 0)
    Wait(1000)
    StopAnimTask(PlayerPedId(), dictionary, animation, 1.0)
end)
end
end)
if IsEntityAPed(hitEntity) and idd ~= nil and hitEntity ~= idd then
    local angreifen = ECM:AddItem(0, Translation[Config.Locale]['AttackPerson'], function()
        RequestTaskMoveNetworkStateTransition(PlayerPedId(), 'Stop')
        SetPedConfigFlag(PlayerPedId(), 36, 0)
ClearPedSecondaryTask(PlayerPedId())
        StopAnimTask(PlayerPedId(), dictionary, animation, 1.0)
        SetPedNeverLeavesGroup(idd, false)
        ClearPedTasksImmediately(idd)
        SetBlockingOfNonTemporaryEvents(idd, true)
        SetPedFleeAttributes(idd, 0, 0)
        TaskCombatPed(idd, hitEntity, 0, 16)
    end)

    local folgen = ECM:AddItem(0, Translation[Config.Locale]['FollowPerson'], function()
        SetPedNeverLeavesGroup(idd, false)
        ClearPedTasksImmediately(idd)
        SetBlockingOfNonTemporaryEvents(idd, true)
        SetPedFleeAttributes(idd, 0, 0)
        TaskFollowToOffsetOfEntity(idd, hitEntity, 0, 0, 0, 1073741824.0, -1, 5, true)
    end)
end

if not IsPedAPlayer(hitEntity) and idd ~= nil and not IsEntityAPed(hitEntity) and not IsEntityAVehicle(hitEntity) then
    local lauf = ECM:AddItem(0, Translation[Config.Locale]['GoHere'], function()
        SetPedNeverLeavesGroup(idd, false)
            ClearPedTasksImmediately(idd)
            SetBlockingOfNonTemporaryEvents(idd, true)
            SetPedFleeAttributes(idd, 0, 0)
            TaskGoToCoordAnyMeans(idd, worldPosition.x, worldPosition.y, worldPosition.z, 5.0, 0, 0, 786603, 0xbf800000)
            checked = false
    end)
end

    
if hitEntity == idd then
    local itemistes = ECM:AddItem(0, Translation[Config.Locale]['GoHome'], function()

        
        local coords      = worldPosition
            SetPedNeverLeavesGroup(hitEntity, false)
            SetGroupSeparationRange(GroupHandle, 1.9)
            ClearPedTasksImmediately(hitEntity)
            SetBlockingOfNonTemporaryEvents(hitEntity, true)
            SetPedFleeAttributes(hitEntity, 0, 0)
            TaskGoToCoordAnyMeans(hitEntity, coords.x + 40, coords.y, coords.z, 5.0, 0, 0, 786603, 0xbf800000)
            Citizen.Wait(5000)
            DeletePed(hitEntity)
    end)

local playerPed = PlayerPedId()
local playerPosition = GetEntityCoords(playerPed)


-- calculate the distance between the interaction point in the world and the player
local distance = #(worldPosition - playerPosition)

    if hitEntity == idd  and Config.Tricks then
        local menuId, itemId = ECM:AddSubmenu(0, "Kunststücke")
local item = ECM:AddItem(1, Translation[Config.Locale]['Sit'], function()
    local dictionary = "creatures@rottweiler@amb@world_dog_sitting@base"
        local animation = "base"
        isPedDoingAnimation = "no"

    if IsEntityPlayingAnim(hitEntity, dictionary, animation, 3) then 
        StopAnimTask(hitEntity, dictionary, animation, 1.0)
        isPedDoingAnimation = "no"
    else 
    RequestAnimDict(dictionary)
    while (not HasAnimDictLoaded(dictionary)) do Citizen.Wait(0) end    
    TaskPlayAnim(hitEntity, dictionary, animation, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    isPedDoingAnimation = "yes"
    end 
end)
if (distance > 10.0) and hitEntity  then
    return
end
local item2 = ECM:AddItem(1, Translation[Config.Locale]['playded'], function()
    local dictionary = "creatures@rottweiler@move"
    local animation = "dead_right" 
        isPedDoingAnimation = "no"

    if IsEntityPlayingAnim(hitEntity, dictionary, animation, 3) then 
        StopAnimTask(hitEntity, dictionary, animation, 1.0)
        isPedDoingAnimation = "no"
    else 
    RequestAnimDict(dictionary)
    while (not HasAnimDictLoaded(dictionary)) do Citizen.Wait(0) end
    TaskPlayAnim(hitEntity, dictionary, animation, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    isPedDoingAnimation = "yes"
    end 
end)
-- check if the player is too far away...
if (distance > 10.0) and hitEntity  then
    -- ...and stop execution of this function
    return
    end


local item3 = ECM:AddItem(1, Translation[Config.Locale]['PissL'], function()
        local dictionary = "creatures@rottweiler@move"
        local animation = "pee_left_idle" 
        isPedDoingAnimation = "no"

    if IsEntityPlayingAnim(hitEntity, dictionary, animation, 3) then 

        StopAnimTask(hitEntity, dictionary, animation, 1.0)
        isPedDoingAnimation = "no"
    else 
    RequestAnimDict(dictionary)
    while (not HasAnimDictLoaded(dictionary)) do Citizen.Wait(0) end
    TaskPlayAnim(hitEntity, dictionary, animation, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    isPedDoingAnimation = "yes"
    end 
end)

local item3 = ECM:AddItem(1, Translation[Config.Locale]['PissR'], function()
    local dictionary = "creatures@rottweiler@move"
    local animation = "pee_right_idle" 
    isPedDoingAnimation = "no"

if IsEntityPlayingAnim(hitEntity, dictionary, animation, 3) then 
    StopAnimTask(hitEntity, dictionary, animation, 1.0)
    isPedDoingAnimation = "no"
else 
RequestAnimDict(dictionary)
while (not HasAnimDictLoaded(dictionary)) do Citizen.Wait(0) end
TaskPlayAnim(hitEntity, dictionary, animation, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
isPedDoingAnimation = "yes"
end
end

end)
end
end
end) 









-- car -- mysql -- shop -- done -- multiple pets -- baseball