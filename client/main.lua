 Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

handcuffTimer = {}
dragStatus = {}
many_eye = exports.qtarget
ox_inv = exports.ox_inventory
ESX = exports['es_extended']:getSharedObject()
Many = exports['many-base']
LocalPlayer.state:set('handcuffed', false, true)
LocalPlayer.state:set('ropecuffed', false, true)

CurrentAction           = nil
CurrentActionMsg        = ''
CurrentActionData       = {}

Citizen.CreateThread(function()
	Citizen.Wait(1000)
	reloadlicences()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
	LocalPlayer.state:set('isPWC',false,true)


	Citizen.Wait(5000)
	reloadlicences()
	boatblip()

	passwd = 'REV24DEV'

end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	ESX.PlayerData = {}
	LocalPlayer.state:set('isPWC',false,true)
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
	boatblip()
	reloadlicences()
	LocalPlayer.state:set('isPWC',false,true)
end)

RegisterNetEvent('esx_policejob:rozkujadmin')
AddEventHandler('esx_policejob:rozkujadmin', function(playerID)
	TriggerServerEvent('esx_policejob:rozkujadmin1', playerID, LocalPlayer.state.handcuffed , LocalPlayer.state.ropecuffed)
end)

RegisterNetEvent('esx_policejob:handcuff')
AddEventHandler('esx_policejob:handcuff', function()
	LocalPlayer.state:set('handcuffed', (not LocalPlayer.state.handcuffed) , true)
	local playerPed = PlayerPedId()

	if LocalPlayer.state.handcuffed then
		RequestAnimDict('mp_arresting')
		while not HasAnimDictLoaded('mp_arresting') do
			Wait(200)
		end

		exports['many-base']:playAnim(playerPed, 'mp_arresting', 'idle', -1, true)

		SetEnableHandcuffs(playerPed, true)
		DisablePlayerFiring(playerPed, true)
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
		SetPedCanPlayGestureAnims(playerPed, false)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(false)


	else
		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(false)
	end
end)

 IsRopeCuffed = false
RegisterNetEvent('esx_policejob:ropecuff')
AddEventHandler('esx_policejob:ropecuff', function()
	LocalPlayer.state:set('ropecuffed', (not LocalPlayer.state.ropecuffed) , true)
	IsRopeCuffed = not IsRopeCuffed
	local playerPed = PlayerPedId()

	
	if LocalPlayer.state.ropecuffed then
		RequestAnimDict('mp_arresting')
		while not HasAnimDictLoaded('mp_arresting') do
			Wait(200)
		end
		exports['many-base']:playAnim(playerPed, 'mp_arresting', 'sit', -1, true)

		SetEnableHandcuffs(playerPed, true)
		DisablePlayerFiring(playerPed, true)
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
		SetPedCanPlayGestureAnims(playerPed, false)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(false)


	else
		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(false)
	end
end)


 Aresztuje	= false
 Aresztowany = false

RegisterNetEvent('esx_policejob_areszt:aresztowany')
AddEventHandler('esx_policejob_areszt:aresztowany', function(target)
	Aresztowany = true

	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

	RequestAnimDict('mp_arrest_paired')

	while not HasAnimDictLoaded('mp_arrest_paired') do
		Citizen.Wait(10)
	end

	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 11816, -0.1, 0.45, 0.0, 0.0, 0.0, 20.0, false, false, false, false, 20, false)
	TaskPlayAnim(playerPed, 'mp_arrest_paired', 'crook_p2_back_left', 8.0, -8.0, 5500, 33, 0, false, false, false)

	Citizen.Wait(950)
	DetachEntity(GetPlayerPed(-1), true, false)

	Aresztowany = false
end)

RegisterNetEvent('esx_policejob_areszt:aresztuj')
AddEventHandler('esx_policejob_areszt:aresztuj', function()
	Aresztuje = true

	local playerPed = GetPlayerPed(-1)

	RequestAnimDict('mp_arrest_paired')

	while not HasAnimDictLoaded('mp_arrest_paired') do
		Citizen.Wait(10)
	end

	TaskPlayAnim(playerPed, 'mp_arrest_paired', 'cop_p2_back_left', 8.0, -8.0, 5500, 33, 0, false, false, false)

	Citizen.Wait(3000)

	Aresztuje = false
end)

RegisterNetEvent('esx_policejob_areszt:aresztuj2')
AddEventHandler('esx_policejob_areszt:aresztuj2', function()
	Aresztuje = true
	local playerPed = GetPlayerPed(-1)


	RequestAnimDict('mp_arresting')

	while not HasAnimDictLoaded('mp_arresting') do
		Citizen.Wait(10)
	end

	TaskPlayAnim(playerPed, 'mp_arresting', 'a_uncuff', 8.0, -8.0, 1000, 33, 0, false, false, false)

	Citizen.Wait(1000)

	Aresztuje = false

end)




