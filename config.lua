Config                            = {}

Config.EnableESXIdentity          = true
Config.EnableLicenses             = true
Config.EnableHandcuffTimer        = true -- Timer na line ;3
Config.HandcuffTimer              = 10 * 60000 -- 10 minutek
Config.OxInventory                = ESX.GetConfig().OxInventory
Config.CarSpawner                 = true

Config.Ciuchy = {
    {
        name = 'heli',
        sex = 1,
        rece1 = 17,
        rece2 = 0,
        gora1 = 450,
        gora2 = 0,
        buty1 = 25,
        buty2 = 0,
        tors1 = 196,
        tors2 = 0,
        czapka1 = 192,
        czapka2 = 0,
        detale1 = 150
    },
    {
        name = 'moto',
        sex = 0,
        rece1 = 17,
        rece2 = 0,
        gora1 = 448,
        gora2 = 0,
        buty1 = 25,
        buty2 = 0,
        tors1 = 196,
        tors2 = 0,
        czapka1 = 190,
        czapka2 = 0,
    },
    {
        name = 'heli',
        sex = 0,
        rece1 = 17,
        rece2 = 0,
        gora1 = 196,
        gora2 = 0,
        buty1 = 25,
        buty2 = 0,
        tors1 = 450,
        tors2 = 0,
        czapka1 = 192,
        czapka2 = 0,
    },
    {
        name = 'heli',
        sex = 0,
        rece1 = 17,
        rece2 = 0,
        gora1 = 196,
        gora2 = 0,
        buty1 = 25,
        buty2 = 0,
        tors1 = 450,
        tors2 = 0,
        czapka1 = 192,
        czapka2 = 0,
    },
}

Config.Kamzy = {
    -- Chłopy Kamzy
    {
        name = 'chlopy',
        {
            name = 'oficerkamza1',
            value = 70,
            variant = 0,
            sex = 1 ,
        },
        {
            name = 'oficerkamza2',
            value = 58,
            variant = 0,
            sex = 1 ,
        },
        {
            name = 'serzantkamza1',
            value = 66,
            variant = 0,
            sex = 1 ,
        },
        {
            name = 'serzantkamza2',
            value = 72,
            variant = 0,
            sex = 1 ,
        },
        {
            name = 'swatkamza1',
            value = 83,
            variant = 0,
            sex = 1 ,
        },
        {
            name = 'swatkamza2',
            value = 79,
            variant = 0,
            sex = 1 ,
        },
        {
            name = 'sertkamza1',
            value = 0,
            variant = 0,
            sex = 1 ,
        },
        {
            name = 'sertkamza2',
            value = 0,
            variant = 0,
            sex = 1 ,
        },
        {
            name = 'sheriffkamza1',
            value = 72,
            variant = 2,
            sex = 1 ,
        },
        {
            name = 'sheriffkamza2',
            value = 85,
            variant = 0,
            sex = 1 ,
        },
        {
            name = 'usmskamza',
            value = 72,
            variant = 3,
            sex = 1 ,
        },
        {
            name = 'aiadkamza',
            value = 72,
            variant = 1,
            sex = 1 ,
        },
        {
            name = 'zarzad',
            value = 71,
            variant = 0,
            sex = 1 ,
        },
    },
        -- Baby
    {
        name = 'baby',
        {
            name = 'oficerkamza1',
            value = 191,
            variant = 0,
            sex = 1 ,
        },
        {
            name = 'oficerkamza2',
            value = 176,
            variant = 0,
            sex = 1 ,
        },
        {
            name = 'serzantkamza1',
            value = 177,
            variant = 0,
            sex = 1 ,
        },
        {
            name = 'serzantkamza2',
            value = 179,
            variant = 0,
            sex = 1 ,
        },
        {
            name = 'swatkamza1',
            value = 182,
            variant = 0,
            sex = 1 ,
        },
        {
            name = 'swatkamza2',
            value = 186,
            variant = 0,
            sex = 1 ,
        },
        {
            name = 'sertkamza1',
            value = 0,
            variant = 0,
            sex = 1 ,
        },
        {
            name = 'sertkamza2',
            value = 0,
            variant = 0,
            sex = 1 ,
        },
        {
            name = 'sheriffkamza1',
            value = 177,
            variant = 2,
            sex = 1 ,
        },
        {
            name = 'sheriffkamza2',
            value = 191,
            variant = 2,
            sex = 1 ,
        },
        {
            name = 'usmskamza',
            value = 177,
            variant = 3,
            sex = 1 ,
        },
        {
            name = 'aiadkamza',
            value = 177,
            variant = 1,
            sex = 1 ,
        },
        {
            name = 'zarzad',
            value = 190,
            variant = 0,
            sex = 1 ,
        },
    }
}

