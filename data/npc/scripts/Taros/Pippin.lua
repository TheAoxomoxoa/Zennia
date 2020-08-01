local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

-- Basic
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Merry and I are the proud owners of the Longbottom Leaf. We took over after Frodo retired years ago."})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, text = "Frodo has been long gone from Thais, sadly. He's retired somewhere far away..."})
keywordHandler:addKeyword({'merry'}, StdModule.say, {npcHandler = npcHandler, text = "Merry is my best friend. We've been through some tough times together...But we have always had a love for food!"})


npcHandler:setMessage(MESSAGE_GREET, "Welcome to Longbottom Leaf! The finest resturant in all of Thais! How can I help you today?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Please come back from time to time.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Please come back from time to time.")

function thinkCallback()
talk = math.random(1,200)
	if talk == 1 then
		doCreatureSay(getNpcCid(), "Come over to the Longbottom Leaf for the best food in all of Thais!", TALKTYPE_YELL)
	elseif talk == 2 then
		doCreatureSay(getNpcCid(), "Now serving second breakfast!!", TALKTYPE_YELL)
	end
return TRUE
end

npcHandler:addModule(FocusModule:new())
