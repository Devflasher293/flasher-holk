ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

ESX.RegisterUsableItem('2gweedbag', function(source)
    local sRc = source 
    local xPlayer = ESX.GetPlayerFromId(sRc)
    local CheckRizzla = xPlayer.getInventoryItem('ocb_rizzla').count

    if CheckRizzla == 0 then 
        TriggerClientEvent('esx:showNotification', source, 'du behöver rizz, köp rizzla bre')
    end 
    if CheckRizzla >= 1 then 
        TriggerClientEvent('flasher-holk:RollingJoint', source)
        xPlayer.removeInventoryItem('2gweedbag', 1)
        xPlayer.removeInventoryItem('ocb_rizzla', 1)
        xPlayer.addInventoryItem('joint', 3)
    end
end)

ESX.RegisterUsableItem('joint', function(source)
    local sRc = source 
    local xPlayer = ESX.GetPlayerFromId(sRc)
    local CheckLighter = xPlayer.getInventoryItem('lighter').count

    if CheckLighter == 0 then 
        TriggerClientEvent('esx:showNotification', source, 'du behöver tändare, köp tändare bre')
    end
    if CheckLighter >= 1 then
        TriggerClientEvent('flasher-holk:JointEffect', source)
        xPlayer.removeInventoryItem('joint', 1)
    end
end)