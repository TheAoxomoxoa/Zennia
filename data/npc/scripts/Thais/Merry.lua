local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

-- Basic
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Pippin and I are the proud owners of Longbottom Leaf. We took over after Frodo retired years ago."})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, text = "Frodo has been long gone from Thais, sadly. He's retired somewhere far away..."})
keywordHandler:addKeyword({'pippin'}, StdModule.say, {npcHandler = npcHandler, text = "Pippin is my best friend. We've been through some tough times together...But we have always had a love for food!"})


npcHandler:setMessage(MESSAGE_GREET, "Welcome to Longbottom Leaf! Pippin is the waiter around here. If you need food, ask him!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Goodbye!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "No manners, how rude.")

npcHandler:addModule(FocusModule:new())