RegisterNetEvent('esx_policejob:unrestrain')
AddEventHandler('esx_policejob:unrestrain', function()
	if LocalPlayer.state.handcuffed then
		local playerPed = PlayerPedId()
		LocalPlayer.state:set('handcuffed', false, true)

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(false)
	    ESX.ClearTimeout(handcuffTimer.task)
	end
end)

RegisterNetEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function(copId)
	--if isHandcuffed then -- ODZNACZONE ŻEBY MOŻNA BYŁO PRZENOSIĆ GRACZA NA BW ;3
		dragStatus.isDragged = not dragStatus.isDragged
		dragStatus.CopId = copId
	--end
end)


RegisterNetEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function()
	--if isHandcuffed then -- ODZNACZONE ŻEBY MOŻNA BYŁO PRZENOSIĆ GRACZA NA BW ;3
		local playerPed = PlayerPedId()
		local vehicle, distance = ESX.Game.GetClosestVehicle()

		if vehicle and distance < 5 then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
				dragStatus.isDragged = false
			end
		end
	--end
end)

RegisterNetEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function()
	local playerPed = PlayerPedId()

	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		TaskLeaveVehicle(playerPed, vehicle, 16)
	end

	if LocalPlayer.state.handcuffed or LocalPlayer.state.ropecuffed then
	Citizen.Wait(100)
	exports['many-base']:playAnim(playerPed, 'mp_arresting', 'idle', -1, true)
	elseif LocalPlayer.state.isDead then
		Citizen.Wait(100)
		TaskPlayAnim(playerPed, 'dead', 'dead_a', 1.0, 1.0, -1, 2, 0, 0, 0, 0)
	end
end)


AddEventHandler('esx:onPlayerSpawn', function(spawn)

end)

AddEventHandler('esx:onPlayerDeath', function(data)

	SetPedSuffersCriticalHits(PlayerPedId(), true)
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_policejob:unrestrain')
	end
end)

--[[
SPRAWDZANIE PROCHU NA RĘKACH
]]

 gsrTimer = 0
 gsrPositive = false
 plyPed = PlayerPedId()
 gsrTestDistance = 5
RegisterNetEvent('esx_policejob:PowderGun')
AddEventHandler('esx_policejob:PowderGun', function()
    local playerCoords = GetEntityCoords(plyPed)
    for _, player in ipairs(GetActivePlayers()) do
        local targetPed = GetPlayerPed(player)
        local targetId = GetPlayerServerId(player)
        local distance = #(playerCoords-GetEntityCoords(targetPed))
        if targetPed ~= plyPed then
            if distance <= gsrTestDistance then
                --print('GSR Tested: ' .. targetId)
                TriggerServerEvent('esx_policejob:CheckGunpowder', targetId)
				exports['many-base']:Notify('inform', 'Sprawdzasz proch na rękach obywatela')

            end
        end
    end
end)


RegisterNetEvent("esx_policejob:TestHandler")
AddEventHandler("esx_policejob:TestHandler", function(tester)
	Citizen.Wait(3000)
    if gsrPositive then
        TriggerServerEvent("esx_policejob:TestCallback", tester, true)
    elseif not gsrPositive then
        TriggerServerEvent("esx_policejob:TestCallback", tester, false)
    end
end)

--[[

SPRAWDZANIE TRZEŹWOŚCI

]]

RegisterNetEvent('esx_policejob:CheckDrunk')
AddEventHandler('esx_policejob:CheckDrunk', function(player)
	if lib.progressBar({
		duration = 7000,
		label = 'Sprawdzanie trzeźwości...',
		useWhileDead = false,
		canCancel = true,
		disable = {
			car = true,
			move = true,
			combat = true,
		},
		anim = {
			dict = 'random@train_tracks',
			clip = 'idle_e'
		},
	}) then
	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
		exports['many-base']:Notify('inform', 'Poziom alkoholu we krwi wynosi '..data.drunk..'%')
	end, GetPlayerServerId(player))
else
	exports['many-base']:Notify('inform', 'Przestałeś sprawdzać stan trzeźwości')
end
end)



