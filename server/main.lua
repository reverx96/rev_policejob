ESX = exports["es_extended"]:getSharedObject()

GlobalState.StopZones = {}
GlobalState.Props = {}

RegisterServerEvent('police:StopZones')
AddEventHandler('police:StopZones',function(a1, a2, a3)
	local tmp = GlobalState.StopZones
	tmp[a1] = {
		radius = a2,
		coords = a3,
	}

	GlobalState.StopZones = tmp
end)

RegisterServerEvent('police:Props')
AddEventHandler('police:Props',function(a1, a2, a3)
	print(source)
	local tmp = GlobalState.Props
	local tmpid = #GlobalState.Props + 1
	local xPlayer = ESX.GetPlayerFromId(source)
	local name = xPlayer.getName()
	local id = xPlayer.getIdentifier()

	tmp[tmpid] = {
		type = name,
		hash = a3,
	}

	GlobalState.Props = tmp
end)


RegisterServerEvent('police:StopZonesRemove')
AddEventHandler('police:StopZonesRemove',function(a1)
	local tmp = GlobalState.StopZones
	tmp[a1] = nil
	GlobalState.StopZones = tmp
end)

RegisterServerEvent('police:PropsRemove')
AddEventHandler('police:PropsRemove',function(a1)
	local tmp = GlobalState.Props

	for k, v in pairs(tmp) do
		if v.type == a1 then
			tmp[k] = nil
		end
	end

	GlobalState.Props = tmp
end)

local SearchTable = {}

local lastdzwonek = 0
ESX.RegisterServerCallback('esx_policejob:server:checkTime', function(source, cb)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    
    if (os.time() - lastdzwonek) < 10 and lastdzwonek ~= 0 then
        local lastdzwonek = 10 - (os.time() - lastdzwonek)
		TriggerClientEvent('esx:showNotification', source, 'Odczekaj chwile!')
        cb(false)
    else
        lastdzwonek = os.time()
        cb(true)
    end
end)

--[[

ZAKUWANIE

]]

RegisterServerEvent('esx_policejob_areszt:startAreszt')
AddEventHandler('esx_policejob_areszt:startAreszt', function(target)
	local targetPlayer = ESX.GetPlayerFromId(target)

	TriggerClientEvent('esx_policejob_areszt:aresztowany', targetPlayer.source, source)
	TriggerClientEvent('esx_policejob_areszt:aresztuj', source)
end)

RegisterNetEvent('esx_policejob:handcuff')
AddEventHandler('esx_policejob:handcuff', function(target)
	local targetPlayer = ESX.GetPlayerFromId(target)
	--TriggerClientEvent('esx_policejob_areszt:aresztowany', targetPlayer.source, source)
	TriggerClientEvent('esx_policejob_areszt:aresztuj', source)
	TriggerClientEvent('esx_policejob:handcuff', target)

end)

RegisterNetEvent('esx_policejob:ropecuff')
AddEventHandler('esx_policejob:ropecuff', function(target)
	local targetPlayer = ESX.GetPlayerFromId(target)
	exports.ox_inventory:RemoveItem(source, 'rope', 1)
	TriggerClientEvent('esx_policejob_areszt:aresztuj', source)
		TriggerClientEvent('esx_policejob:ropecuff', target)
end)

RegisterNetEvent('esx_policejob:uncuff2')
AddEventHandler('esx_policejob:uncuff2', function(target)
	local targetPlayer = ESX.GetPlayerFromId(target)
	TriggerClientEvent('esx_policejob_areszt:aresztuj2', source)
		TriggerClientEvent('esx_policejob:handcuff', target)
end)

RegisterNetEvent('esx_policejob:uncuff1')
AddEventHandler('esx_policejob:uncuff1', function(target)
	local targetPlayer = ESX.GetPlayerFromId(target)
	TriggerClientEvent('esx_policejob_areszt:aresztuj2', source)
		TriggerClientEvent('esx_policejob:ropecuff', target)
end)

RegisterNetEvent('esx_policejob:rozkujadmin')
AddEventHandler('esx_policejob:rozkujadmin', function(target)
TriggerClientEvent('esx_policejob:rozkujadmin', target, target)
end)

RegisterNetEvent('esx_policejob:rozkujadmin1')
AddEventHandler('esx_policejob:rozkujadmin1', function(target, kajdanki, lina)
if kajdanki then
	TriggerClientEvent('esx_policejob:handcuff', target)
end

if lina then
	TriggerClientEvent('esx_policejob:ropecuff', target)
end
end)
	

--[[

PRZENOSZENIE

]]

RegisterNetEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function(target)
	TriggerClientEvent('esx_policejob:drag', target, source)
end)

