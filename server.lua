local allowedGroups = {
    ['admin'] = true,
    ['superadmin'] = true,
    ['projektleiter'] = true,
    ['manager'] = true,
    ['supporter'] = true,
    ['moderator'] = true
}

local function GetPlayerGroup(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    return xPlayer.getGroup() 
end

local function isAdminOrHigher(playerId)
    local playerGroup = GetPlayerGroup(playerId)
    return allowedGroups[playerGroup] or false
end

RegisterCommand('reviveall', function(source)
    if isAdminOrHigher(source) then
        for _, playerId in ipairs(GetPlayers()) do
            TriggerClientEvent('revivePlayer', playerId)
        end
        print('Alle Spieler wurden revived von ' .. GetPlayerName(source))
    else
        print('Spieler hat keine Berechtigung für diesen Befehl.')
    end
end, false)
