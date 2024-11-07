
function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

function setUniforms(job_grade, playerPed)
	temp = {
		GetPedDrawableVariation(playerPed, 1),
		GetPedTextureVariation(playerPed, 1),
		GetPedDrawableVariation(playerPed, 2),
		GetPedTextureVariation(playerPed, 2),
		GetPedDrawableVariation(playerPed, 3),
		GetPedTextureVariation(playerPed, 3),
		GetPedDrawableVariation(playerPed, 4),
		GetPedTextureVariation(playerPed, 4),
		GetPedDrawableVariation(playerPed, 5),
		GetPedTextureVariation(playerPed, 5),
		GetPedDrawableVariation(playerPed, 6),
		GetPedTextureVariation(playerPed, 6),
		GetPedDrawableVariation(playerPed, 8),
		GetPedTextureVariation(playerPed, 8),
		GetPedDrawableVariation(playerPed, 9),
		GetPedTextureVariation(playerPed, 9),
		GetPedDrawableVariation(playerPed, 10),
		GetPedTextureVariation(playerPed, 10),
		GetPedDrawableVariation(playerPed, 11),
		GetPedTextureVariation(playerPed, 11),
		GetPedPropIndex(playerPed, 0),
		GetPedPropTextureIndex(playerPed, 0),
		GetPedDrawableVariation(playerPed, 7),
		GetPedTextureVariation(playerPed, 7),
	}
		tempstring=''
		for i=1, #temp do
			tempstring= tempstring .. tostring(temp[i]) .. ' '
		end
	local sex = 0
	if (exports['fivem-appearance']:getPedModel(playerPed) == 'mp_f_freemode_01') then sex = 1 end
	TriggerServerEvent('rev:setciuchy',job_grade,tempstring,sex,ESX.PlayerData.job.name)
end