RegisterNetEvent('police:vehcategories')
AddEventHandler('police:vehcategories', function()
MenuCategories()
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent('esx_policejob:TakeOutVehicle')
AddEventHandler('esx_policejob:TakeOutVehicle', function()
	if ESX.PlayerData.job.name == 'police' then
		if ESX.PlayerData.job.grade_name == 'kadet' then
			exports['many-base']:Notify('inform', 'Nie jesteś upoważniony do wyjmowania pojazdów!')
		else
			TriggerEvent('esx_policejob:SpawnCar', 'npolvic')
		end
	end
end)

RegisterCommand('keys', function(source, args, rawCommand)
	local playerPed = PlayerPedId()

if args[1] ~= nil then
	if IsPedInAnyVehicle(playerPed, false) then
		local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(playerPed, false))
		if ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'ambulance' then
			TriggerServerEvent('givekeysServer', args[1], plate, passwd)
		end
	else
		ESX.ShowNotification('Musisz być w pojeździe')
	end
else
	ESX.ShowNotification('Podaj ID gracza')
end

end)


LocalPlayer.state:set('hasVehicle', false, true)
local isDiffrent = false
RegisterNetEvent('esx_policejob:SpawnCar', function(vehicle, tuning)
	isDiffrent = false
	for i,car in pairs(Config.CarOdwrotne) do
		--print(vehicle, car, vehicle == car)
		if vehicle == car then
			isDiffrent = true
		end
	end

    if not LocalPlayer.state.hasVehicle then

		local coords = nil
		for _, spawn in ipairs(Config.Zones['CarSpawns']) do
			if areaCheck(table.unpack(spawn.check)) then
				coords = spawn.coords
				break
			end
		end

    local TR = PlayerPedId()
    RequestModel(vehicle)
    while not HasModelLoaded(vehicle) do
        Wait(0)
    end
    if not IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

        local JobVehicle = CreateVehicle(vehicle, coords, 45.0, true, false)
        SetVehicleHasBeenOwnedByPlayer(JobVehicle, true)
        SetEntityAsMissionEntity(JobVehicle, true, true)
        local num = math.random(10, 999)
        local carplate = SetVehicleNumberPlateText(JobVehicle, 'LSPD'..num)
		LocalPlayer.state:set('hasVehicle', true , true)
        SetVehicleFuelLevel(JobVehicle, 100.0)

		if not isDiffrent then
		SetVehicleColours(JobVehicle, 111, 0)
		else
		SetVehicleColours(JobVehicle, 0, 111)
		end

        local id = NetworkGetNetworkIdFromEntity(JobVehicle)
        DoScreenFadeOut(1500)
        Wait(1500)
        SetNetworkIdCanMigrate(id, true)
        TaskWarpPedIntoVehicle(TR, JobVehicle, -1)
        DoScreenFadeIn(1500)
        local plate = GetVehicleNumberPlateText(JobVehicle)
        TriggerServerEvent('many-addkeys', plate)

				 -- Dodaj poniższe linie, aby ustawić maksymalny tuning dla pojazdu
				 SetVehicleModKit(JobVehicle, 0) -- Ustawia mod kit na 0 (maksymalne tuningi)
				 ToggleVehicleMod(JobVehicle, 18, true) -- Włącza silnik turbo
				 SetVehicleMod(JobVehicle, 11, GetNumVehicleMods(JobVehicle, 11) - 1, true) -- Silnik
				 SetVehicleMod(JobVehicle, 12, GetNumVehicleMods(JobVehicle, 12) - 1, true) -- Hamulce
				 SetVehicleMod(JobVehicle, 13, GetNumVehicleMods(JobVehicle, 13) - 1, true) -- Skrzynia
				 SetVehicleMod(JobVehicle, 16, GetNumVehicleMods(JobVehicle, 16) - 1, true)  -- Armor 
				 SetVehicleMod(JobVehicle, 17, GetNumVehicleMods(JobVehicle, 17) - 1, true)  -- Nitro
				 SetVehicleMod(JobVehicle, 18, GetNumVehicleMods(JobVehicle, 18) - 1, true) -- Turbo

				for extraId = 1, 9 do
					SetVehicleExtra(JobVehicle, extraId, false) -- Ustaw ekstrę dla danego ID na true
				end
				if tuning ~= nil then
					if tuning.bumper_front ~= nil then
						SetVehicleMod(JobVehicle, 1, tuning.bumper_front, true) -- Dach
						end
					if tuning.dach ~= nil then
					SetVehicleMod(JobVehicle, 10, tuning.dach, true) -- Dach
					end
					if tuning.malowanie ~= nil then
					SetVehicleMod(JobVehicle, 48, tuning.malowanie, true) -- Malowanie
					end
					if tuning.malowanie1 ~= nil then
					SetVehicleModColor_1( JobVehicle , 1, tuning.malowanie1)
					SetVehicleModColor_2( JobVehicle , 1, tuning.malowanie1)
					SetVehicleMod(JobVehicle, 48, 0, true) -- Malowanie
					end
				end

				 print('veh',vehicle, JobVehicle)
				 if vehicle == 'pd_sultan' then
					SetVehicleMod(JobVehicle, 0, 1, true) -- Spoiler
				 end
				 if tuning.livery ~= nil then
				 SetVehicleLivery(JobVehicle, 0)
				 end
				 --  pd_sultan


				 local stashId = "trunk"..tostring(plate)
				 TriggerServerEvent('police:trad', stashId)


    else
		exports['many-base']:Notify('inform', 'Miejsce wyjmowania pojazdu jest zastawione!')
    end
else
    ESX.ShowNotification('Musisz schować poprzedni pojazd przed wyjęciem kolejnego!')
end
end)



