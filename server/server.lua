local flaggedPlayers = {}
RegisterNetEvent('antigodmode:flag')
AddEventHandler('antigodmode:flag', function(pid, health)
    local src = source
    local name = GetPlayerName(src)
    print("^1[Anti-Godmode]^7 Player: " .. name .. " | ID: " .. src .. " | Health: " .. health .. " flagged for possible godmode!")
    
    if not flaggedPlayers[src] then
        flaggedPlayers[src] = {name = name, health = health, timesFlagged = 1}
    else
        flaggedPlayers[src].timesFlagged = flaggedPlayers[src].timesFlagged + 1
    end

    
end)