function OpenCloakroomMenu()
	local playerPed = GetPlayerPed(-1)
	elements = {}
	oficerelemets ={}
	sierzantelements = {}
	commandelements = {}
	swatelements = {}
	usmselements = {}
	aiadelements = {}
	sheriffelements = {}
	lssdelements = {}
	local sex = 0
	playerIDcheck = GetPlayerServerId(PlayerId())
	if (exports['fivem-appearance']:getPedModel(playerPed) == 'mp_f_freemode_01') then sex = 1 end


	local elements = {
		{ label = 'Prywatne Ubranie', value = 'citizen_wear' },
		{ label = 'Mundury Oficerskie', value = 'oficerwear'},
	  }
	 
	if ESX.PlayerData.job.grade >= 0 then
		table.insert(oficerelemets,{label = "Kadet", value = 'kadet'})
	end
	if ESX.PlayerData.job.grade >= 1 then
		table.insert(oficerelemets,{label = "Oficer I", value = 'oficer'})
	end
		if ESX.PlayerData.job.grade >= 2 then
		table.insert(oficerelemets,{label = "Oficer II", value = 'oficer2'})
	end
		if ESX.PlayerData.job.grade >= 3 then
		table.insert(oficerelemets,{label = "Oficer III", value = 'oficer3'})
	end
		if ESX.PlayerData.job.grade >= 4 then
		table.insert(oficerelemets,{label = "Oficer IV", value = 'oficer4'})
	end

		if ESX.PlayerData.job.grade >= 5 then
		--print('waruneczek')
		table.insert(elements, 	{ label = 'Mundury Sierzant+', value = 'sierzantpluswear'})
		table.insert(sierzantelements,{label = "Sierzant I", value = 'sierzant'})
	end
		if ESX.PlayerData.job.grade >= 6 then
		table.insert(sierzantelements,{label = "Sierzant II", value = 'sierzant2'})
	end
		if ESX.PlayerData.job.grade >= 7 then
		table.insert(sierzantelements,{label = "Sierzant III", value = 'sierzant3'})
	end
		if ESX.PlayerData.job.grade >= 8 then
		table.insert(sierzantelements,{label = "Porucznik I", value = 'porucznik1'})
	end
		if ESX.PlayerData.job.grade >= 9 then
		table.insert(sierzantelements,{label = "Porucznik II", value = 'porucznik2'})
	end
		if ESX.PlayerData.job.grade >= 10 then
		table.insert(sierzantelements,{label = "Porucznik III", value = 'porucznik3'})
	end
		if ESX.PlayerData.job.grade >= 11 then
		table.insert(sierzantelements,{label = "Kapitan I", value = 'capitan'})
	end
		if ESX.PlayerData.job.grade >= 12 then
		table.insert(sierzantelements,{label = "Kapitan II", value = 'capitan2'})
	end
		if ESX.PlayerData.job.grade >= 13 then
		table.insert(sierzantelements,{label = "Kapitan III", value = 'capitan3'})
	end

		if ESX.PlayerData.job.grade >= 14 then
		table.insert(elements, 	{ label = 'Mundury Command', value = 'commandwear'})
		table.insert(commandelements,{label = "Komendant", value = 'comendant'})
	end
		if ESX.PlayerData.job.grade >= 15 then
		table.insert(commandelements,{label = "Zastępca Szefa", value = 'deputyboss'})
	end
		if ESX.PlayerData.job.grade >= 16 then
		table.insert(commandelements,{label = "Asystent Szefa", value = 'astboss'})
	end
		if ESX.PlayerData.job.grade >= 17 then
		table.insert(commandelements,{label = "Szef Policji", value = 'boss'})
	end

	if PlayerLicence['swat'] then
		table.insert(elements, 	{ label = 'SWAT', value = 'swat_sert'})
		table.insert(swatelements,{label = "SWAT Classic", value = 'swatlight'})
		table.insert(swatelements,{label = "SWAT Lekki", value = 'swatheavy'})

		table.insert(swatelements,{label = "SWAT Ciężki", value = 'sertlight'})
		--table.insert(swatelements,{label = "SERT Lekki", value = 'sertheavy'})
	end

	if PlayerLicence['usms'] then
		table.insert(elements, 	{ label = 'USMS Marshall', value = 'usmswear'})
		table.insert(usmselements,{label = "Recruit Marshal ", value = 'usms'})
		table.insert(usmselements,{label = "Deputy US Marshal ", value = 'usms1'})
		table.insert(usmselements,{label = "US Marshal ", value = 'usms2'})
		table.insert(usmselements,{label = "US Marshal Supervisor ", value = 'usms3'})
		table.insert(usmselements,{label = "Marshal Deputy Director ", value = 'usms4'})
		table.insert(usmselements,{label = "Marshal Director ", value = 'usms5'})
	end

	if PlayerLicence['aiad'] then
		table.insert(elements,	{ label = 'AIAD', value = 'aiadwear'})
		table.insert(aiadelements,{label = "Inspector I ", value = 'aiad'})
		table.insert(aiadelements,{label = "Inspector II ", value = 'aiad2'})
		table.insert(aiadelements,{label = "Inspector III ", value = 'aiad3'})
		table.insert(aiadelements,{label = "AIAD Command ", value = 'aiad4'})
	end

	if PlayerLicence['sheriff'] then
		table.insert(elements, 	{ label = 'Sheriff', value = 'sheriffwear'})
		table.insert(sheriffelements,{label = "Deputy Sheriff", value = 'sheriff'})
		table.insert(sheriffelements,{label = "Master Deputy", value = 'sheriff2'})
		table.insert(sheriffelements,{label = "Corporal", value = 'sheriff3'})
		table.insert(sheriffelements,{label = "Sergeant", value = 'sheriff4'})
		table.insert(sheriffelements,{label = "Lieutenant", value = 'sheriff5'})
		table.insert(sheriffelements,{label = "Captain", value = 'sheriff6'})
		table.insert(sheriffelements,{label = "Undersheriff", value = 'sheriff7'})
		table.insert(sheriffelements,{label = "Sheriff Chef", value = 'sheriff8'})
	end
		-- NoLoveCheck
	if PlayerLicence['lssd'] then
		table.insert(elements, 	{ label = 'LSSD', value = 'lssdwear'})
		table.insert(lssdelements,{label = "Sheriff LSSD", value = 'lssd'})
		table.insert(lssdelements,{label = "UnderSheriff LSSD", value = 'lssd2'})
		table.insert(lssdelements,{label = "Asistant Sheriff LSSD", value = 'lssd3'})
		table.insert(lssdelements,{label = "Captain LSSD", value = 'lssd4'})
		table.insert(lssdelements,{label = "Lieutenant LSSD", value = 'lssd5'})
		table.insert(lssdelements,{label = "Staff Sergeant LSSD", value = 'lssd6'})
		table.insert(lssdelements,{label = "Sergeant LSSD", value = 'lssd7'})
		table.insert(lssdelements,{label = "Detective LSSD", value = 'lssd8'})
		table.insert(lssdelements,{label = "Corporal First Class ", value = 'lssd9'})
		table.insert(lssdelements,{label = "Corporal Second Class", value = 'lssd10'})
		table.insert(lssdelements,{label = "Senior Deputy LSSD", value = 'lssd11'})
		table.insert(lssdelements,{label = "Deputy LSSD", value = 'lssd12'})
		table.insert(lssdelements,{label = "Trainee Deputy LSSD", value = 'lssd13'})
		table.insert(lssdelements,{label = "Recruit LSSD", value = 'lssd14'})
		
	end



	table.insert(elements, 	{ label = 'SPECJALNE', value = 'specjalne'})
	table.insert(elements, 	{ label = 'Kamizelki', value = 'lspdkamzy'})

	setciuchy = {}
	if ESX.PlayerData.job.grade >= 16 then
		table.insert(elements, { label = 'Zarządzaj Ubraniami', value = 'setuniforms'})

		table.insert(setciuchy,{label = "Kadet", value = 'kadet'})
		table.insert(setciuchy,{label = "Oficer I", value = 'oficer'})
		table.insert(setciuchy,{label = "Oficer II", value = 'oficer2'})
		table.insert(setciuchy,{label = "Oficer III", value = 'oficer3'})
		table.insert(setciuchy,{label = "Oficer IV", value = 'oficer4'})
		table.insert(setciuchy,{label = "Sierzant I", value = 'sierzant'})
		table.insert(setciuchy,{label = "Sierzant II", value = 'sierzant2'})
		table.insert(setciuchy,{label = "Sierzant III", value = 'sierzant3'})
		table.insert(setciuchy,{label = "Porucznik I", value = 'porucznik1'})
		table.insert(setciuchy,{label = "Porucznik II", value = 'porucznik2'})
		table.insert(setciuchy,{label = "Porucznik III", value = 'porucznik3'})
		table.insert(setciuchy,{label = "Kapitan I", value = 'capitan'})
		table.insert(setciuchy,{label = "Kapitan II", value = 'capitan2'})
		table.insert(setciuchy,{label = "Kapitan III", value = 'capitan3'})
		table.insert(setciuchy,{label = "Komendant", value = 'comendant'})
		table.insert(setciuchy,{label = "Zastępca Szefa", value = 'deputyboss'})
		table.insert(setciuchy,{label = "Asystent Szefa", value = 'astboss'})
		table.insert(setciuchy,{label = "Szef Policji", value = 'boss'})

		table.insert(setciuchy,{label = "SWAT Classic", value = 'swatlight'})
		table.insert(setciuchy,{label = "SWAT Lekki", value = 'swatheavy'})
		table.insert(setciuchy,{label = "SWAT Ciężki", value = 'sertlight'})
		--table.insert(setciuchy,{label = "SERT Ciężki", value = 'sertheavy'})

		table.insert(setciuchy,{label = "Recruit Marshal ", value = 'usms'})
		table.insert(setciuchy,{label = "Deputy US Marshal ", value = 'usms1'})
		table.insert(setciuchy,{label = "US Marshal ", value = 'usms2'})
		table.insert(setciuchy,{label = "US Marshal Supervisor ", value = 'usms3'})
		table.insert(setciuchy,{label = "Marshal Deputy Director ", value = 'usms4'})
		table.insert(setciuchy,{label = "Marshal Director ", value = 'usms5'})

		table.insert(setciuchy,{label = "Inspector I ", value = 'aiad'})
		table.insert(setciuchy,{label = "Inspector II ", value = 'aiad2'})
		table.insert(setciuchy,{label = "Inspector III ", value = 'aiad3'})
		table.insert(setciuchy,{label = "AIAD Command ", value = 'aiad4'})

		table.insert(setciuchy,{label = "Galowy", value = 'galowy'})
		table.insert(setciuchy,{label = "Heli", value = 'heli'})
		table.insert(setciuchy,{label = "Moto", value = 'moto'})

		table.insert(setciuchy,{label = "Deputy Sheriff", value = 'sheriff'})
		table.insert(setciuchy,{label = "Master Deputy", value = 'sheriff2'})
		table.insert(setciuchy,{label = "Corporal", value = 'sheriff3'})
		table.insert(setciuchy,{label = "Sergeant", value = 'sheriff4'})
		table.insert(setciuchy,{label = "Lieutenant", value = 'sheriff5'})
		table.insert(setciuchy,{label = "Captain", value = 'sheriff6'})
		table.insert(setciuchy,{label = "Undersheriff", value = 'sheriff7'})
		table.insert(setciuchy,{label = "Sheriff Chef", value = 'sheriff8'})

				-- NoLoveCheck
		table.insert(setciuchy,{label = "Sheriff LSSD", value = 'lssd'})
		table.insert(setciuchy,{label = "UnderSheriff LSSD", value = 'lssd2'})
		table.insert(setciuchy,{label = "Asistant Sheriff LSSD", value = 'lssd3'})
		table.insert(setciuchy,{label = "Captain LSSD", value = 'lssd4'})
		table.insert(setciuchy,{label = "Lieutenant LSSD", value = 'lssd5'})
		table.insert(setciuchy,{label = "Staff Sergeant LSSD", value = 'lssd6'})
		table.insert(setciuchy,{label = "Sergeant LSSD", value = 'lssd7'})
		table.insert(setciuchy,{label = "Detective LSSD", value = 'lssd8'})
		table.insert(setciuchy,{label = "Corporal First Class ", value = 'lssd9'})
		table.insert(setciuchy,{label = "Corporal Second Class", value = 'lssd10'})
		table.insert(setciuchy,{label = "Senior Deputy LSSD", value = 'lssd11'})
		table.insert(setciuchy,{label = "Deputy LSSD", value = 'lssd12'})
		table.insert(setciuchy,{label = "Trainee Deputy LSSD", value = 'lssd13'})
		table.insert(setciuchy,{label = "Recruit LSSD", value = 'lssd14'})

	end


	ESX.UI.Menu.CloseAll()
  
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'cloakroom',
	  {
		title    = 'Szatnia',
		align    = 'center',
		elements = elements,
	  },
	  function(data, menu)
  
		cleanPlayer(playerPed)


		if data.current.value == 'citizen_wear' then
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
  
			TriggerEvent('skinchanger:loadSkin', skin)
			  reloadskin()
		  end)
  


		elseif data.current.value == 'oficerwear' then 
			ESX.UI.Menu.CloseAll()
	
			ESX.UI.Menu.Open(
			  'default', GetCurrentResourceName(), 'cloakroomMundury',
			  {
				title = 'Mundury LSPD',
				align = 'center',
				elements = oficerelemets
			  }, function(data2, menu2)
				--print(data2.current.value, playerIDcheck, sex, ESX.PlayerData.job.name)
				  TriggerServerEvent('rev:getciuchy', data2.current.value, playerIDcheck, sex, ESX.PlayerData.job.name)
				  --setUniform(data2.current.value, playerPed)
			  end, function(data2, menu2)
				  menu2.close()
			  end)
		  
  
			elseif data.current.value == 'sierzantpluswear' then 
			  ESX.UI.Menu.CloseAll()
	  
			  ESX.UI.Menu.Open(
				'default', GetCurrentResourceName(), 'cloakroomMundury',
				{
				  title = 'Mundury LSPD',
				  align = 'center',
				  elements = sierzantelements
				}, function(data3, menu3)
					TriggerServerEvent('rev:getciuchy',data3.current.value, playerIDcheck, sex,ESX.PlayerData.job.name)
					--setUniform(data2.current.value, playerPed)
				end, function(data3, menu3)
				  menu3.close()
				end)
			
  
			elseif data.current.value == 'commandwear' then 
			  ESX.UI.Menu.CloseAll()
	  
			  ESX.UI.Menu.Open(
				'default', GetCurrentResourceName(), 'cloakroomMundury',
				{
				  title = 'Mundury LSPD',
				  align = 'center',
				  elements = commandelements
				}, function(data4, menu4)
					TriggerServerEvent('rev:getciuchy',data4.current.value, playerIDcheck, sex,ESX.PlayerData.job.name)
					--setUniform(data2.current.value, playerPed)
				end, function(data4, menu4)
				  menu4.close()
				end)
			
  
			elseif data.current.value == 'aiadwear' then 
				ESX.UI.Menu.CloseAll()
		
				ESX.UI.Menu.Open(
				  'default', GetCurrentResourceName(), 'cloakroomMundury',
				  {
					title = 'Mundury LSPD',
					align = 'center',
					elements = aiadelements
				  }, function(data5, menu5)
					  TriggerServerEvent('rev:getciuchy',data5.current.value, playerIDcheck, sex,ESX.PlayerData.job.name)
					  --setUniform(data2.current.value, playerPed)
				  end, function(data5, menu5)
					menu5.close()
				  end)
			  

				elseif data.current.value == 'usmswear' then 
				ESX.UI.Menu.CloseAll()
		
				ESX.UI.Menu.Open(
				  'default', GetCurrentResourceName(), 'cloakroomMundury',
				  {
					title = 'Mundury LSPD',
					align = 'center',
					elements = usmselements
				  }, function(data6, menu6)
					  TriggerServerEvent('rev:getciuchy',data6.current.value, playerIDcheck, sex,ESX.PlayerData.job.name)
					  --setUniform(data2.current.value, playerPed)
				  end, function(data6, menu6)
					menu6.close()
				  end)
			  

				elseif data.current.value == 'sheriffwear' then 
				ESX.UI.Menu.CloseAll()
		
				ESX.UI.Menu.Open(
				  'default', GetCurrentResourceName(), 'cloakroomMundury',
				  {
					title = 'Mundury LSPD',
					align = 'center',
					elements = sheriffelements
				  }, function(data7, menu7)
					  TriggerServerEvent('rev:getciuchy',data7.current.value, playerIDcheck, sex,ESX.PlayerData.job.name)
					  --setUniform(data2.current.value, playerPed)
				  end, function(data7, menu7)
					menu7.close()
				  end)

				elseif data.current.value == 'lssdwear' then 
					ESX.UI.Menu.CloseAll()
			
					ESX.UI.Menu.Open(
					  'default', GetCurrentResourceName(), 'cloakroomMundury',
					  {
						title = 'Mundury LSPD',
						align = 'center',
						elements = lssdelements
					  }, function(data17, menu17)
						  TriggerServerEvent('rev:getciuchy',data17.current.value, playerIDcheck, sex,ESX.PlayerData.job.name)
						  --setUniform(data2.current.value, playerPed)
					  end, function(data17, menu17)
						menu17.close()
					  end)
			  

  
				elseif data.current.value == 'specjalne' then 
		  local motoelement = {
			{ label = 'Galowy', value = 'galowy'},
			{ label = 'HELI', value = 'heli'},
			{ label = 'MOTO', value = 'moto'},
		  }
		  ESX.UI.Menu.CloseAll()
		  ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'cloakroomMoto',
			{
			  title = 'Special',
			  align = 'center',
			  elements = motoelement
			}, function(data8, menu8)
				TriggerServerEvent('rev:getciuchy',data8.current.value, playerIDcheck, sex,ESX.PlayerData.job.name)
				--setUniform(data2.current.value, playerPed)
			end, function(data8, menu8)
			  menu8.close()
			end)
		

		elseif data.current.value == 'swat_sert' then 
			ESX.UI.Menu.CloseAll()
			ESX.UI.Menu.Open(
			  'default', GetCurrentResourceName(), 'cloakroomMoto',
			  {
				title = 'Special',
				align = 'center',
				elements = swatelements
			  }, function(data9, menu9)
				  TriggerServerEvent('rev:getciuchy',data9.current.value, playerIDcheck, sex,ESX.PlayerData.job.name)
				  --setUniform(data2.current.value, playerPed)
			  end, function(data9, menu9)
				menu9.close()
			  end)
		

			elseif data.current.value == 'lspdkamzy' then 
		  local kamelement = {
			{ label = 'Sciagnij Kamze', value = 'kadetkamza', kamzaValue = 0},
			{ label = 'Podstawowa 1', value = 'oficerkamza1', kamzaValue = 50},
			{ label = 'Podstawowa 2', value = 'oficerkamza2', kamzaValue = 50},
			{ label = 'Sierżant+ 1', value = 'serzantkamza1', kamzaValue = 50},
			{ label = 'Sierżant+ 2', value = 'serzantkamza2', kamzaValue = 50},
			{ label = 'SWAT Lekki', value = 'swatkamza1', kamzaValue = 50},
			--{ label = 'SWAT Lekki', value = 'swatkamza2', kamzaValue = 50},
			{ label = 'SWAT Ciężki', value = 'swatkamza2', kamzaValue = 100},
			--{ label = 'SERT Ciezki', value = 'sertkamza2', kamzaValue = 100},
			{ label = 'AIAD', value = 'aiadkamza', kamzaValue = 50},
			{ label = 'USMS', value = 'usmskamza', kamzaValue = 50},
			{ label = 'Sheriff 1', value = 'sheriffkamza1', kamzaValue = 50},
			{ label = 'Sheriff 2', value = 'sheriffkamza2', kamzaValue = 50},
			{ label = 'Zarzad', value = 'zarzad', kamzaValue = 50},
		  }
		  ESX.UI.Menu.CloseAll()
  
		  ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'cloakroomKamzy',
			{
			  title = 'Kamizelki Kuloodporne LSPD',
			  align = 'center',
			  elements = kamelement
			},
			function(data10, menu10)
			  cleanPlayer(playerPed)
			  SetPedArmour(playerPed, data10.current.kamzaValue)
			  if (exports['fivem-appearance']:getPedModel(playerPed) == 'mp_f_freemode_01') then sex = 1 end
			  kamzychlopy = Config.Kamzy[1]
			  kamzybaby = Config.Kamzy[2]

				if data10.current.value == 'kadetkamza' then
					SetPedComponentVariation(playerPed, 9, 0, 0, 2)
				end

				if sex == 0 then
					for i, v in pairs(kamzychlopy) do
						if data10.current.value == v.name then
							SetPedComponentVariation(playerPed, 9, v.value, v.variant, 2)
						end
					end
				else
					for i, v in pairs(kamzybaby) do
						if data10.current.value == v.name then
							SetPedComponentVariation(playerPed, 9, v.value, v.variant, 2)
						end
					end
				end


			  --TriggerServerEvent('rev:getciuchy',data10.current.value, playerIDcheck, sex,ESX.PlayerData.job.name)
			 -- setUniform(data2.current.value, playerPed)
			end, function(data10, menu10)
			  menu10.close()
			end)
			

		elseif data.current.value == 'setuniforms' then 
			ESX.UI.Menu.CloseAll()
			ESX.UI.Menu.Open(
			  'default', GetCurrentResourceName(), 'cloakroomKamzy',
			  {
				title = 'Set Ciuchy',
				align = 'center',
				elements = setciuchy
			  },
			  function(data11, menu11)
				setUniforms(data11.current.value, playerPed)
			   -- setUniform(data2.current.value, playerPed)
			  end, function(data11, menu11)
				menu11.close()
			  end)
		end

	end, function(data, menu)
		menu.close()
		


	end)