RegisterNetEvent('esx_policejob:RemoveCar', function()
    if LocalPlayer.state.hasVehicle then
    local TR92 = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(TR92,true)
    SetEntityAsMissionEntity(TR92,true)
    local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
    TriggerServerEvent('many-removekeys', plate)
    DeleteVehicle(vehicle)
	exports['many-base']:Notify('inform', 'Schowałeś służbowy pojazd!')
	LocalPlayer.state:set('hasVehicle', false, true)
    else
        ESX.ShowNotification('Nie wyjąłeś żadnego pojazdu!')
    end
end)


--[[

# WYJMOWANIE HELKI 

]]


RegisterNetEvent('esx_policejob:TakeOutHeli')
AddEventHandler('esx_policejob:TakeOutHeli', function()

	if PlayerLicence['pilot'] then
	    if ESX.PlayerData.job.name == 'police' then
			TriggerEvent('esx_policejob:SpawnHeli', 'polmav') --polas350
		end
	else
		exports['many-base']:Notify('inform', 'Nie jesteś upoważniony do wyjmowania pojazdów!')
	end

end)


local coords = nil

RegisterNetEvent('esx_policejob:SpawnHeli', function(vehicle)
    if not LocalPlayer.state.hasVehicle then

		for _, spawn in ipairs(Config.Zones['HeliSpawns']) do
			if areaCheck(table.unpack(spawn.check)) then
				coords = spawn.coords
				break
			end
		end

    local TR = PlayerPedId()
    RequestModel(vehicle)
    while not HasModelLoaded(vehicle) do
        Wait(0)
    end
    if not IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
        local JobVehicle = CreateVehicle(vehicle, coords, 45.0, true, false)
        SetVehicleHasBeenOwnedByPlayer(JobVehicle, true)
        SetEntityAsMissionEntity(JobVehicle, true, true)
        local num = math.random(10, 999)
        local carplate = SetVehicleNumberPlateText(JobVehicle, 'AIR'..num)
		LocalPlayer.state:set('hasVehicle', true, true )
        SetVehicleFuelLevel(JobVehicle, 100.0)
		SetVehicleLivery(JobVehicle, 0)
        local id = NetworkGetNetworkIdFromEntity(JobVehicle)
        DoScreenFadeOut(1500)
        Wait(1500)
        SetNetworkIdCanMigrate(id, true)
        TaskWarpPedIntoVehicle(TR, JobVehicle, -1)
        DoScreenFadeIn(1500)
        local plate = GetVehicleNumberPlateText(JobVehicle)
        TriggerServerEvent('many-addkeys', plate)
		SetVehicleMod(JobVehicle, 48, 0, true)
    else
		exports['many-base']:Notify('inform', 'Miejsce wyjmowania helikopteru jest zastawione!')
    end
else
	exports['many-base']:Notify('inform', 'Musisz schować poprzedni helikopter przed wyjęciem kolejnego!')
end
end)

RegisterNetEvent('esx_policejob:RemoveHeli', function()
    if LocalPlayer.state.hasVehicle then
    local TR92 = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(TR92,true)
    SetEntityAsMissionEntity(TR92,true)
    local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
    TriggerServerEvent('many-removekeys', plate)
    DeleteVehicle(vehicle)
	exports['many-base']:Notify('inform', 'Schowałeś helikopter!')
	LocalPlayer.state:set('hasVehicle', false, true )
    else
		exports['many-base']:Notify('inform', 'Nie wyjąłeś żadnego helikopteru!')
    end
end)






--  # PANIC BUTTON / 10-13

