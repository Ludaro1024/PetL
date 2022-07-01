fx_version 'cerulean'
game 'gta5'

name "LPet-Script"
description "A Shop!"
author "Lugeil"
version "1.0"

shared_scripts {
	'config.lua'
}
client_scripts {
	'@NativeUILua_Reloaded/src/NativeUIReloaded.lua',
    '@NativeUI/NativeUI.lua',
	'client/*.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
}
