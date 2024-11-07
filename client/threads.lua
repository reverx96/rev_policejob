Citizen.CreateThread(function()
    while ESX.PlayerData == nil do
		Citizen.Wait(10)
		ESX.PlayerData = ESX.GetPlayerData()
	end
	Wait(5000)
end)

dragStatus.isDragged = false

CreateThread(function()
	while true do
		Citizen.Wait(0)
		if LocalPlayer.state.handcuffed or LocalPlayer.state.ropecuffed then
			DisableControlAction(0, 47, true) -- G
			DisableControlAction(0, 166, true) -- F5
			DisableControlAction(0, 21, true) -- LEFTSHIFT
			DisableControlAction(0, 36, true) -- SHIFT
			DisableControlAction(0, 178, true) -- DELETE
			DisableControlAction(0, 22, true) -- SPACE
			DisableControlAction(0, 288, true) -- F1
			DisableControlAction(0, 289, true) -- F2
			DisableControlAction(0, 170, true) -- F3
			DisableControlAction(0, 166, true) -- F4
			DisableControlAction(0, 74, true) -- H
			DisableControlAction(0, 157, true) -- 1
			DisableControlAction(0, 158, true) -- 2
			DisableControlAction(0, 160, true) -- 3
			DisableControlAction(0, 164, true) -- 4
			DisableControlAction(0, 165, true) -- 5
			exports['ox_target']:disableTargeting(true)
		else
			exports['ox_target']:disableTargeting(false)
			Citizen.Wait(500)

		end
	end
end)


CreateThread(function()
	while true do
		Wait(0)
		local playerPed = PlayerPedId()

		if LocalPlayer.state.handcuffed then
			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
				exports['many-base']:playAnim(playerPed, 'mp_arresting', 'idle', -1, true)
			end
		else
			Wait(200)
		end
	end
end)

CreateThread(function()
	while true do
		Wait(0)
		local playerPed = PlayerPedId()

		if LocalPlayer.state.ropecuffed then
			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'sit', 3) ~= 1 then
				exports['many-base']:playAnim(playerPed, 'mp_arresting', 'sit', -1, true)
			end
		else
			Wait(200)
		end
	end
end)


CreateThread(function()
	local wasDragged

	while true do
		Wait(0)
		local playerPed = PlayerPedId()

		if --[[isHandcuffed and ]]dragStatus.isDragged then -- ODZNACZONE ŻEBY MOŻNA BYŁO PRZENOSIĆ GRACZA NA BW ;3
			local targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))

			if DoesEntityExist(targetPed) then
				if not wasDragged then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, true, 2, true)
					wasDragged = true
				else
					Wait(1000)
				end
			else
				wasDragged = false
				dragStatus.isDragged = false
				DetachEntity(playerPed, true, false)
			end
		elseif wasDragged then
			wasDragged = false
			DetachEntity(playerPed, true, false)
		else
			Wait(500)
		end
	end
end)





Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        GSRThread()
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		x = -366.16738891602
		y = -368.22021484375
		z = 24.756671905518

        radius = 2.0
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local distance = GetDistanceBetweenCoords(playerCoords, x, y, z, true)

        if distance <= radius then
            -- Wyświetl informację o naciśnięciu przycisku E (możesz dostosować według potrzeb)
            SetTextComponentFormat("STRING")
            AddTextComponentString("Naciśnij ~INPUT_CONTEXT~, aby wykonać akcję")
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            -- Sprawdź, czy gracz naciska przycisk E
            if IsControlJustPressed(0, 38) then
                -- Wykonaj funkcję extrasy
                OpenExtrasMenu()
            end
        end
    end

end)

CreateThread(function()
	local blip2 = AddBlipForCoord(vec3(407, -1624, 29))
	SetBlipSprite(blip2, 56)
	SetBlipDisplay(blip2, 3)
	SetBlipScale(blip2, 0.7)
	SetBlipColour(blip2, 38)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Parking Policyjny")
	EndTextCommandSetBlipName(blip2)
end)

CreateThread(function()

	for i=1, #Config.Zones['komendyblip'], 1 do
		local blip = AddBlipForCoord(Config.Zones['komendyblip'][i])
		SetBlipSprite(blip, 60)
		SetBlipDisplay(blip, 10)
		SetBlipScale(blip, 0.8)
		SetBlipColour(blip, 38)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Komenda PD")
		EndTextCommandSetBlipName(blip)
	end
end)





Citizen.CreateThread(function()
    while true do
    Citizen.Wait(1000)
        if SpamDelay > 0 then
            SpamDelay = SpamDelay - 1
        else
            SpamDelay = 0
        end
    
		if SpamDelayP > 0 then
            SpamDelayP = SpamDelayP - 1
        else
            SpamDelayP = 0
        end
    end
    end)
    

    Citizen.CreateThread(function()
        while true do
            TriggerServerEvent('esx_policejob:ClearDumpster')
            Citizen.Wait(20500)
        end
    end)
    
    