end
  
function reloadskin()
	  SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
	  TriggerEvent('esx:showNotification', 'Ładowanie postaci..')
	  Wait(2000)
	  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		  TriggerEvent('skinchanger:loadSkin', skin)
	  end)
end

--Timer do prochu

function GSRThread()
    plyPed = PlayerPedId()
    if IsPedShooting(plyPed) then
        if gsrPositive then
            gsrTimer = 900
        else
            gsrPositive = true
            gsrTimer = 900
            Citizen.CreateThread(GSRThreadTimer)
        end
    end
end

function GSRThreadTimer()
    while gsrPositive do
        Citizen.Wait(1000)
        if gsrTimer == 0 then
            gsrPositive = false
        else
            gsrTimer = gsrTimer - 1
        end
    end
end



function OpenExtrasMenu()
	playerPed = PlayerPedId()
	if IsPedInAnyVehicle(playerPed,true) then
		local elements = {}
		local veh  = GetVehiclePedIsIn(PlayerPedId(), false) -- Pobierz pojazd, w którym znajduje się gracz
	
		SetVehicleModKit(veh, 0) -- Ustawia mod kit na 0 (maksymalne tuningi)

		table.insert(elements, {label = "Zderzak przedni", name = "zderzak", value = -1, type = 'slider', min = -1,max = 4})
		table.insert(elements, {label = "Zderzak tylni", name = "tyl", value = -1, type = 'slider', min = -1,max = 4})
		table.insert(elements, {label = "Malowanie", name = "malowanie", value = -1, type = 'slider', min = -1,max = 10})

		for i=1, 15 do
			if	DoesExtraExist(veh,i) then
				if IsVehicleExtraTurnedOn(veh, i) then
					table.insert(elements, {label = '<span style="color:green;">EXTRAS '.. i ..'</span>', name = 'extrason'..i})
				else
					table.insert(elements, {label = '<span style="color:red;">EXTRAS '.. i ..'</span>', name = 'extrasoff'..i})
				end
			end
		end
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Extras_Vehicle', {
			title    = "Warsztat LSPD",
			align    = 'right',
			elements = elements
		}, function(data, menu)
			if data.current.name == 'zderzak' then
				SetVehicleMod(veh, 1, data.current.value, true) -- Silnik
			end
			if data.current.name == 'tyl' then
				SetVehicleMod(veh, 2, data.current.value, true) -- Silnik
			end
			if data.current.name == 'malowanie' then
				SetVehicleMod(veh, 48, data.current.value, true) -- Silnik
			end
			
		for i=1, #elements do
			if data.current.name == 'extrason'..i then
				SetVehicleExtra(veh, i, true) 
			end
			if data.current.name == 'extrasoff'..i then
				SetVehicleExtra(veh, i, false) 
			end
		end
			OpenExtrasMenu()
		end, function(data, menu)
			menu.close()
		end)
	end
