many_eye = exports.qtarget

for k,v in ipairs(Config.Zones['szafkapriv']) do
	many_eye:AddBoxZone("SzafkaPriv", v , 1.7, 1.3, {
		name="SzafkaPriv",
		heading=3.1395,
		--debugPoly=false,
		minZ=30.02,
		maxZ=33.72,
		}, {
			options = {
				{
					action = function()
						exports.ox_inventory:openInventory('stash','policelocker')
					end,
					icon = "fas fa-box",
					label = "Szafka personalna",
					job = "police",
				},
			},
			distance = 3.0
	})
end

exports.qtarget:AddTargetModel({'s_m_m_snowcop_01'}, {
	options = {
		{
			--event = 'spawnboat',
			action = function()
				boatmenu()
			end,
			icon =  'fas fa-key',
			label = 'Wyciągnij łódkę',
			num = 1,
			canInteract = function()
                local pedcoord = exports['many-peds']:PedCoords('s_m_m_snowcop_01')
				if ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'ambulance' then
					if exports['rev_script']:Vector3check(pedcoord) then
						return true
					end
					return false
				end
              end,
		},
	},
	distance = 3.0,
})


for k,v in ipairs(Config.Zones['JailLock']) do
	exports['qtarget']:AddBoxZone("JailLock", v , 1.5, 1.5, {
		name="JailLock",
		heading=0,
		--debugPoly=true,
		minZ=45.71,
		maxZ=46.81,
		}, {
			options = {
				{
					action = function()
						TriggerEvent('esx_policejob:OpenJailLocker')
					end,
					--event = 'esx_policejob:OpenJailLocker',
					icon = "fas fa-box",
					label = "Szafka Więzienna",
					job = 'police',
				},
			},
			distance = 2.5
	})
end
        --vector3(1845.45,  2587.17,  45.51),
		exports['qtarget']:AddBoxZone("JailLock", vector3(1845.45,  2587.17,  45.51) , 1.5, 1.5, {
			name="JailLock",
			heading=0,
			--debugPoly=true,
			minZ=45.71,
			maxZ=46.81,
			}, {
				options = {
					{
						action = function()
							local gracz = GetPlayerServerId(PlayerId())
							ESX.TriggerServerCallback('esx_policejob:getSSN', function(cb)
								exports.ox_inventory:openInventory('stash', { id = 'jail_storage', owner = cb})
								--print('cb',cb)
							end)
						end,
						icon = "fas fa-box",
						label = "Szafka Więzienna",
					},
				},
				distance = 2.5
		})

for k,v in ipairs(Config.Zones['DumpsterPolice']) do
	exports['qtarget']:AddBoxZone("DumpsterPolice", v , 0.7, 0.7, {
		name="DumpsterPolice",
		heading=0,
		--debugPoly=true,
		minZ=30.19,
		maxZ=30.99,
		}, {
			options = {
				{
					event = 'esx_policejob:kosz',
					icon = "fas fa-box",
					label = "Kosz",
				},
				{
					event = 'esx_policejob:dumpkosz',
					icon = "fas fa-box",
					label = "Opróżnij Kosz",
				},
			},
			distance = 2.5
	})
end

many_eye:AddTargetModel({'s_m_y_pilot_01'}, {
	options = {
		{
			event = "esx_policejob:TakeOutHeli",
			icon = "fas fa-helicopter",
			label = "Wyjmij Helikopter",
			job = 'police',
		},
		{
			event = "esx_policejob:RemoveHeli",
			icon = "fas fa-helicopter",
			label = "Schowaj Helikopter",
			job = 'police',
		},
	},
	distance = 2
})


