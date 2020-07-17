local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	if msgcontains(msg, "football") then
		npcHandler:say("Do you want to buy a football for 111 gold?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			local player = Player(cid)
			if player:getMoney() >= 111 then
				npcHandler:say("Here it is.", cid)
				player:addItem(2109, 1)
				player:removeMoney(111)
			else
				npcHandler:say("You don't have enough money.", cid)
			end
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

-- Basic
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am selling equipment of all kinds. Do you need anything?"})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, text = "Magic? Ask a sorcerer or druid about that."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "It is exactly |TIME|."})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, text = "Frodo was a jolly fellow. He left Thais to live somewhere far away years ago. I miss him every day. Merry and Pippin took over his resturant."})
keywordHandler:addKeyword({'merry'}, StdModule.say, {npcHandler = npcHandler, text = "Merry is the cook at the Longbottom Leaf."})
keywordHandler:addKeyword({'pippin'}, StdModule.say, {npcHandler = npcHandler, text = "Pippin sells the food that Merry makes at the Longbottom Leaf."})
keywordHandler:addKeyword({'leo'}, StdModule.say, {npcHandler = npcHandler, text = "He advices newcomers to buy at my store. I love that guy!"})
keywordHandler:addKeyword({'wayland'}, StdModule.say, {npcHandler = npcHandler, text = "Strong as an ox, could armwrestle a minotaur, I bet."})
keywordHandler:addKeyword({'faustus'}, StdModule.say, {npcHandler = npcHandler, text = "He just opened up a new magic shop here in Thais with his wife, Circe."})
keywordHandler:addKeyword({'circe'}, StdModule.say, {npcHandler = npcHandler, text = "Circe is in charge of the wands and rods over at the magic shop. Faustus, her husband, sells potions, runes and spellbooks."})


npcHandler:setMessage(MESSAGE_GREET, "Oh, please come in, |PLAYERNAME|. What do you need?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