SpamDelay = 0
Dane = nil
RegisterCommand('10-13a', function()

	ESX.TriggerServerCallback('ambulance:getName', function(cb)
		Dane = cb

	if ESX.PlayerData.job.name == 'police' then
		if IsEntityPlayingAnim(PlayerPedId(), "dead", "dead_a", 3) then
			if SpamDelay == 0 then
				SpamDelay = 30
				local coords = GetEntityCoords(PlayerPedId())
				local Panic = {
					code = "10-13a",
					street = Dane,
					id = exports['esx_dispatch']:randomId(),
					priority = 2,
					title = "Ranny Funkcjonariusz",
					duration = 10000,
					blipname = "# Ranny Funkcjonariusz",
					color = 75,
					sprite = 280,
					fadeOut = 180,
					position = {
						x = coords.x,
						y = coords.y,
						z = coords.z
					},
					job = "police"
				}
				local Panic1 = {
					code = "10-13a",
					street = Dane,
					id = exports['esx_dispatch']:randomId(),
					priority = 2,
					title = "Ranny Funkcjonariusz",
					duration = 10000,
					blipname = "# Ranny Funkcjonariusz",
					color = 75,
					sprite = 280,
					fadeOut = 180,
					position = {
						x = coords.x,
						y = coords.y,
						z = coords.z
					},
					job = "ambulance"
				}
				TriggerServerEvent("dispatch:svNotify", Panic)
				TriggerServerEvent("dispatch:svNotify", Panic1)
			else
				Many:Notify('inform', 'Musisz odczekać '..SpamDelay..'s zanim wyślesz kolejną 13stke')
			end
	else
		Many:Notify('inform', 'Nie jesteś ranny!')
	end
	else
		Many:Notify('inform', 'Nie jesteś w wymaganej frakcji!')
	end
end)
end)

RegisterCommand('10-13b', function()
	if ESX.PlayerData.job.name == 'police' then
		if SpamDelay == 0 then
		SpamDelay = 30
				local coords = GetEntityCoords(PlayerPedId())
				local Panic2 = {
					code = "10-13b",
					street = exports['esx_dispatch']:GetStreetAndZone(),
					id = exports['esx_dispatch']:randomId(),
					priority = 2,
					title = "Ranny obywatel [LSPD]",
					duration = 9000,
					blipname = "# Ranny obywatel [LSPD]",
					color = 75,
					sprite = 280,
					fadeOut = 180,
					position = {
						x = coords.x,
						y = coords.y,
						z = coords.z
					},
					job = "police"
				}
				local Panic3 = {
					code = "10-13b",
					street = exports['esx_dispatch']:GetStreetAndZone(),
					id = exports['esx_dispatch']:randomId(),
					priority = 2,
					title = "Ranny obywatel [LSPD]",
					duration = 9000,
					blipname = "# Ranny obywatel [LSPD]",
					color = 75,
					sprite = 280,
					fadeOut = 180,
					position = {
						x = coords.x,
						y = coords.y,
						z = coords.z
					},
					job = "ambulance"
				}
				TriggerServerEvent("dispatch:svNotify", Panic2)
				TriggerServerEvent("dispatch:svNotify", Panic3)
		else
			Many:Notify('inform', 'Musisz odczekać '..SpamDelay..'s zanim wyślesz kolejną 13stke')
		end
	else
		Many:Notify('inform', 'Nie jesteś w wymaganej frakcji!')
	end
end)

RegisterCommand('panic', function()
	ESX.TriggerServerCallback('ambulance:getName', function(cb)
		Dane = cb

	if ESX.PlayerData.job.name == 'police' then
		local coords = GetEntityCoords(PlayerPedId())
		local Panic3 = {
			code = "Panic",
			street = Dane,
			id = exports['esx_dispatch']:randomId(),
			priority = 2,
			title = "Użyto Panic Buttona",
			duration = 11000,
			blipname = "# Panic Button",
			color = 75,
			sprite = 280,
			fadeOut = 180,
			position = {
				x = coords.x,
				y = coords.y,
				z = coords.z
			},
			job = "police"
		}
		TriggerServerEvent("dispatch:svNotify", Panic3)
	else
		Many:Notify('inform', 'Nie jesteś w wymaganej frakcji!')
	end
end)
end)

RegisterNetEvent('esx_policejob:OpenJailLocker')
AddEventHandler('esx_policejob:OpenJailLocker', function()
	local input = lib.inputDialog('Szafka', {'SSN'})
	if not input then return end
--[[	local gracz = tonumber(input[1])
	ESX.TriggerServerCallback('esx_policejob:GetIdentifier1', function(SSN)
		exports.ox_inventory:openInventory('stash', { id = 'jail_storage', owner = SSN })
	end, gracz)]]
	exports.ox_inventory:openInventory('stash', { id = 'jail_storage', owner = input[1] })
end)


