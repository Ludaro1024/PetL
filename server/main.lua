Config = {}
Config.Mysql = "oxmysql"
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


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

ESX.RegisterServerCallback('dogscript:getpet', function(source, cb)

  local xPlayer = ESX.GetPlayerFromId(source)
  --print(playerId)
  MySQL.Async.fetchAll('SELECT * from users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier,
	},function(result)
    if result then
      for _, v in pairs(result) do
         -- print(v.pet)
          cb(v.pet)
      end
    end
  end)
end)
