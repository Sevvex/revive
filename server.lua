
local allowedGroups = {
    ['admin'] = true,
    ['superadmin'] = true,
    ['projektleiter'] = true,
    ['manager'] = true,
    ['supporter'] = true,
    ['moderator'] = true
}


local function isAdminOrHigher(playerId)
    local playerGroup = GetPlayerGroup(playerId)
    return allowedGroups[playerGroup] or false
end


RegisterCommand('revive', function(source, args)
    local targetId = tonumber(args[1])
    if isAdminOrHigher(source) then
        if targetId and GetPlayerName(targetId) then
            TriggerClientEvent('revivePlayer', targetId)
            print('Befehl /revive von ' .. GetPlayerName(source) .. ' für Spieler-ID ' .. targetId)
        else
            print('Ungültige Spieler-ID oder Spieler ist nicht online.')
        end
    else
        print('Spieler hat keine Berechtigung für diesen Befehl.')
    end
end, false)


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