--[[

WSADZANIE DO POJAZDU

]]

RegisterNetEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function(target)
	TriggerClientEvent('esx_policejob:putInVehicle', target)
end)

--[[

WYJMIJ Z POJAZDU

]]

RegisterNetEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function(target)
		TriggerClientEvent('esx_policejob:OutVehicle', target)
end)

--[[

INFO O OBYWATELU

]]


ESX.RegisterServerCallback('esx_policejob:getOtherPlayerData', function(source, cb, target, notify)
	local xPlayer = ESX.GetPlayerFromId(target)

	if notify then
		xPlayer.showNotification(_U('being_searched'))
	end

	if xPlayer then
		local data = {
			name = xPlayer.getName(),
			job = xPlayer.job.label,
			grade = xPlayer.job.grade_label,
			inventory = xPlayer.getInventory(),
			accounts = xPlayer.getAccounts(),
			weapons = xPlayer.getLoadout()
		}

		if Config.EnableESXIdentity then
			data.dob = xPlayer.get('dateofbirth')
			data.nationality = xPlayer.get('nationality')

			if xPlayer.get('sex') == 'm' then data.sex = 'male' else data.sex = 'female' end
		end

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status then
				data.drunk = ESX.Math.Round(status.percent)
			end
		end)

		if Config.EnableLicenses then
			TriggerEvent('esx_license:getLicenses', target, function(licenses)
				data.licenses = licenses
				cb(data)
			end)
		else
			cb(data)
		end
	end
end)

--[[

PROCH NA RĘKACH

]]

RegisterNetEvent("esx_policejob:CheckGunpowder")
AddEventHandler("esx_policejob:CheckGunpowder", function(tested)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("esx_policejob:TestHandler", tested, source)
	TriggerClientEvent('esx:showNotification', tested, 'Masz sprawdzany proch na rękach')
end)

RegisterNetEvent("esx_policejob:TestCallback")
AddEventHandler("esx_policejob:TestCallback", function(tester, result)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
    if result then
		TriggerClientEvent('esx:showNotification', tester, 'Test wyszedł pozytywnie')
    else
		TriggerClientEvent('esx:showNotification', tester, 'Test wyszedł negatywnie')
    end
end)

RegisterNetEvent('esx_policejob:addLicense')
AddEventHandler('esx_policejob:addLicense', function(target, type)
	local _source = source
	TriggerEvent('esx_license:addLicense', target, type, function()
		TriggerEvent('esx_license:getLicenses', target, function(licenses)
			xPlayer.showNotification('Dodałeś licencje '..type..' dla ID : '..target)
			target.showNotification('Otrzymałeś licencje '..type)
		end)
	end)
end)

RegisterNetEvent('esx_policejob:removeLicense')
AddEventHandler('esx_policejob:removeLicense', function(target, type)
	local _source = source
	if ESX.PlayerData.job.name == 'police' then
		if ESX.PlayerData.job.grade_name == 'boss' then
	        TriggerEvent('esx_license:removeLicense', target, type, function()
		        TriggerEvent('esx_license:getLicenses', target, function(licenses)
					xPlayer.showNotification('Usunąłeś licencje '..type..' dla ID : '..target)
					target.showNotification('Zabrano ci licencje '..type)
		        end)
	        end)
        end
    end
end)

--[[

# SZAFKA WIĘZIENNA

]]



RegisterServerEvent('esx_policejob:dumpkoszserver')
AddEventHandler('esx_policejob:dumpkoszserver', function()
	--exports.ox_inventory:ClearInventory('stash', 'dumpster_lspd')
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	--print(source,_source)
	xPlayer.showNotification('Usunięto zawartość kosza!')
	exports.ox_inventory:ClearInventory('dumpster_lspd', false)

end)

AddEventHandler('onServerResourceStart', function(source, resourceName)
    if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName() then
		local xPlayer = ESX.GetPlayerFromId(source)
		exports.ox_inventory:RegisterStash(dumpster.id, dumpster.label, dumpster.slots, dumpster.weight, dumpster.owner)
		exports.ox_inventory:RegisterStash('usms_locker', 'USMS', 250, 1000000)
		exports.ox_inventory:RegisterStash('swat_locker', 'SWAT', 250, 1000000)
		exports.ox_inventory:RegisterStash('sheriff_locker', 'SHERIFF', 250, 1000000)
    end
end)

RegisterServerEvent('esx_policejob:ClearDumpster')
AddEventHandler('esx_policejob:ClearDumpster', function()
exports.ox_inventory:ClearInventory('dumpster_lspd', false)
end)