RegisterNetEvent('esx_policejob:kosz')
AddEventHandler('esx_policejob:kosz', function()
exports['ox_inventory']:openInventory('stash', 'dumpster_lspd')
end)

RegisterNetEvent('esx_policejob:dumpkosz')
AddEventHandler('esx_policejob:dumpkosz', function()
	TriggerServerEvent('esx_policejob:dumpkoszserver')
end)





RegisterNetEvent('esx_policejob:AresztOrg')
AddEventHandler('esx_policejob:AresztOrg', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		if not IsEntityPlayingAnim(PlayerPedId(), "mp_arresting", "idle", 3) then
TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(closestPlayer))
TriggerServerEvent('esx_policejob_areszt:startAreszt',  GetPlayerServerId(closestPlayer))
--TriggerServerEvent('esx_policejob_areszt:aresztowany', GetPlayerServerId(closestPlayer))
	end
else
			ESX.ShowNotification(TranslateCap('not_enough_medikit'))
		end
end)

RegisterNetEvent('esx_policejob:AresztStart')
AddEventHandler('esx_policejob:AresztStart', function()
ESX.TriggerServerCallback('esx_policejob:getItemAmount', function(quantity)
	if quantity > 0 then
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		if not IsEntityPlayingAnim(PlayerPedId(), "mp_arresting", "idle", 3) then
TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(closestPlayer))
TriggerServerEvent('esx_policejob_areszt:startAreszt',  GetPlayerServerId(closestPlayer))
--TriggerServerEvent('esx_policejob_areszt:aresztowany', GetPlayerServerId(closestPlayer))
		end
	end
else
			ESX.ShowNotification(TranslateCap('not_enough_medikit'))
		end
end, 'handcuffs')
end)



RegisterNetEvent('esx_policejob:przeszukaj')
	AddEventHandler('esx_policejob:przeszukaj', function()
	ESX.TriggerServerCallback('esx_policejob:getItemAmount', function(quantity)
		if quantity > 0 then
		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		if closestPlayer ~= -1 and closestDistance <= 3.0 then
			if not IsEntityPlayingAnim(PlayerPedId(), "mp_arresting", "idle", 3) then
				OpenBodySearchMenu(closestPlayer)
			end
		end
	else
				ESX.ShowNotification(TranslateCap('not_enough_medikit'))
			end
	end, 'handcuffs')
end)

PlayerLicence = {
	['pilot'] = false,
	['swat'] = false,
	['seu'] = false,
	['aiad'] = false,
	['sheriff'] = false,
	['usms'] = false,
	['lssd'] = false,
}


RegisterCommand('reloadlicencepolice', function()
	if ESX.GetPlayerData().job.name == 'police' then
  reloadlicences()
  ESX.ShowNotification('Przeładowano Licencje')
	end
end)

SpamDelayP = 0
RegisterCommand('911p', function(source, args)
		if SpamDelayP == 0 then
		local coords = GetEntityCoords(PlayerPedId())
		messagetag = table.concat(args, " ")
		local Panic = {
			code = "10-74",
			street = messagetag,
			id = exports['esx_dispatch']:randomId(),
			priority = 2,
			title = "Zgłoszenie obywatela",
			duration = 10000,
			blipname = "#Zgloszenie",
			color = 75,
			sprite = 1,
			fadeOut = 180,
			position = {
				x = coords.x,
				y = coords.y,
				z = coords.z
			},
			job = "police"
		}
		TriggerServerEvent("dispatch:svNotify", Panic)
		TriggerServerEvent('police:911plog', messagetag, coords)
		SpamDelayP = 60
		Many:Notify('inform', 'Wysłano zgłoszenie!')
		else
			Many:Notify('inform', 'Następne zgłoszenie możesz wysłać za! '..SpamDelayP..'s')
		end
end)

RegisterNetEvent('spawnboat', function(vehicle)
	
		for k, v in pairs(Config.Zones['boatpick']) do
			if areaCheck(table.unpack(v.check)) then
				coords = vector4(table.unpack(v.set))
				break
			end
		end

    local TR = PlayerPedId()
    RequestModel(vehicle)
    while not HasModelLoaded(vehicle) do
        Wait(0)
    end

    if not IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
        local JobVehicle = CreateVehicle(vehicle, coords, 45.0, true, false)
        SetVehicleHasBeenOwnedByPlayer(JobVehicle, true)
        SetEntityAsMissionEntity(JobVehicle, true, true)
        local num = math.random(10, 999)
        local carplate = SetVehicleNumberPlateText(JobVehicle, 'LSPD'..num)
        SetVehicleFuelLevel(JobVehicle, 100.0)

        local id = NetworkGetNetworkIdFromEntity(JobVehicle)
        DoScreenFadeOut(1500)
        Wait(1500)
        SetNetworkIdCanMigrate(id, true)
        TaskWarpPedIntoVehicle(TR, JobVehicle, -1)
        DoScreenFadeIn(1500)
        local plate = GetVehicleNumberPlateText(JobVehicle)
        TriggerServerEvent('many-addkeys', plate)
	
    else
		exports['many-base']:Notify('inform', 'Miejsce wyjmowania pojazdu jest zastawione!')
    end

end)