end


function MenuCategories() 
	ESX.UI.Menu.CloseAll()
		local elements = {} 
		for _, categories in ipairs(Config.Categories) do
			if categories.licence == 'none' or PlayerLicence[categories.licence] then
			table.insert(elements, categories)
			end
		end
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'garage_categories', {
			title    = "Garaż LSPD",
			align    = 'right',
			elements = elements
		}, function(data, menu)
		--	print('Pipa')
			CarGroup = data.current.group
			CarList(CarGroup)
		end, function(data, menu)
			menu.close()
		end)
end

function CarList(WybranaGrupa) 
	ESX.UI.Menu.CloseAll()
	elements2 = {}

	for _, car in ipairs(Config.PoliceCars) do
		if car.group == WybranaGrupa then
			if car.grade <= ESX.PlayerData.job.grade then
				if PlayerLicence[car.licence] or car.licence == 'none' then
		table.insert(elements2, car)
				end
			end
		end
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'car_list', {
		title    = "Garaż LSPD",
		align    = 'right',
		elements = elements2

	}, function(data, menu)
		TriggerEvent('esx_policejob:SpawnCar', data.current.args, data.current.tuning)
		ESX.UI.Menu.CloseAll()
	end, function(data, menu)
		menu.close()
	end)
end


function areaCheck(x,y,z,r)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local distance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, x, y, z, true)
    local radius = r

    return distance <= radius
