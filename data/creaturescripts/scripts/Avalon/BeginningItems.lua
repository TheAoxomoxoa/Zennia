local config = {
        [0] = {
                --equipment club, jacket, sandals, torch
                items = {{2382, 1}, {26392, 1}, {2642, 1}, {2050, 1}},
                --container rope, shovel, mana potion, 10 platinum coin
                container = {{2667, 3}, {2380, 1}, {2379, 1}}
        }
}

function onLogin(player)
    if player:getLastLoginSaved() ~= 0 then
        return true
    end

    local targetVocation = config[player:getVocation():getId()]
    if not targetVocation then
        return true
    end

    for i = 1, #targetVocation.items do
        player:addItem(targetVocation.items[i][1], targetVocation.items[i][2])
    end

    local backpack = player:addItem(26388)
    if not backpack then
        return true
    end

    for i = 1, #targetVocation.container do
        backpack:addItem(targetVocation.container[i][1], targetVocation.container[i][2])
    end
    return true
end