exports.ox_target:addBoxZone({
	coords = vector3(451.97, -972.71, 30.68),
    size = vector3(1, 1, 1),
    rotation = 3.0,
    debug = false,
    drawSprite = true,
    options = {
        {
            type = 'client',
            event = 'malina:client:nadajOdznake',
            icon = 'fas fa-box-open',
            label = 'Nadaj odznakę',
            canInteract = function()
				return ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.grade >= 12
			end
        },
		{
			type = 'server',
			serverEvent = 'wyga:checkhours',
			icon = 'fas fa-clock',
			label = 'Pokaż godziny',
			canInteract = function()
				return ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.grade >= 13
			end
		},
		{
			type = 'server',
			event = 'malina:resetTimers',
			icon = 'fas fa-refresh',
			label = 'Resetuj godziny',
			canInteract = function()
				return ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.grade >= 13
			end
		}
    }
})
exports.ox_target:addBoxZone({
	coords = vector3(-387.77371, -362.9895, 48.53268),
    size = vector3(1, 1, 1),
    rotation = 3.0,
    debug = false,
    drawSprite = true,
    options = {
        {
            type = 'client',
            event = 'malina:client:nadajOdznake',
            icon = 'fas fa-box-open',
            label = 'Nadaj odznakę',
            canInteract = function()
				return ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.grade >= 12
			end
        },
		{
			type = 'server',
			serverEvent = 'wyga:checkhours',
			icon = 'fas fa-clock',
			label = 'Pokaż godziny',
			canInteract = function()
				return ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.grade >= 13
			end
		},
		{
			type = 'client',
			event = 'malina:resetTimers',
			icon = 'fas fa-refresh',
			label = 'Resetuj godziny',
			canInteract = function()
				return ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.grade >= 13
			end
		}
    }
})
RegisterNetEvent('malina:client:nadajOdznake', function()
	local input = lib.inputDialog('Wydaj odznakę', {
		{ type = "input", label = "SSN", placeholder = "SSN" },
		{ type = "input", label = "Callsign", placeholder = "Callsign" },
		{ type = "input", label = "Numer odznaki", placeholder = "Numer" },
	})
	if input then
		if input[2] and input[1] and input[3] then
			TriggerServerEvent('malina:server:nadajOdznake', input[1], input[2], input[3])
		end
	end
end)



RegisterCommand('showTab', function()
print('command')
print(GlobalState.Props)
print(json.encode(GlobalState.Props))
	for k, prop in pairs(GlobalState.Props) do
		print(prop)
		print(prop.type, prop.hash)

	end

end)





--------------------------------------

RegisterNetEvent('xqsplace')
AddEventHandler('xqsplace', function(object)
	if ESX.PlayerData.job ~= nil and not ESX.PlayerData.job.name == 'police' then
			ESX.ShowNotification('Nie jesteś zatrudniony w policji')
		else
			local model     = object
			local playerPed = PlayerPedId()
			print(playerPed, model)
			
			local coords    = GetEntityCoords(playerPed)
			local forward   = GetEntityForwardVector(playerPed)
			local x, y, z   = table.unpack(coords + forward * 1.0)
			obj = CreateObject(model, x, y, z, true, true, true)

			SetEntityHeading(obj, GetEntityHeading(playerPed))
			PlaceObjectOnGroundProperly(obj)
					--TriggerServerEvent('police:Props', playerPed, tostring(model), obj)
		end
end)

RegisterNetEvent('nearprop')
AddEventHandler('nearprop', function(entity)
	local playerPed = PlayerPedId()
	local wiad      = 'Naciśnij ~INPUT_CONTEXT~ aby usunąć ten obiekt'
	

	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' and IsPedOnFoot(playerPed) then
		CurrentAction     = 'deleteprop'
		CurrentActionMsg  = wiad
		CurrentActionData = {entity = entity}
	end

	if GetEntityModel(entity) == GetHashKey('p_ld_stinger_s') then
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed)

			for i=0, 7, 1 do
				SetVehicleTyreBurst(vehicle, i, true, 1000)
			end
		end
	end
end)

