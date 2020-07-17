local keywordHandler = KeywordHandler:new()

local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)



local Topic = {}

local storage = 100085

local finishstorage = 13890



function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end

function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end

function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end

function onThink()                         npcHandler:onThink() end



function greetCallback(cid)

    Topic[cid] = 0

    return true

end

function creatureSayCallback(cid, type, msg)

    local v = getPlayerStorageValue(cid, storage)

    if not npcHandler:isFocused(cid) then return false end



    if (msgcontains(msg, 'heal')) then

        selfSay("You have been healed.")

				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)

           local per = 80

        doCreatureAddHealth(cid, (getCreatureMaxHealth(cid) * per / 100))

        return true

    end

    return TRUE

end



npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())
