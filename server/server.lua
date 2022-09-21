Config = {}
Config.Mysql = "oxmysql"
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



ESX.RegisterServerCallback('dogscript:getpet', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
  MySQL.Async.fetchAll('SELECT * from pet WHERE identifier = @identifier', {
    ['@identifier'] = xPlayer.identifier,
  },function(result)
    if result then
      local test = json.encode(result)
      if test == "[]" then
        cb(false)
      else
          cb(true)
    end
  end
  end)
end)


RegisterServerEvent('PetL:DeletePet')
AddEventHandler('PetL:DeletePet', function ()
  local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('DELETE FROM pet WHERE identifier = @identifier',
	{
		['@identifier']   = xPlayer.identifier,
	}, function ()
  end) 
end)
RegisterServerEvent('PetL:Money')
AddEventHandler('PetL:Money', function (price)
  local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
  xPlayer.addAccountMoney("money", price)
end)

RegisterServerEvent('PetL:InsertPet')
AddEventHandler('PetL:InsertPet', function (model, price, nickname)
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


ESX.RegisterServerCallback('PetL', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
  MySQL.Async.fetchAll('SELECT * from pet WHERE identifier = @identifier', {
    ['@identifier'] = xPlayer.identifier,
  },function(result)
    if result then
      local test = json.encode(result)
      if test == "[]" then
        cb(nil)
      end
    for _, v in pairs(result) do 
      if v.petmodel == nil then
        cb(nil)
      else
        cb(v.petmodel)
      end
    end 
  end
  end)

end)

ESX.RegisterServerCallback('PetL2', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
  MySQL.Async.fetchAll('SELECT * from pet WHERE identifier = @identifier', {
    ['@identifier'] = xPlayer.identifier,
  },function(result)
    if result then
      local test = json.encode(result)
      if test == "[]" then
        cb(nil)
      end
    for _, v in pairs(result) do 
      if v.nickname == nil then
        cb(nil)
      else
        cb(v.nickname)
      end
    end 
  end
  end)

end)

ESX.RegisterServerCallback('PetL:getjob', function(source, cb)
  local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
  local job = xPlayer.job.name
  cb(job)
end)