Config.Categories= {
    {
    label = 'ADAM',
    model = 'adam',
    group = 1,
    licence = 'none',
    },
    {
    label = 'OFF-ROAD',
    model = 'offroad',
    group = 2,
    licence = 'none',
    },
    {
    label = 'MERRY',
    model = 'merry',
    group = 3,
    licence = 'none',
    },
    {
    label = 'SEU',
    model = 'seu',
    group = 4,
    licence = 'seu',
    }   ,  
    {
    label = 'SWAT',
    model = 'swat',
    group = 5,
    licence = 'swat',
    }     ,
        {
    label = 'BCSO',
    model = 'sheriff',
    group = 6,
    licence = 'sheriff',
    }     ,
        {
    label = 'USMS',
    model = 'usms',
    group = 7,
    licence = 'usms',
    }        ,
            {
    label = 'KILO',
    model = 'kilo',
    group = 8,
    licence = 'aiad',
    }    ,
    {
        label = 'LSSD',
        model = 'lssd',
        group = 9,
        licence = 'lssd',
        }  

}

Config.PoliceCars= {
    {
        label = 'Freecrawler',
        grade = 3,
        group = 2,
        args = 'DL_freecrawler',
        licence = 'none',
    },
    -- polfusion16
    {
        label = 'Ford Fusion',
        grade = 3,
        group = 6,
        args = 'polfusion16',
        licence = 'sheriff',
    },

    {
        label = 'Więźniarka',
        grade = 2,
        group = 2,
        args = 'policet',
        licence = 'none',
    },
    {
        -- Variant sherrif-1  police-2 
        label = 'Dodge 1',
        grade = 7,
        group = 1,
        args = 'npolchal',
        licence = 'none',
        tuning ={
            malowanie = 2,
        },
    },
    {
        label = 'Dodge 2',
        grade = 4,
        group = 1,
        args = 'npolchar',
        licence = 'none',
        tuning ={
            bumper_front = 0,
            malowanie = 0,
            dach = 2,
        },
    },
    {
        label = 'Explo',
        grade = 3,
        group = 2,
        args = 'npolexp',
        licence = 'none',
        tuning ={
            malowanie = 0,
            dach = 2,
        },
    },
    {
        label = 'Mustang',
        grade = 6,
        group = 1,
        args = 'npolstang',
        licence = 'none',
        tuning ={
            malowanie = 2,
        },
    },
    {
        label = 'Corvette',
        grade = 3,
        group = 4,
        args = 'npolvette',
        licence = 'seu',
        tuning ={
            malowanie = 2,
        },
    },
    {
        label = 'Victoria',
        grade = 1,
        group = 1,
        args = 'npolvic',
        licence = 'none',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'Sultan',
        grade = 3,
        group = 1,
        args = 'pd_sultan',
        licence = 'none',
    },
    {
        label = 'polbuffalo4',
        grade = 3,
        group = 4,
        args = 'polbuffalo4',
        licence = 'seu',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'polcaracara',
        grade = 2,
        group = 2,
        args = 'polcaracara',
        licence = 'none',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'polcomet',
        grade = 5,
        group = 1,
        args = 'polcomet',
        licence = 'none',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'polcoq4',
        grade = 3,
        group = 4,
        args = 'polcoq4',
        licence = 'seu',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'polvigero2',
        grade = 3,
        group = 4,
        args = 'polvigero2',
        licence = 'seu',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'polvstr',
        grade = 2,
        group = 1,
        args = 'polvstr',
        licence = 'none',
        tuning ={
            malowanie = 0,
        },
    },

    {
        label = 'Ford Crown Victoria',
        grade = 2,
        group = 6,
        args = 'polvictoria',
        licence = 'sheriff',
        tuning ={
            malowanie = 1,
        },
    },

    --{
    --    label = 'Dodge Charger 14',
    --    grade = 3,
    --    group = 6,
    --    args = 'polcharger14',
    --    licence = 'sheriff',
    --    tuning ={
    --        malowanie = 1,
    --    },
    --},



    {
        label = 'Ford Mustang',
        grade = 2,
        group = 6,
        args = 'polmustang',
        licence = 'sheriff',
        tuning ={
            malowanie = 1,
        },
    },

   
    {
        label = 'BF400',
        grade = 1,
        group = 3,
        args = 'sobf400',
        licence = 'none',
        tuning ={
            malowanie = 2,
        },
    },   


    {
        label = 'Police Bike',
        grade = 1,
        group = 3,
        args = 'policeb',
        licence = 'none',
        tuning ={
            malowanie = 0,
        },
    },
        

    {
        label = 'R1200',
        grade = 1,
        group = 3,
        args = 'r1200rtp',
        licence = 'none',
        tuning ={
            malowanie = 0,
        },
    },

    {
        label = 'Buffalo',
        grade = 3,
        group = 8,
        args = 'ucbuffalo',
        licence = 'aiad',
        tuning ={
            malowanie = 0,
            malowanie1 = 0,
        },
    },

    {
        label = 'Baller',
        grade = 3,
        group = 8,
        args = 'ucballer',
        licence = 'aiad',
        tuning ={
            malowanie = 0,
        },
    },

    --------------------------------------------------------------------
    {
        label = 'Charger 14',
        grade = 2,
        group = 7,
        args = 'usm_charger14',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'Charger 18',
        grade = 2,
        group = 7,
        args = 'usm_charger18',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'BUS',
        grade = 2,
        group = 7,
        args = 'usm_coach',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'Durango',
        grade = 2,
        group = 7,
        args = 'usm_durango',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'Explorer 16',
        grade = 2,
        group = 7,
        args = 'usm_explorer16',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'F150',
        grade = 2,
        group = 7,
        args = 'usm_f150',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'Fusion 16',
        grade = 2,
        group = 7,
        args = 'usm_fusion16',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'GMC',
        grade = 2,
        group = 7,
        args = 'usm_gmc',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'Mustang',
        grade = 2,
        group = 7,
        args = 'usm_mustang',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'RAM 16',
        grade = 2,
        group = 7,
        args = 'usm_ram16',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'Raptor',
        grade = 2,
        group = 7,
        args = 'usm_raptor',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'Riot',
        grade = 2,
        group = 7,
        args = 'usm_riot',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'Silverado 19',
        grade = 2,
        group = 7,
        args = 'usm_silverado19',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'Tahoe 18',
        grade = 2,
        group = 7,
        args = 'usm_tahoe18',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'Tahoe 21',
        grade = 2,
        group = 7,
        args = 'usm_tahoe21',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'Taurus',
        grade = 2,
        group = 7,
        args = 'usm_taurus',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'VAN',
        grade = 2,
        group = 7,
        args = 'usm_van',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'Victoria',
        grade = 2,
        group = 7,
        args = 'usm_victoria',
        licence = 'usms',
        tuning ={
            malowanie = 0,
        },
    },
    {
        label = 'Dodge Charger 18',
        grade = 3,
        group = 6,
        args = 'polcharger18',
        licence = 'seu',
        tuning ={
            malowanie = 1,
        },
    },
    {
        -- Variant sherrif-1  police-2 
        label = 'Dodge Challenger',
        grade = 7,
        group = 6,
        args = 'polchallenger',
        licence = 'sheriff',
        tuning ={
            malowanie = 1,
        },
    },
    {
        label = 'Chevrolet Corvette C8',
        grade = 4,
        group = 6,
        args = 'polc8',
        licence = 'sheriff',
        tuning ={
            malowanie = 1,
        },
    },
    {
        label = 'Chevrolet Camaro',
        grade = 3,
        group = 6,
        args = 'polcamaro',
        licence = 'sheriff',
        tuning ={
            malowanie = 2,
        },
    },
    {
        label = 'Chevrolet Tahoe',
        grade = 2,
        group = 6,
        args = 'poltahoe21',
        licence = 'sheriff',
        tuning ={
            malowanie = 1,
        },
    },
    {
        label = 'Ford Everest',
        grade = 2,
        group = 6,
        args = 'poleverest',
        licence = 'sheriff',
        tuning ={
            malowanie = 1,
        },
    },
    {
        label = 'Dodge Durango',
        grade = 2,
        group = 6,
        args = 'poldurango',
        licence = 'sheriff',
        tuning ={
            malowanie = 1,
        },
    },
    {
        label = 'Ford Ranger',
        grade = 2,
        group = 6,
        args = 'polranger',
        licence = 'sheriff',
        tuning ={
            malowanie = 1,
        },
    },
    {
        label = 'Ford Bronco',
        grade = 2,
        group = 6,
        args = 'polbronco',
        licence = 'sheriff',
        tuning ={
            malowanie = 1,
        },
    },
    {
        label = 'Ford Raptor',
        grade = 2,
        group = 6,
        args = 'polraptor',
        licence = 'sheriff',
        tuning ={
            malowanie = 1,
        },
    },
    {
        label = 'Rower',
        grade = 2,
        group = 6,
        args = 'polbike',
        licence = 'sheriff',
        tuning ={
            malowanie = 1,
        },
    },
    {
        label = 'Cross',
        grade = 2,
        group = 6,
        args = 'polcross',
        licence = 'sheriff',
        tuning ={
            malowanie = 1,
        },
    },
    {
        label = 'BMW R1200',
        grade = 2,
        group = 6,
        args = 'polbmw',
        licence = 'sheriff',
        tuning ={
            malowanie = 1,
        },
    },

    {
        label = 'Tailgater',
        grade = 1,
        group = 1,
        args = 'tailgater2',
        licence = 'pilot',
    }, 

    ---SWAT

    {
        label = 'Cadillac Escalade',
        grade = 2,
        group = 5,
        args = 'sw_escalader',
        licence = 'swat',
        tuning ={
            malowanie = 0,
            livery = 0,
        },
    },
    {
        label = 'Chevrolet Tahoe',
        grade = 2,
        group = 5,
        args = 'sw_tahoe',
        licence = 'swat',
        tuning ={
            malowanie = 0,
            livery = 0,
        },
    },
    {
        label = 'Jeep',
        grade = 2,
        group = 5,
        args = 'sw_jeep',
        licence = 'swat',
        tuning ={
            malowanie = 0,
            livery = 0,
        },
    },
    {
        label = 'Hummer H2',
        grade = 2,
        group = 5,
        args = 'sw_h2',
        licence = 'swat',
        tuning ={
            malowanie = 0,
            livery = 0,
        },
    },
    {
        label = 'Hummer Humvee',
        grade = 2,
        group = 5,
        args = 'sw_hummerSU',
        licence = 'swat',
        tuning ={
            malowanie = 0,
            livery = 0,
        },
    },
    {
        label = 'Insurgent',
        grade = 2,
        group = 5,
        args = 'sw_insurgent',
        licence = 'swat',
        tuning ={
            malowanie = 0,
            livery = 0,
        },
    },
    {
        label = 'Chevrolet Tahoe S',
        grade = 2,
        group = 5,
        args = 'sw_tahoe1',
        licence = 'swat',
        tuning ={
            malowanie = 0,
            livery = 0,
        },
    },
    {
        label = 'APC',
        grade = 2,
        group = 5,
        args = 'DL_APC',
        licence = 'swat',
        tuning ={
            malowanie = 0,
            livery = 0,
        },
    },
    {
        label = 'RIOT',
        grade = 2,
        group = 5,
        args = 'riot',
        licence = 'swat',
        tuning ={
            malowanie = 0,
            livery = 0,
        },
    },

    {
        label = 'RIOT',
        grade = 2,
        group = 9,
        args = 'riot',
        licence = 'lssd',
        tuning ={
            malowanie = 0,
            livery = 0,
        },
    },
    

}

