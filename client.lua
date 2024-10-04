RegisterNetEvent('revivePlayer')
AddEventHandler('revivePlayer', function()
    local playerPed = GetPlayerPed(-1)
    SetEntityHealth(playerPed, 200)
    TriggerEvent('chat:addMessage', {
        args = { 'Du wurdest revived!' }
    })
end)
