local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

-- Basic
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am Wayland, the blacksmith here in Thais. I craft armors and weapons for its citizens."})
keywordHandler:addKeyword({'asd'}, StdModule.say, {npcHandler = npcHandler, text = "asd"})
keywordHandler:addKeyword({'zxc'}, StdModule.say, {npcHandler = npcHandler, text = "zxc"})


npcHandler:setMessage(MESSAGE_GREET, "Welcome to my shop. Are you looking to {trade} some of your hard earned gold for my fabulous weapons or armor?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Goodbye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Jeeze. What a rude person.")

function thinkCallback()
talk = math.random(1,200)
	if talk == 1 then
		doCreatureSay(getNpcCid(), "Buying and selling armors and weapons! Come and visit my shop, Wayland's Smithery, right by the Longbottom Leaf!", TALKTYPE_YELL)
	elseif talk == 2 then
		doCreatureSay(getNpcCid(), "Are you wanting to upgrade that terrible weapon of yours? Come by Wayland's Smithery!", TALKTYPE_YELL)
	end
return TRUE
end

npcHandler:addModule(FocusModule:new())