end

--[[
function UsunPacholek()
    local playerPed = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerPed)
    local maxDistance = 25.0 -- Maksymalna odległość, w której będą usuwane obiekty
    local propModelHash = GetHashKey('prop_roadcone02a') -- Model obiektu, który chcemy usunąć

    -- Pętla iterująca przez wszystkie entity w grze
    for _, object in ipairs(GetGamePool('CObject')) do
        -- Sprawdzenie, czy entity to obiekt i czy jest w pobliżu gracza
        if DoesEntityExist(object) and IsEntityAnObject(object) then
            local objectCoords = GetEntityCoords(object)
            local distance = #(playerCoords - objectCoords) -- Obliczenie odległości między graczem a obiektem

            -- Jeżeli obiekt jest wystarczająco blisko gracza i jest żądanym modelem, usuń go
            if distance <= maxDistance and GetEntityModel(object) == propModelHash then
                DeleteEntity(object)
            end
        end
    end
end


function UsunBarierki()
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
                DeleteEntity(object)
            end
        end
    end
end

function UsunKolczatki()
    local playerPed = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerPed)
    local maxDistance = 25.0 -- Maksymalna odległość, w której będą usuwane obiekty
    local propModelHash = GetHashKey('p_ld_stinger_s') -- Model obiektu, który chcemy usunąć

    -- Pętla iterująca przez wszystkie entity w grze
    for _, object in ipairs(GetGamePool('CObject')) do
        -- Sprawdzenie, czy entity to obiekt i czy jest w pobliżu gracza
        if DoesEntityExist(object) and IsEntityAnObject(object) then
            local objectCoords = GetEntityCoords(object)
            local distance = #(playerCoords - objectCoords) -- Obliczenie odległości między graczem a obiektem

            -- Jeżeli obiekt jest wystarczająco blisko gracza i jest żądanym modelem, usuń go
            if distance <= maxDistance and GetEntityModel(object) == propModelHash then
                DeleteEntity(object)
            end
        end
    end
