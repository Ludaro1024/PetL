fx_version 'cerulean'
game 'gta5'

name "LPet-Script"
description "A Shop!"
author "Siegenot, Lugeil"
version "1.0"

client_scripts {
	'client/*.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
}