RegisterServerEvent('esx_policejob:GetIdentifier')
AddEventHandler('esx_policejob:GetIdentifier', function(gracz)
	local xPlayer = ESX.GetPlayerFromId(gracz)
	xPlayer.getID()
	print(	xPlayer.getID())
	--print(xPlayer.getIdentifier())
end)

ESX.RegisterServerCallback('esx_policejob:GetIdentifier1', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(item)
	if xPlayer ~= nil then
		local qtty = xPlayer.getID()
		print('Chuj', item, qtty)
		cb(qtty)
	end

end)


ESX.RegisterServerCallback('esx_policejob:getSSN', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local qtty = xPlayer.getID()
	cb(qtty)
end)

ESX.RegisterServerCallback('esx_policejob:getItemAmount', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local qtty = xPlayer.getInventoryItem(item).count
	cb(qtty)
end)


ESX.RegisterServerCallback('esx_policejob:getStockItems', function(source, cb)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
	  cb(inventory.items)
	end)
  
  end)
  
  ESX.RegisterServerCallback('esx_policejob:getPlayerInventory', function(source, cb)
  
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory
  
	cb({
	  items = items
	})
  
  end)

  ESX.RegisterServerCallback('esx_policejob:checkSearch', function(source, cb, target)
    local xPlayer = ESX.GetPlayerFromId(source)
    if SearchTable[target] ~= nil then
        if SearchTable[target] == xPlayer.identifier then
            cb(false)
        else
            cb(true)
        end
    else
        cb(false)
    end
end)
 
ESX.RegisterServerCallback('esx_policejob:checkSearch2', function(source, cb, target)
    local xPlayer = ESX.GetPlayerFromId(source)
    if SearchTable[target] ~= nil then
        if SearchTable[target] == xPlayer.identifier then
            cb(true)
        else
            cb(false)
        end
    else
        cb(true)
    end
end)
 
RegisterServerEvent('esx_policejob:isSearching')
AddEventHandler('esx_policejob:isSearching', function(target, boolean)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if boolean == nil then
        SearchTable[target] = xPlayer.identifier
    else
        SearchTable[target] = nil
    end
end)

RegisterServerEvent('malina:server:nadajOdznake')
AddEventHandler('malina:server:nadajOdznake', function(ssn, cs, number)
	local _source = source
	MySQL.update('UPDATE users SET badge = @badge WHERE id = @ssn', {
		['@badge'] = '['.. cs .. '-'.. number ..']',
		['@ssn'] = ssn
	}, function(rows)
		TriggerClientEvent('esx:showNotification', _source, 'Dodano odznakę <br>SSN: '..ssn..'<br>Odznaka: ['..cs..'-'..number..']')
		exports['an_badges']:updateBadge(ssn, '['.. cs .. '-'.. number ..']')
	end)
end)


RegisterServerEvent('givekeysServer')
AddEventHandler('givekeysServer', function(target, plate, passwd)
local src = source
xPlayer = ESX.GetPlayerFromId(src)
xTarget = ESX.GetPlayerFromId(target)
local password = 'REV24DEV'

if xPlayer.getInventoryItem('carKey', plate).count > 0 then
    xPlayer.showNotification('Masz klucze do tego pojazdu')
else
    xPlayer.showNotification('Nie masz kluczy')
end



if xTarget and password == passwd then
	if not Player(target).state.hasVehicle then
		if xPlayer.getInventoryItem('carKey', plate).count > 0 then
			plateup = ESX.Math.Trim(plate)
			local cos1 = string.gsub(plateup, "%s+", "")
			xTarget.addInventoryItem('carKey',1,cos1)
			xPlayer.removeInventoryItem('carKey',1,cos1)
			xPlayer.showNotification('Przekazałeś klucze')
			xTarget.showNotification('Otrzymałeś klucze')
			Player(src).state.hasVehicle = false
			Player(target).state.hasVehicle = true
		else
			xPlayer.showNotification('Nie masz kluczy do pojazdu')
		end

	else
		xPlayer.showNotification('Gracz ma już auto na siebie')
	end
else
	xPlayer.showNotification('Nie ma gracza o podanym ID')
end

end)

--[[

RegisterServerEvent('many-addkeys')
AddEventHandler('many-addkeys', function(plate)
	plateup = ESX.Math.Trim(plate)
	local cos1 = string.gsub(plateup, "%s+", "")
	exports.ox_inventory:AddItem(source, 'carKey', 1, cos1)
end)

RegisterServerEvent('many-removekeys')
AddEventHandler('many-removekeys', function(plate)
	plateup = ESX.Math.Trim(plate)
	local cos1 = string.gsub(plateup, "%s+", "")
	exports.ox_inventory:RemoveItem(source, 'carKey', 1, cos1)
end)

]]