end

function UsunZnak()
    local playerPed = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerPed)
    local maxDistance = 25.0 -- Maksymalna odległość, w której będą usuwane obiekty
    local propModelHash = GetHashKey('prop_consign_01a') -- Model obiektu, który chcemy usunąć

    -- Pętla iterująca przez wszystkie entity w grze
    for _, object in ipairs(GetGamePool('CObject')) do
        -- Sprawdzenie, czy entity to obiekt i czy jest w pobliżu gracza
        if DoesEntityExist(object) and IsEntityAnObject(object) then
            local objectCoords = GetEntityCoords(object)
            local distance = #(playerCoords - objectCoords) -- Obliczenie odległości między graczem a obiektem

            -- Jeżeli obiekt jest wystarczająco blisko gracza i jest żądanym modelem, usuń go
            if distance <= maxDistance and GetEntityModel(object) == propModelHash then
                DeleteEntity(object)
            end
        end
    end
end

function RemoveSign()
    if DoesEntityExist(closestSign) then
        NetworkRequestControlOfEntity(closestSign)
        SetEntityAsMissionEntity(closestSign, true, true)
        DeleteEntity(closestSign)

        Wait(250)
        if not DoesEntityExist(closestSign) then
            Citizen.Wait(100)
        end
    end
end

function RemoveCone()
    if DoesEntityExist(closestCone) then
        NetworkRequestControlOfEntity(closestCone)
        SetEntityAsMissionEntity(closestCone, true, true)
        DeleteEntity(closestCone)

        Wait(250)
        if not DoesEntityExist(closestCone) then
            Citizen.Wait(100)
        end
    end