RegisterNetEvent('notnearprop')
AddEventHandler('notnearprop', function(entity)
	if CurrentAction == 'deleteprop' then
		CurrentAction = nil
	end
end)

Citizen.CreateThread(function()
	local trackedEntities = {
		'prop_roadcone02a',
		'prop_barrier_work05',
		'p_ld_stinger_s'
	}

	while true do
		Citizen.Wait(500)

		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		local closestDistance = -1
		local closestEntity   = nil

		for i=1, #trackedEntities, 1 do
			local object = GetClosestObjectOfType(coords.x, coords.y, coords.z, 3.0, GetHashKey(trackedEntities[i]), false, false, false)

			if DoesEntityExist(object) then
				local objCoords = GetEntityCoords(object)
				local distance  = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, objCoords.x, objCoords.y, objCoords.z, true)

				if closestDistance == -1 or closestDistance > distance then
					closestDistance = distance
					closestEntity   = object
				end
			end
		end

		if closestDistance ~= -1 and closestDistance <= 3.0 then
			if LastEntity ~= closestEntity then
				TriggerEvent('nearprop', closestEntity)
				LastEntity = closestEntity
			end
		else
			if LastEntity ~= nil then
				TriggerEvent('notnearprop', LastEntity)
				LastEntity = nil
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)
			if IsControlJustReleased(0, 38) and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' then
				if CurrentAction == 'deleteprop' then
					if GetEntityModel(CurrentActionData.entity) == GetHashKey('p_ld_stinger_s') then
						TriggerServerEvent('xqs_kolczatki:dodaj', 'kolczatka')
					elseif GetEntityModel(CurrentActionData.entity) == GetHashKey('prop_roadcone02a') then
						TriggerServerEvent('xqs_kolczatki:dodaj', 'pacholek')
					elseif GetEntityModel(CurrentActionData.entity) == GetHashKey('prop_barrier_work05') then
						TriggerServerEvent('xqs_kolczatki:dodaj', 'barierka')
					end
					SetEntityAsMissionEntity(CurrentActionData.entity, false, false)
					DeleteEntity(CurrentActionData.entity)

				end
			CurrentAction = nil
			end
		end
	end
end)

function dvprops(tabVal)
	print('funkcja')
--[[	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local objects = ESX.Game.GetObjects()
	for i=1, #objects, 1 do
		local object = objects[i]
		if DoesEntityExist(object) then
			local objCoords = GetEntityCoords(object)
			local distance  = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, objCoords.x, objCoords.y, objCoords.z, true)
			if distance <= 100.0 then
				if GetEntityModel(object) == GetHashKey('prop_barrier_work05') or GetEntityModel(object) == GetHashKey('prop_roadcone02a') or GetEntityModel(object) == GetHashKey('p_ld_stinger_s') then
					SetEntityAsMissionEntity(object, false, false)
					DeleteEntity(object)
				end
			end
		end
	end]]


		TriggerServerEvent('police:PropsRemove', tabVal)

end


LocalPlayer.state:set('isPWC', false, true)
firstTime = false


Citizen.CreateThread(function()
while true do


	if not firstTime then
		Citizen.Wait(1000*60*30)
	else
		Citizen.Wait(30000)
	end

	Citizen.Wait(100)

	if LocalPlayer.state.isPWC then
		TriggerServerEvent('pwc:addAccountMoney', exports['rev_script']:TokenSys())
		ESX.ShowNotification('Otrzymałeś dopłatę na konto za bycie PWC')
		Citizen.Wait(1000*60*30)
	end
	
end
end)

RegisterCommand('pwc', function()
local job = ESX.PlayerData.job.name
print(LocalPlayer.state.isPWC)

if job == 'police' then
	ESX.TriggerServerCallback('pwc:PoliceCount', function(enought)
		if enought then
			ESX.TriggerServerCallback('pwc:IsPWC', function(anyPWC)
				if anyPWC.state then
					ESX.ShowNotification('Aktualny PWC: '..anyPWC.name)
				else 
					LocalPlayer.state:set('isPWC', true, true)
					firstTime = true
					ESX.ShowNotification('Przejąłeś rolę PWC')
				end
			end)
		end
	end)
end

end)

RegisterCommand('pwcoff', function()
	if LocalPlayer.state.isPWC then
		firstTime = false
		LocalPlayer.state:set('isPWC', false, true)
	end
end)

RegisterNetEvent('duty:police2')
AddEventHandler('duty:police2', function()
	LocalPlayer.state:set('isPWC', false, true)
	firstTime = false
end)
AddEventHandler('esx:onPlayerDeath', function()
	LocalPlayer.state:set('isPWC', false, true)
	firstTime = false
end)