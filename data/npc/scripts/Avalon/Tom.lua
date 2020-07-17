local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}


function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()                      npcHandler:onThink() 						end


function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

if msgcontains(msg,'job') then
selfSay('I\'m the local tanner. I buy fresh animal corpses, tan them, and convert them into fine leather which I then sell to {merchants}.', cid)

elseif msgcontains(msg,'merchant') then
selfSay('{Edwin} uses my leather for his weapon hilts and bindings. {Anna} uses my leather for her armor in their shops.', cid)

elseif msgcontains(msg,'merchants') then
selfSay('{Edwin} uses my leather for his weapon hilts and bindings. {Anna} uses my leather for her armor in their shops.', cid)

elseif msgcontains(msg,'Anna') then
selfSay('Anna makes the finest armor in all of Avalon. She is located just south of here.', cid)

elseif msgcontains(msg,'Edwin') then
selfSay('Edwin is our weapon master here in Avalon. He has been a customer of mine for decades.', cid)

elseif msgcontains(msg,'trade') then
selfSay('Sure, I am always looking to buy corpses or minotaur leather.', cid)

npcHandler:releaseFocus(cid)

end
return TRUE
end

function thinkCallback()
talk = math.random(1,200)
	if talk == 1 then
		doCreatureSay(getNpcCid(), "I'm buying minotaur leather! Over here!", TALKTYPE_YELL)
	elseif talk == 2 then
		doCreatureSay(getNpcCid(), "Buying fresh corpses of rats, rabbits and wolves!", TALKTYPE_YELL)
	end
return TRUE
end

npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