-------------------------------------------------



    ESX.RegisterUsableItem('kolczatka', function(source)
        xPlayer = ESX.GetPlayerFromId(source)
        item = xPlayer.getInventoryItem('kolczatka')
        count = item.count
		if xPlayer.job.name == 'police' then
            if item.count > 0 then
				--TriggerClientEvent('rev:props:init', source, 'p_ld_stinger_s', source)
                --TriggerClientEvent('xqsplace', source, 'p_ld_stinger_s')
				TriggerClientEvent('rev_propSys:client:createPropBefore',source,'p_ld_stinger_s', true, 'police')
                xPlayer.removeInventoryItem('kolczatka', 1)
            else
                TriggerClientEvent('esx:showNotification', source, "Nie masz przy sobie kolczatki")
            end
		end
    end)

        ESX.RegisterUsableItem('pacholek', function(source)
        xPlayer = ESX.GetPlayerFromId(source)
        item = xPlayer.getInventoryItem('pacholek')
        count = item.count
		if xPlayer.job.name == 'police' then
            if item.count > 0 then
				TriggerClientEvent('rev:props:init', source, 'prop_roadcone02a', source)
                --TriggerClientEvent('xqsplace', source, 'prop_roadcone02a')
                xPlayer.removeInventoryItem('pacholek', 1)
            else
                TriggerClientEvent('esx:showNotification', source, "Nie masz przy sobie pachołków")
            end
		end
    end)


    ESX.RegisterUsableItem('barierka', function(source)
        xPlayer = ESX.GetPlayerFromId(source)
        item = xPlayer.getInventoryItem('barierka')
        count = item.count
		if xPlayer.job.name == 'police' then
            if item.count > 0 then
				TriggerClientEvent('rev:props:init', source, 'prop_barrier_work05', source)
                --TriggerClientEvent('xqsplace', source, 'prop_barrier_work05')
                xPlayer.removeInventoryItem('barierka', 1)
            else
                TriggerClientEvent('esx:showNotification', source, "Nie masz przy sobie barierki")
            end
		end
    end)


RegisterServerEvent('xqs_kolczatki:dodaj')
AddEventHandler('xqs_kolczatki:dodaj', function(item)
	local xPlayer = ESX.GetPlayerFromId(source)
    local _source  = source
    if item == 'kolczatka' or item == 'pacholek' or item == 'barierka' then
        xPlayer.addInventoryItem(item, 1)
    else
        DropPlayer(_source, 'tak to nie byczq')
    end
end)


RegisterServerEvent('police:trad')
AddEventHandler('police:trad', function(plate)
	exports.ox_inventory:AddItem(plate, 'barierka', 20)
	exports.ox_inventory:AddItem(plate, 'pacholek', 20)
	exports.ox_inventory:AddItem(plate, 'kolczatka', 10)
end)


RegisterNetEvent('police:911plog')
AddEventHandler('police:911plog', function(messagetag, coords)
	local src = source
    local playerName = GetPlayerName(src)
    exports['many-logs']:LogiMain(src, 'Użytkownik **'.. playerName .. '** wysłał zgłoszenie /911p z treścią **'.. messagetag ..'**\n\n・Koordy X: `'.. coords.x ..'`\n・Kordy Y: `'.. coords.y ..'`\n・Kordy Z: `'.. coords.z ..'`', '911p')
end)

RegisterServerEvent('pwc:addAccountMoney')
AddEventHandler('pwc:addAccountMoney', function(token)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local playerName = GetPlayerName(src)

	exports['rev_script']:TriggerAC2(src, token, 'pwc:addacountmoney')

 xPlayer.addAccountMoney('bank',7500,'PremiaPWC')

end)

ESX.RegisterServerCallback('pwc:PoliceCount', function(source, cb)
    local src = source
    local players = ESX.GetPlayers()
    local policeCount = 0

    for i = 1, #players do
        local player = ESX.GetPlayerFromId(players[i])
        if player['job']['name'] == 'police' then
            policeCount = policeCount + 1
        end
    end
	print(policeCount)
    if policeCount >= 0 then
        cb(true)
    else
        cb(false)
        TriggerClientEvent('esx:showNotification', source, 'Brak wystarczającej ilości funkcjonariuszy na służbie!')
    end
end)

ESX.RegisterServerCallback('pwc:IsPWC', function(source, cb)
    local src = source
    local players = ESX.GetPlayers()
    local policeCount = 0
	local final = {}
    for i = 1, #players do
		local playerState = Player(players[i]).state.isPWC
		print(playerState)
		if playerState then
			final.state = true
			final.name = ESX.GetPlayerFromId(players[i]).getName()
			return cb(final)
		else
			final.state = false
		end
    end
        cb(final)
end)