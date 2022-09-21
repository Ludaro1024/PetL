local pedid = nil
local dogout = false
local hasdog = false
local smalldog = false

local bigDogAnimations = {
	{ dictionary = "creatures@rottweiler@amb@sleep_in_kennel@", animation = "sleep_in_kennel", name = "Lay Down", },
	{ dictionary = "creatures@rottweiler@amb@world_dog_barking@idle_a", animation = "idle_a", name = "Bark", },
	{ dictionary = "creatures@rottweiler@amb@world_dog_sitting@base", animation = "base", name = "Sit", },
	{ dictionary = "creatures@rottweiler@amb@world_dog_sitting@idle_a", animation = "idle_a", name = "Itch", },
	{ dictionary = "creatures@rottweiler@indication@", animation = "indicate_high", name = "Draw Attention", },
	{ dictionary = "creatures@rottweiler@melee@", animation = "dog_takedown_from_back", name = "Attack", },
	{ dictionary = "creatures@rottweiler@melee@streamed_taunts@", animation = "taunt_02", name = "Taunt", },
	{ dictionary = "creatures@rottweiler@tricks@", animation = "beg_loop", name = "Beg", },
	{ dictionary = "creatures@rottweiler@tricks@", animation = "paw_right_loop", name = "Shake Paw", },
	{ dictionary = "creatures@rottweiler@tricks@", animation = "petting_chop", name = "Receiving Pats", },
}

local smallDogAnimations = {
	{ dictionary = "creatures@pug@amb@world_dog_sitting@idle_a", animation = "idle_a", name = "Itch" },
	{ dictionary = "creatures@pug@amb@world_dog_sitting@idle_a", animation = "idle_b", name = "Sit" },
	{ dictionary = "creatures@pug@amb@world_dog_sitting@idle_a", animation = "idle_c", name = "Lay Down" },
	{ dictionary = "creatures@pug@amb@world_dog_barking@idle_a", animation = "idle_c", name = "Shake" },
	{ dictionary = "creatures@pug@amb@world_dog_barking@idle_a", animation = "idle_a", name = "Bark" },
	{ dictionary = "creatures@pug@move", animation = "idle_turn_0", name = "Dance" },
	{ dictionary = "creatures@pug@move", animation = "dead_right", name = "Sleep/Death 1" },
	{ dictionary = "creatures@pug@move", animation = "dead_left", name = "Sleep/Death 2" },

}




Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
            if IsPedDeadOrDying(pedid, 1) and dogout and pedid ~= nil then
                if Config.Debug then
                print("ded")
                print(dogout)
                end
                 TriggerServerEvent("PetL:DeletePet", source)
                 pedid = nil
                 break
             end
        end
    end)



function playanimation(who, dictionary, animation, ever)
    if Config.Debug then
        print(who)
        print(dictionary)
        print(animation)
    end
    RequestAnimDict(dictionary)
    while (not HasAnimDictLoaded(dictionary)) do Citizen.Wait(0) end
    TaskPlayAnim(who, dictionary, animation, 1.0, 0.0, -1, 1, 0, 0, 0, 0)
    if ever == nil then
    Wait(1000)
    StopAnimTask(who, dictionary, animation, 1.0)
    end
end

function createdog(pedmodel)
    if Config.Debug then
    print(pedmodel)
    print("spawn")
    end
    RequestModel(pedmodel)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local found, spawnPos, spawnHeading = GetClosestVehicleNodeWithHeading(playerCoords.x + math.random(-Config.SpawnRadius, Config.SpawnRadius), playerCoords.y + math.random(-Config.SpawnRadius, Config.SpawnRadius), playerCoords.z, 0, 3, 0)
    local ped = CreatePed(4, pedmodel, spawnPos, spawnHeading, true, false)
    TaskFollowToOffsetOfEntity(ped, playerPed, 0, 0, 0, 1073741824.0, -1, 5, true)

    return ped   
end

function gotocoords(pedid, coords)
    SetPedNeverLeavesGroup(pedid, false)
    ClearPedTasksImmediately(pedid)
    SetBlockingOfNonTemporaryEvents(pedid, true)
    SetPedFleeAttributes(pedid, 0, 0)
    TaskGoToCoordAnyMeans(pedid, coords, 5.0, 0, 0, 786603, 0xbf800000)
