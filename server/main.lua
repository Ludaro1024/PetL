Config = {}
Config.Mysql = "oxmysql"
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--[[
if Config.Debug then
  RegisterCommand("test", function(source, args, rawCommand)
    local playerId, identifier = GetPlayerIdentifier(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    print(playerId)
    exports.oxmysql:query('SELECT * FROM users WHERE identifier = @identifier', { ['@identifier'] = xPlayer.identifier}, function(result)
      if result then
        for _, v in pairs(result) do
            print(v.pet)
        end
      end
    end)
end, false)
end
]]

ESX.RegisterServerCallback('dogscript:getpet', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
  MySQL.Async.fetchAll('SELECT * from pet WHERE identifier = @identifier', {
    ['@identifier'] = xPlayer.identifier,
  },function(result)
    if result then
      print("haha")
          cb(true)
    else
      print("haha2")
      cb(false)
    end
  end)
end)




  
RegisterServerEvent('PetL:InsertPet')
AddEventHandler('PetL:InsertPet', function (model, price)
  local xPlayer = ESX.GetPlayerFromId(source)
  local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('INSERT INTO pet (identifier, petmodel, nickname) VALUES (@owner, @model, @nickname)',
	{
		['@owner']   = xPlayer.identifier,
		['@model']   = model,
    ['@nickname']   = nickname,
	}, function ()
  end)
 if Config.PayWithBank then
  xPlayer.removeAccountMoney('bank', price)
 else
  xPlayer.removeAccountMoney('money', price)
 end
end)


ESX.RegisterServerCallback('PetL:getpetmodel', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
  MySQL.Async.fetchAll('SELECT * from pet WHERE identifier = @identifier', {
    ['@identifier'] = xPlayer.identifier,
  },function(result)
    if result then
          cb(v)
    end
  end)
end)

ESX.RegisterServerCallback('PetL:getpet', function(source, cb, cbb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
  local job = xPlayer.job.name
  MySQL.Async.fetchAll('SELECT * from pet WHERE identifier = @identifier', {
    ['@identifier'] = xPlayer.identifier,
  },function(result)
    if result then
      for _, v in pairs(result) do
         cb(v.model)
      end
      cbb(job)
    end
  end)
end)