Config.Zones = {
    ['lodzie'] = {
		vector3(-1798.2626953125, -1224.9107666016, 1.5978187322617),
		vector3(1567.42578125,  3897.7092285156, 31.585760116577),
		vector3(-274.97671508789,  6623.5712890625,  7.5471739768982),
		vector3(-3428.2258300781, 952.00482177734, 8.3466835021973 ),
	},
    ['komendyblip'] = {
		vector3(-459.03, 6015.37, 31.5),
		vector3(529.72479248047,  -23.819669723511,  70.629440307617),
		vector3(-1120.5352783203, -839.3583984375, 13.350968360901),
		vector3(829.69110107422, -1276.5065917969,  26.41303062439),
		vector3( 383.33004760742,  -1612.6651611328,  29.291931152344),
		vector3( -364.70407,  -355.7013244,  31.573635),
	}, 
    ['cloakrooms'] = {
        vector3(450.232, -993.33, 30.68),
        vector3(-416.61599731445, -366.92927246094, 25.098709106445),
        vector3(-400.06967163086, -369.87783813477, 25.098705291748),
        vector3(1841.84, 3681.36, 33.6783),
        vector3(-352.03106689453, -393.89813232422, 20.2248878479),

    },
    ['szafkapriv'] = {
         vector3(458.47, -979.01, 30.69),
         vector3(1841.68, 3678.54, 32.69),
         vector3(-403.02224731445, -383.01452636719, 25.098709106445),
    },
    ['JailLock'] = {
        --vector3(1845.45,  2587.17,  45.51),jail_storage
        vector3(453.1,  -980.1,  30.0),
        vector3(-385.35708618164,  -415.53787231445,  24.098709106445),
        vector3(1818.72, 3670.23,  34.18)
    },
    ['DumpsterPolice'] = {
        vector3(455.93, -978.61, 30.68),
        vector3(-407.74656982422, -378.82331542969, 25.098705291748),
        vector3(-343.10074462891, -367.83474731445, 20.22608757019),
    },
    ['CarSpawns'] = {
        {check = {1824.0, 3683.0, 33.0, 50.0}, coords = vector4(1845.05, 3689.59, 33.97, 291.0815)}, -- Komenda Sandy
        {check = {-459.03, 6015.37, 31.5, 50.0}, coords = vector4(-475.91540527344,  6031.7490234375,  31.340545654297,  223.86207580566)}, -- Komenda Paleto
        {check = {437.0730, -988.8620, 25.7000, 100.0}, coords = vector4(434.27618408203, -1015.291809082,  28.778955459595, 85.772048950195)}, -- Komenda MR
        {check = {529.72479248047,  -23.819669723511,  70.629440307617, 100.0}, coords = vector4(530.10913085938, -28.951448440552, 69.907989501953, 210.66384887695)}, -- Komenda Vinevood
        {check = {-1120.5352783203, -839.3583984375, 13.350968360901, 100.0}, coords = vector4( -1126.1607666016,  -864.60797119141,  13.559678077698,  43.242404937744)}, -- Komenda Vespuchi
        {check = {829.69110107422, -1276.5065917969,  26.41303062439 , 100.0}, coords = vector4( 828.06207275391,  -1257.9024658203,  26.283889770508,  179.57849121094)}, -- Komenda La Messa
        {check = {383.33004760742,  -1612.6651611328,  29.291931152344 , 100.0}, coords = vector4( 379.1842956543,  -1628.7347412109, 28.661924362183,  316.14614868164)}, -- Komenda Davis
        {check = {-369.05773925781, -373.96771240234, 24.756650924683, 3.0}, coords = vector4( -370.08877563477,  -365.96075439453, 24.75665473938, 347.33828735352)}, -- Komenda rockford
        {check = {-387.29019165039, -364.97668457031, 24.756658554077 , 3.0}, coords = vector4( -384.38290405273,  -359.42218017578, 24.756658554077,  349.10565185547)}, -- Komenda rockford2
        {check = {-350.06365966797, -303.43243408203,  24.755867004395 , 3.0}, coords = vector4(-359.97979736328,  -307.70101928711, 24.755882263184,  167.85546875)}, -- Komenda rockford3
        {check = {-378.43844604492,  -296.88879394531,  24.755878448486 , 3.0}, coords = vector4(-376.99771118164,  -302.23114013672,  24.755868911743,  169.6962890625)}, -- Komenda rockford4
        {check = {-335.75549316406,  -363.84323120117,  20.226079940796 , 3.0}, coords = vector4( -330.19262695313,  -364.25747680664,  20.226079940796, 347.69821166992)}, -- Komenda rockford5 SWAT
    },
    --   -335.75549316406,  -363.84323120117,  20.226079940796
    ['HeliSpawns'] = {
        {check = {1824.0, 3683.0, 33.0, 50.0}, coords = vector4(1853.1707763672, 3704.6982421875, 33.974609375, 208.37451171875)},
        {check = {-470.08047485352, 6002.2041015625, 31.3024559021, 50.0}, coords = vector4(-475.16561889648, 5988.517578125, 31.33670425415, 317.73461914063)},
        {check = {437.0730, -988.8620, 25.7000, 100.0}, coords = vector4(449.1703, -981.2655, 43.6913, 89.3364)},
        {check = {-406.31869506836, -344.87457275391, 70.956260681152, 100.0}, coords = vector4(-393.90911865234, -336.23110961914, 73.235389709473, 301.23803710938)}
    },
    ['boatpick'] = {
        {check = {-1782.8704833984,  -1242.0245361328,  0.4123358130455, 100}, set = {-1782.8704833984,  -1242.0245361328,  0.4123358130455,  137.93601989746}}, -- Łódki miasto
        {check = {1516.4891357422,  3880.7744140625,  29.662040710449, 200.0}, set = {1516.4891357422,  3880.7744140625,  29.662040710449,  64.796737670898}}, -- Łódki Sandy
        {check = {-349.2939453125,  6644.44140625, -0.23584055900574, 200.0}, set = {-349.2939453125,  6644.44140625, -0.23584055900574, 52.896076202393}}, -- Łódki Paleto
        {check = {-3459.5515136719,  950.07849121094,  -0.24270287156105, 100.0}, set = {-3459.5515136719,  950.07849121094,  -0.24270287156105, 91.966583251953}} -- Komenda Vinevood
    },
    

}
Config.CarOdwrotne = {'polbuffalo4', 'polcaracara', 'polcomet', 'polcoq4', 'polvigero2', 'polvstr', 'ucbuffalo' , 'ucballer', 'sw_escalader', 'sw_tahoe', 'sw_h2' }

Config.LicenceBoxes = {
	{
		name = 'sheriff',
		coords = vec3(1835.5918945313, 3686.5687011719, 34.689331054688),
	},
    {
        name = 'swat',
        coords = vec3(-347.04290771484, -366.45458984375, 20.726072311401),
    }
}