end
RegisterNetEvent('DogL:deleteped', function()
    dogout = false
    if pedid ~= nil then
    DeletePed(pedid)
    end
  end)

AddEventHandler('onResourceStop', function()
    if pedid ~= nil then
    DeletePed(pedid)
    end
    end)



local ECM = exports["ContextMenu"]

ECM:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
    ESX.TriggerServerCallback("PetL", function(pedmodel)
        if pedmodel ~= nil then
            hasdog = true
        else 
            hasdog = false
        end
        pedmodel = pedmodeltospawn
    end)
    if not dogout and hasdog then
        ESX.TriggerServerCallback("PetL2", function(nickname)
    local calldog = ECM:AddItem(0, Translation[Config.Locale]['Calldog'].. " (" .. nickname .. ")", function()
    playanimation(PlayerPedId(), "rcmnigel1c", "hailing_whistle_waive_a")
    ESX.TriggerServerCallback("PetL", function(pedmodel)
    local ped = createdog(pedmodel)
   pedid = ped
   dogout = true
    end)
    end)
end)
end
if Config.Debug then
print(hitEntity)
end

if not IsPedAPlayer(hitEntity) and pedid ~= nil and not IsEntityAPed(hitEntity) and not IsEntityAVehicle(hitEntity) and dogout then
    local gohere = ECM:AddItem(0, Translation[Config.Locale]['GoHere'], function()
        gotocoords(pedid, worldPosition)
    end)
end
    if hitEntity == pedid or hitentity == GetPlayerPed(GetPlayerFromServerId(source)) and dogout then
    local goawaydog = ECM:AddItem(0, Translation[Config.Locale]['GoHome'], function()
        local playerCoords = GetEntityCoords(PlayerPedId())
        local found, spawnPos, spawnHeading = GetClosestVehicleNodeWithHeading(playerCoords.x + math.random(-Config.SpawnRadius + 90, Config.SpawnRadius + 90), playerCoords.y + math.random(-Config.SpawnRadius, Config.SpawnRadius), playerCoords.z, 0, 3, 0)
        gotocoords(pedid, spawnPos)
        dogout = false
        Citizen.Wait(10000)
        DeletePed(pedid)
    end)

local menuId, itemId = ECM:AddSubmenu(0, Translation[Config.Locale]['Tricks'])
    --[[if Config.Debug then
        print(issmall())
    end
    if issmall() then
for k, v in pairs(smallDogAnimations) do
    local trick = ECM:AddItem(menuId, v.name, function()
    playanimation(pedid, v.dictionary, v.animation, true)
end
end
if not issmall() then
    for k, v in pairs(bigDogAnimations) do
        local trick = ECM:AddItem(menuId, v.name, function()
        playanimation(pedid, v.dictionary, v.animation, true)
    end
end
end
end)
end)]]

ESX.TriggerServerCallback("PetL", function(pedmodel)
    for k, v in pairs(Config.smallDogModels) do
        if string.match(v, pedmodel) then
           smalldog = true
    end
end
end)
if smalldog then
    for k, v in pairs(smallDogAnimations) do
        local trick = ECM:AddItem(menuId, v.name, function()
        playanimation(pedid, v.dictionary, v.animation, true)
    end)
end
end

if smalldog == false then
    for k, v in pairs(bigDogAnimations) do
        local trick = ECM:AddItem(menuId, v.name, function()
        playanimation(pedid, v.dictionary, v.animation, true)
        end)
    end
end
end


if IsEntityAPed(hitEntity) and pedid ~= nil and hitEntity ~= pedid then
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



if IsEntityAVehicle(hitEntity) then
    ESX.TriggerServerCallback("PetL", function(pedmodel)
        for k, v in pairs(Config.smallDogModels) do
            if string.match(v, pedmodel) then
               smalldog = true
        end
    end
    end)
    local auto = ECM:AddItem(0, Translation[Config.Locale]['GetIncar'], function()
        SetPedNeverLeavesGroup(idd, false)
        ClearPedTasksImmediately(idd)
        TaskWarpPedIntoVehicle(pedid, hitEntity, 0)
    Citizen.Wait(100)
    
    if smalldog then
        playanimation(pedid, "creatures@pug@amb@world_dog_sitting@idle_a", "idle_b", true)
    else
        playanimation(pedid, "creatures@rottweiler@amb@world_dog_sitting@base", "base", true)
    end
    end)  
end

end)




