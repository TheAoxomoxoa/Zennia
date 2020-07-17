

debug = false -- Debug mode for developers
reset = false -- Reset tasks by saying 'reset' to npc


task = {
    storage = {
        onTask         = 6522000,
        monstersLeft = 6522001,
        completed    = 6522002,
        getFinished  = 6522003,
    },
    tasks = { -- You can add as many tasks as you want
        [1] = {
            name = "Rat Pests", -- Name of Task
            description = "Rats are swarming everywhere in Avalon's sewers, everyone must do their part to keep our city free of disease. Kill 15 of them and I will reward you for your effort.", -- What the NPC tells the player to do
            monsters = { -- You can add as many monsters as you want
                "Malnourished Rat",
                "Rat",
                "Cave Rat",
            },
            toKill = 15, -- How many monsters the player needs to kill
            rewards = {    -- You can add as many rewards as you want
                [1] = {
                    name = "gold coin",
                    itemid = 2148,
                    count = 25,
                },
            },
        },
        [2] = {
            name = "Young Trolls",
            description = "Young Trolls have been spotted setting up camp near the Southern Forest's shorelines. The townspeople of Avalon are worried the camp will expand soon if they are not taken care of. I am tasking you to kill 20 of these monsters for your reward. I suggest you use your gold to replace that horrid equipment of yours before you go.",
            monsters = {
                "Young Troll",
            },
            toKill = 20,
            rewards = {
                [1] = {
                    name = "gold coin",
                    itemid = 2148,
                    count = 35,
                },
                [2] = {
                    name = "health potion",
                    itemid = 7618,
                    count = 2,
                },
            },
        },

        [3] = {
            name = "Outlaws",
            description = "I have just been informed moments ago a band of outlaws have entered the Western Isle! Hurry! You must defend Avalon before it is too late! Kill as many as you can, but for your reward you need to kill 10 of those scum! Be sure to stock up on new equipment if you haven't already, these outlaws are dangerous.",
            monsters = {
                "Outlaw Hunter",
                "Outlaw Swordsman",
            },
            toKill = 10,
            rewards = {
                [1] = {
                    name = "gold coin",
                    itemid = 2148,
                    count = 75,
                },
            },
        },
    },
}

task.__index = task

-- Finds out what the last task the player did was, if any,
-- and gives the player a new task
function task:new(player, npcHandler)
    if task:getCompleted(player) > 0 then
        task:reward(player, npcHandler)
        task:set(player, 0)
        return false
    end

    if task:onTask(player) > 0 then
        npcHandler:say("You already have a task.", player:getId())
        task:debug(player:getName() .. " is already on a task " .. task.tasks[task:onTask(player)].name  .. ".")
        return false
    end

    local lastFinished = task:getFinished(player)
    if lastFinished == #task.tasks then
        npcHandler:say("Hmm... It seems you've completed all the tasks I have right now, citizen. Thank you for your service.", player:getId())
        return false
    end

    local newTask = lastFinished + 1
    task:set(player, newTask)
    npcHandler:say(task.tasks[newTask].description, player:getId())
    return true
end

-- Sets the task provided 't' to the player provided
function task:set(player, t)
    if player:setStorageValue(task.storage.onTask, t) then
        if t == 0 then
            task:debug(player:getName() .. " is no longer on task.")
            return false
        end
        task:debug(player:getName() .. " started task " .. task.tasks[t].name .. ".")

        if player:setStorageValue(task.storage.monstersLeft, task.tasks[t].toKill) then
            return true
        end
    end
    return false
end

function task:setCompleted(player, t)
    if player:setStorageValue(task.storage.completed, t) then
        if t == 0 then
            return true
        end
        return true
    end
    return false
end

function task:getCompleted(player)
    return player:getStorageValue(task.storage.completed)
end

function task:getMonstersLeft(player)
    return player:getStorageValue(task.storage.monstersLeft)
end

-- Checks if the player is currently doing a task
-- And returns the task the player is doing
function task:onTask(player)
    for i = 1, #task.tasks do
        if player:getStorageValue(task.storage.onTask) == i then
            return i
        end
    end
    return 0
end

function task:setFinished(player, t)
    if player:setStorageValue(task.storage.getFinished, t) then
        task:debug(player:getName() .. " finished task " .. task.tasks[t].name)
        return true
    end
    return false
end

-- Checks if the player has finished a task
-- And returns the task that is finished
function task:getFinished(player)
    for i = 1, #task.tasks do
        if player:getStorageValue(task.storage.getFinished) == i then
            return i
        end
    end
    return 0
end

-- Checks if the monster killed was a task monster
function task:onKill(player, target)
    currentTask = task:onTask(player)
    for i = 1, #task.tasks[currentTask].monsters do
        if string.lower(target:getName()) == string.lower(task.tasks[currentTask].monsters[i]) then

            if task:getMonstersLeft(player) < 1 then
                return false
            end

            player:setStorageValue(task.storage.monstersLeft, task:getMonstersLeft(player) - 1)
            if task:getMonstersLeft(player) == 0 then
                if task:setCompleted(player, currentTask) then
                    player:sendTextMessage(MESSAGE_STATUS_WARNING, "You have completed your task. Return to Gaius in Avalon for your reward.")
                    task:debug(string.format("%s has completed %s.", player:getName(), task.tasks[currentTask].name))
                    return true
                end
            end

            player:sendTextMessage(MESSAGE_STATUS_WARNING, "You killed a " .. string.lower(target:getName()) .. ". Only " .. task:getMonstersLeft(player) .. " left to kill!")
            task:debug(player:getName() .. " killed a " .. string.lower(target:getName()) .. ". " .. task:getMonstersLeft(player) .. " monsters left.")
            return true
        end
    end
    return false
end

function task:reward(player, npcHandler)
    local t = task:onTask(player)
    for i = 1, #task.tasks[t].rewards do
        player:addItem(task.tasks[t].rewards[i].itemid, task.tasks[t].rewards[i].count)
        player:sendTextMessage(MESSAGE_STATUS_WARNING, string.format("You received %dx %s(s).", task.tasks[t].rewards[i].count, task.tasks[t].rewards[i].name))
        task:debug(string.format(player:getName() .. " received %dx %s(s).", task.tasks[t].rewards[i].count, task.tasks[t].rewards[i].name))
    end

    npcHandler:say("Excellent work, Avalonian. Here's your reward. Would you like me to find you another {task}?", player:getId())

    task:onTask(player, 0)
    task:setCompleted(player, 0)
    task:setFinished(player, t)
    return true
end

-- Toggle true/false at the top of this lua file
-- Resets the tasks for the provided player
function task:reset(player, npcHandler)
    if reset then
        player:setStorageValue(task.storage.onTask, 0)
        player:setStorageValue(task.storage.monstersLeft, 0)
        player:setStorageValue(task.storage.completed, 0)
        player:setStorageValue(task.storage.getFinished, 0)
        npcHandler:say("You have reseted all the tasks.", player:getId())
        task:debug(player:getName() .. " reseted his tasks.")
    end
end

-- Toggle true/false at the top of this lua file
function task:debug(string)
    if debug then
        string = "[TASK] " .. string
        print(string)
    end
end
