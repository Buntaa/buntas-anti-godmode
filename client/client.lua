local lastHealth = nil
local lastChecked = 0

AddEventHandler('gameEventTriggered', function(event, args)
    if event == "CEventNetworkEntityDamage" then
        local playerPed = GetPlayerPed(PlayerPedId())
        local currentHealth = GetEntityHealth(playerPed)

        if lastHealth ~= nil and currentHealth == lastHealth then
            if not GetPlayerInvincible(PlayerId()) and currentHealth > GetEntityMaxHealth(playerPed) or 200 then
                TriggerServerEvent('antigodmode:flag', GetPlayerServerId(PlayerId()), currentHealth)
            end
        end

        lastHealth = currentHealth
        lastChecked = GetGameTimer()
    end
end)

AddEventHandler('playerSpawned', function()
    lastHealth = GetEntityHealth(PlayerPedId())
end)