end


function RemoveBarrier()
    if DoesEntityExist(closestBarrier) then
        NetworkRequestControlOfEntity(closestBarrier)
        SetEntityAsMissionEntity(closestBarrier, true, true)
        DeleteEntity(closestBarrier)

        Wait(250)
        if not DoesEntityExist(closestBarrier) then
            Citizen.Wait(100)
        end
    end
end

function DeployStinger()
    local stinger = CreateObject(LoadModel("p_ld_stinger_s").model, GetOffsetFromEntityInWorldCoords(PlayerPedId(), -0.2, 2.0, 0.0), true, true, 0)
    SetEntityAsMissionEntity(stinger, true, true)
    SetEntityHeading(stinger, GetEntityHeading(PlayerPedId()))
    FreezeEntityPosition(stinger, true)
    PlaceObjectOnGroundProperly(stinger)
    SetEntityVisible(stinger, false)

    -- init scene
    local scene = NetworkCreateSynchronisedScene(GetEntityCoords(PlayerPedId()), GetEntityRotation(PlayerPedId(), 2), 2, false, false, 1065353216, 0, 1.0)
    NetworkAddPedToSynchronisedScene(PlayerPedId(), scene, LoadDict("amb@medic@standing@kneel@enter"), "enter", 8.0, -8.0, 3341, 16, 1148846080, 0)
    NetworkStartSynchronisedScene(scene)
    -- wait for the scene to start
    while not IsSynchronizedSceneRunning(NetworkConvertSynchronisedSceneToSynchronizedScene(scene)) do
        Wait(0)
    end
    -- make the scene faster (looks better)
    SetSynchronizedSceneRate(NetworkConvertSynchronisedSceneToSynchronizedScene(scene), 3.0)
    -- wait a bit
    while GetSynchronizedScenePhase(NetworkConvertSynchronisedSceneToSynchronizedScene(scene)) < 0.14 do
        Wait(0)
    end
    -- stop the scene early
    NetworkStopSynchronisedScene(scene)

    -- play deploy animation for stinger
    PlayEntityAnim(stinger, "P_Stinger_S_Deploy", LoadDict("p_ld_stinger_s"), 1000.0, false, true, 0, 0.0, 0)
    while not IsEntityPlayingAnim(stinger, "p_ld_stinger_s", "P_Stinger_S_Deploy", 3) do
        Wait(0)
    end
    SetEntityVisible(stinger, true)
    while IsEntityPlayingAnim(stinger, "p_ld_stinger_s", "P_Stinger_S_Deploy", 3) and GetEntityAnimCurrentTime(stinger, "p_ld_stinger_s", "P_Stinger_S_Deploy") <= 0.99 do
        Wait(0)
    end
    PlayEntityAnim(stinger, "p_stinger_s_idle_deployed", LoadDict("p_ld_stinger_s"), 1000.0, false, true, 0, 0.99, 0)

    return stinger
end


function TouchingStinger(coords, stinger)
    local min, max = GetModelDimensions(GetEntityModel(stinger))
    local size = max - min
    local w, l, h = size.x, size.y, size.z

    local offset1 = GetOffsetFromEntityInWorldCoords(stinger, 0.0, l/2, h*-1)
    local offset2 = GetOffsetFromEntityInWorldCoords(stinger, 0.0, l/2 * -1, h)

    return IsPointInAngledArea(coords, offset1, offset2, w*2, 0, false)
end

function RemoveStinger()
    if DoesEntityExist(closestStinger) then
        NetworkRequestControlOfEntity(closestStinger)
        SetEntityAsMissionEntity(closestStinger, true, true)
        DeleteEntity(closestStinger)

        Wait(250)
        if not DoesEntityExist(closestStinger) then
            TriggerServerEvent("loaf_spikestrips:removedSpike")
        end
    end
end
]]

