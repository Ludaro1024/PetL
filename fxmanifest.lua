
fx_version('cerulean')
games({ 'gta5' })

shared_script('config.lua');

server_scripts({
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
});

client_scripts({
    '@NativeUILua_Reloaded/src/NativeUIReloaded.lua',
    'client/nativeui.lua',
    'client/contextmenu.lua'
});