for k, v in ipairs(Config.Zones['cloakrooms']) do
	many_eye:AddBoxZone("PoliceCloakRoom", v , 1.7, 1.3, {
		name="PoliceCloakRoom",
		heading=3.1395,
		--debugPoly=true,
		minZ=30.02,
		maxZ=30.72,
		}, {
			options = {
				{
					event = "fivem-appearance:clothingShop",
					icon = "fas fa-tshirt",
					label = "Przebierz się",
					job = "police"
				},
				{
					action = function()
						OpenCloakroomMenu()
					end,
					icon = "fas fa-tshirt",
					label = "Wybierz strój",
					job = "police"
				},
			},
			distance = 3.0
	})
end


many_eye:AddTargetModel({'s_m_y_hwaycop_01'}, {
	options = {
		{
			event = "police:vehcategories",
			icon = "fas fa-car",
			label = "Wyjmij pojazd",
			job = 'police',
			canInteract = function()
                local pedcoord = exports['many-peds']:PedCoords('s_m_y_hwaycop_01')
                if exports['rev_script']:Vector3check(pedcoord) then
                     return true
                end
                return false
              end,
		},
		{
			event = "esx_policejob:RemoveCar",
			icon = "fas fa-car",
			label = "Schowaj Pojazd",
			job = 'police',
			canInteract = function()
                local pedcoord = exports['many-peds']:PedCoords('s_m_y_hwaycop_01')
                if exports['rev_script']:Vector3check(pedcoord) then
                     return true
                end
                return false
              end,
		},
	},
	distance = 2
})



for k, v in ipairs(Config.LicenceBoxes) do
	exports.qtarget:AddCircleZone("Szafka" .. v.name, v.coords, 1.0, {
		name ="Szafka " .. v.name,
		useZ = true,
		debugPoly = false
		}, {
			options = {
				{
					action = function()
						exports.ox_inventory:openInventory('stash',v.name..'_locker')
					end,
					icon = "fas-fa box",
					label = 'Szafka '..v.name,
					job = 'police',
					canInteract = function()
							if PlayerLicence[v.name] then
								return true
							end
						return false
					end,
				},
			},
			distance = 2
		})
end

--[[exports.qtarget:AddTargetModel({'prop_barrier_work05'}, {
	options = {
		{
			--event = 'spawnboat',
			action = function(entity)
				local playerPed = GetPlayerPed(-1)
				local playerCoords = GetEntityCoords(playerPed)
				local maxDistance = 25.0 -- Maksymalna odległość, w której będą usuwane obiekty
				local propModelHash = GetHashKey('prop_barrier_work05') -- Model obiektu, który chcemy usunąć
			
				-- Pętla iterująca przez wszystkie entity w grze
				for _, object in ipairs(GetGamePool('CObject')) do
					-- Sprawdzenie, czy entity to obiekt i czy jest w pobliżu gracza
					if DoesEntityExist(object) and IsEntityAnObject(object) then
						local objectCoords = GetEntityCoords(object)
						local distance = #(playerCoords - objectCoords) -- Obliczenie odległości między graczem a obiektem
			
						-- Jeżeli obiekt jest wystarczająco blisko gracza i jest żądanym modelem, usuń go
						if distance <= maxDistance and GetEntityModel(object) == propModelHash then
							print(GetEntityModel(object), propModelHash)
							DeleteEntity(object)
						end
					end
				end
			end,
			icon =  'fas fa-key',
			label = 'Wyciągnij łódkę',
			num = 1,

		},
	},
	distance = 3.0,
})]]

--[[RegisterCommand('vah', function()
	TriggerServerEvent('esx_interact:putInVehicle', 1)
end)
]]
--[[

					if GetEntityModel(CurrentActionData.entity) == GetHashKey('p_ld_stinger_s') then
						TriggerServerEvent('xqs_kolczatki:dodaj', 'kolczatka')
					elseif GetEntityModel(CurrentActionData.entity) == GetHashKey('prop_roadcone02a') then
						TriggerServerEvent('xqs_kolczatki:dodaj', 'pacholek')
					elseif GetEntityModel(CurrentActionData.entity) == GetHashKey('prop_barrier_work05') then
]]