function loadModel(model)
    if type(model) == 'number' then
        model = model
    else
        model = GetHashKey(model)
    end
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end


function LoadDict(Dict)
    while not HasAnimDictLoaded(Dict) do 
        Wait(0)
        RequestAnimDict(Dict)
    end

    return Dict
end

function LoadModel(model)
    model = type(model) == "string" and GetHashKey(model) or model

    if not HasModelLoaded(model) and IsModelInCdimage(model) then
        local timer = GetGameTimer() + 20000
        RequestModel(model)
        while not HasModelLoaded(model) and timer >= GetGameTimer() do 
            Wait(50)
        end
    end

    return {loaded = HasModelLoaded(model), model = model}
end


function OpenBodySearchMenu(target)
    local serverId = GetPlayerServerId(target)
    ESX.TriggerServerCallback('esx_policejob:checkSearch', function(cb)
        if cb == true then
            ESX.ShowAdvancedNotification("Ta osoba jest już przeszukiwana!") 
        else
            exports.ox_inventory:openInventory('player', serverId)
        end
    end, serverId)
end



function boatmenu()

	local elements = {
		{label = 'Łódź', value = 'dinghy'},
		{label = 'Motorówka', value = 'seashark2'},
	}


	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'boat_menu',
	  {
		title    = 'Wybierz łódkę',
		elements = elements,
		align = 'center',
	  },
	  function(data, menu)

		local vehicle = data.current.value
		--print(vehicle)
		menu.close()
		TriggerEvent('spawnboat', vehicle)
	  end
	)

end

function boatblip()
    CreateThread(function()
        if ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'ambulance' then

        for i=1, #Config.Zones['lodzie'], 1 do
            local blip = AddBlipForCoord(Config.Zones['lodzie'][i])
            SetBlipSprite(blip, 427)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 0.8)
            SetBlipColour(blip, 38)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("ŁODZIE")
            EndTextCommandSetBlipName(blip)
        end
    end
    end)
end

function reloadlicences()

	for k, v in pairs(PlayerLicence) do
		ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
			if hasLicense then
				PlayerLicence[k] = true
			end
			end, GetPlayerServerId(PlayerId()), k)
	end
end

--[[function StopNPCDrivingInArea(center, radius)
    local vehicles = ESX.Game.GetVehiclesInArea(center, radius)
    for _, vehicle in ipairs(vehicles) do
        SetVehicleForwardSpeed(vehicle, 0.0)
        SetVehicleEngineOn(vehicle, false, true, true)
    end
    SetRandomVehicleDensityMultiplierThisFrame(0.0)
    SetParkedVehicleDensityMultiplierThisFrame(0.0)
end]]

function StopNPCDrivingInArea(center, radius)
    local vehicles = ESX.Game.GetVehiclesInArea(center, radius)
    for _, vehicle in ipairs(vehicles) do
        if not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1)) then
            SetVehicleForwardSpeed(vehicle, 0.0)
            SetVehicleEngineOn(vehicle, false, true, true)
        end
    end
    SetRandomVehicleDensityMultiplierThisFrame(0.5)
    SetParkedVehicleDensityMultiplierThisFrame(0.5)
end



	
function OpenTrafficMenu()
	
	local job = ESX.PlayerData.job.name == 'police'
	local playerPed = PlayerPedId()
	local playerCoords = GetEntityCoords(playerPed)
	
		local input = lib.inputDialog('Dodaj Strefe', {
			{ type = "input", label = "Nazwa", placeholder = "Nazwa" },
			{ type = "slider", label = "Radius", min = 1, max = 150 },
	
		})
		if input then
			if input[2] and input[1]  then
				TriggerServerEvent('police:StopZones', input[1], input[2], playerCoords)
			end
		end
	end
	
Citizen.CreateThread(function()
		while true do
		Citizen.Wait(0)
		for k, zones in pairs(GlobalState.StopZones) do
				StopNPCDrivingInArea(zones.coords, zones.radius)
			end
		end
end)


RegisterCommand('stopzone', function()
	if ESX.PlayerData.job.name == 'police' then
		MainPropMenu()
	end
end)


function MainPropMenu() 
	zonesName = {}
	for k, zones in pairs(GlobalState.StopZones) do
		table.insert(zonesName, {label = k, value = k})
	end

	local elements = {
		{label = 'Dodaj Strefe', value = 'addzone'},
		{label = 'Zarządzaj Strefami', value='removezone'},
		{label = 'Zbierz Barierki/Pachołki/Kolczatki', value='removeprops'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Stref_menu', {
		title    = "Menu Stref",
		align    = 'right',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'addzone' then
			OpenTrafficMenu()
		end
		if data.current.value == 'removeprops' then
			exports['rev_script']:PropsDeletePolice()
		end
		if data.current.value == 'removezone' then
			ESX.UI.Menu.CloseAll()
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Stref_menu2', {
				title    = "Menu Stref",
				align    = 'right',
				elements = zonesName
			}, function(data2, menu2)
				TriggerServerEvent('police:StopZonesRemove', data2.current.value)
				menu2.close()
				end, function(data2, menu2)
					menu2.close()
				end)
		end
	end, function(data, menu)
		menu.close()
	end)
end