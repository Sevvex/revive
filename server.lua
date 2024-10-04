ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


local function isAdminOrHigher(xPlayer)
    local group = xPlayer.getGroup()
    return group == 'admin' or group == 'superadmin' or group == 'projektleiter' or group == 'manager' or group == 'supporter' or group == 'moderator'
end


RegisterCommand('revive', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)


    if isAdminOrHigher(xPlayer) then
        local targetId = tonumber(args[1]) 
        if targetId then
            TriggerClientEvent('esx_ambulancejob:revive', targetId)
            TriggerClientEvent('esx:showNotification', source, 'Spieler mit ID ' .. targetId .. ' wurde revived.')
        else
            TriggerClientEvent('esx:showNotification', source, 'Ungültige Spieler-ID.')
        end
    else
        TriggerClientEvent('esx:showNotification', source, 'Du hast keine Berechtigung, diesen Befehl zu verwenden.')
    end
end, false)


RegisterCommand('reviveall', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)


    if isAdminOrHigher(xPlayer) then
        
        for _, playerId in ipairs(GetPlayers()) do
            TriggerClientEvent('esx_ambulancejob:revive', playerId)
        end
        TriggerClientEvent('esx:showNotification', source, 'Alle Spieler wurden revived.')
    else
        TriggerClientEvent('esx:showNotification', source, 'Du hast keine Berechtigung, diesen Befehl zu verwenden.')
    end
end, false)
