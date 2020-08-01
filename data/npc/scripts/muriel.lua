local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)

    if(npcHandler.focus ~= cid) then
        return false
    end

    if msgcontains(msg,'spells') then
        if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 then
            selfSay('For which level would you like to learn spells 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 20, 21, 23, 24, 25, 26, 27, 28, 29, 31, 32, 33, 35, 37, 38, 41, 45, 55, 60?')
        else
            selfSay('Sorry, I only sell spells to sorcerers.')
        end
    end
return 1
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
-- Magic Level 0
local node1 = keywordHandler:addKeyword({'lesser heal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like me to teach you lesser heal for 50 gold?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler,
        premium = false,
        spellName = 'Lesser Heal',
        vocation = {1,5},
        price = 50,
        magicLevel = 0})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Afraid of magic?', reset = true})

local node2 = keywordHandler:addKeyword({'lesser light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like me to teach you lesser light for 50 gold?'})
node2:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler,
        premium = false,
        spellName = 'Lesser Light',
        vocation = {1,5},
        price = 50,
        magicLevel = 0})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Afraid of magic?', reset = true})

-- Magic level 2
local node3 = keywordHandler:addKeyword({'lesser holy strike'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like me to teach you lesser holy strike for 100 gp?'})
node3:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler,
        premium = false,
        spellName = 'Lesser Holy Strike',
        vocation = {1,5},
        price = 100,
        magicLevel = 2})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Afraid of magic?', reset = true})

local node4 = keywordHandler:addKeyword({'lesser energy strike'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like me to teach you lesser energy strike for 100 gp?'})
node4:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler,
        premium = false,
        spellName = 'Lesser Energy Strike',
        vocation = {1,5},
        price = 100,
        magicLevel = 2})
node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Afraid of magic?', reset = true})

local node5 = keywordHandler:addKeyword({'lesser death strike'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like me to teach you lesser death strike for 100 gp?'})
node5:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler,
        premium = false,
        spellName = 'Lesser Death Strike',
        vocation = {1,5},
        price = 100,
        magicLevel = 2})
node5:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Afraid of magic?', reset = true})

local node6 = keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like me to teach you heal for 100 gp?'})
node6:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler,
        premium = false,
        spellName = 'Heal',
        vocation = {1,5},
        price = 100,
        magicLevel = 2})
node6:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Afraid of magic?', reset = true})

--  --  --  --  --
-- Magic Level 4
--  --  --  --  --
local node7 = keywordHandler:addKeyword({'lesser energy missiles'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like me to teach you lesser energy missiles for 200 gp?'})
node7:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler,
        premium = false,
        spellName = 'Lesser Energy Missiles',
        vocation = {1,5},
        price = 200,
        magicLevel = 4})
node7:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Afraid of magic?', reset = true})


local node8 = keywordHandler:addKeyword({'lesser electrify'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like me to teach you lesser electrify for 200 gp?'})
node8:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler,
        premium = false,
        spellName = 'Lesser Electrify',
        vocation = {1,5},
        price = 200,
        magicLevel = 4})
node8:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Afraid of magic?', reset = true})


local node9 = keywordHandler:addKeyword({'lesser torment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like me to teach you lesser torment for 200 gp?'})
node9:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler,
        premium = false,
        spellName = 'Lesser Torment',
        vocation = {1,5},
        price = 200,
        magicLevel = 4})
node9:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Afraid of magic?', reset = true})

local node10 = keywordHandler:addKeyword({'light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like me to teach you light for 200 gp?'})
node10:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler,
        premium = false,
        spellName = 'Light',
        vocation = {1,5},
        price = 200,
        magicLevel = 4})
node10:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Afraid of magic?', reset = true})

-- Magic Level 15
local node11 = keywordHandler:addKeyword({'greater light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like me to teach you greater light for 100 gp?'})
node11:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler,
        premium = false,
        spellName = 'Greater Light',
        vocation = {1,5},
        price = 750,
        magicLevel = 15})
node11:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Afraid of magic?', reset = true})
npcHandler:addModule(FocusModule:new())
