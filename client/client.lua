local RSGCore = exports['rsg-core']:GetCoreObject()

---------------------------------------------------------------------------------

--- Lotterie Ticket item Benutzen

RegisterNetEvent('mms-luckytickets:client:benutzelotterielos')
AddEventHandler('mms-luckytickets:client:benutzelotterielos', function()
    RSGCore.Functions.Progressbar('Öffne Los','Du öffnest ein Los!',Config.Opentime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    end)
    if Config.RewardCash == true and Config.RewardItem == true then
        local reward = math.random(1,2)
        if reward == 1 then
            RandomItem()
            randomitem = Config.LuckyItems[randomItem]         ---- randomitem muss an sever geschickt werden 
            TriggerServerEvent('mms-luckytickets:server:randomitem' , randomitem)
        elseif reward == 2 then
            RandomMoney()
            randommoney = Config.LuckyCash[randomMoney]       ---- randommoney muss an sever geschickt werden 
            TriggerServerEvent('mms-luckytickets:server:randommoney' , randommoney)
        end
    elseif Config.RewardCash == false and Config.RewardItem == true then
        RandomItem()
        randomitem = Config.LuckyItems[randomItem]
        TriggerServerEvent('mms-luckytickets:server:randomitem' , randomitem)
    elseif Config.RewardCash == true and Config.RewardItem == false then
        RandomMoney()
        randommoney = Config.LuckyCash[randomMoney]   ---- randommoney muss an sever geschickt werden 
        TriggerServerEvent('mms-luckytickets:server:randommoney' , randommoney)
    end
end)

--------------- Randomizer

function RandomItem()
    randomItem = math.random(1,#Config.LuckyItems)
    return Config.LuckyItems[randomItem]
end

function RandomMoney()
    randomMoney = math.random(1,#Config.LuckyCash)
    return Config.LuckyCash[randomMoney]
end
