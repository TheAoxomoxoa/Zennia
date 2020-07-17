local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local vocation = {}
local town = {}
local destination = {}

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local function greetCallback(cid)
	local player = Player(cid)
	local level = player:getLevel()
	if level < 8 then
		npcHandler:say("You can't leave the island just yet, Avalonian. Come back to me when you are better prepared.", cid)
		return false
	elseif level > 9 then
		npcHandler:say(player:getName() .. ", you've made your choice to stay here. You can't leave now.", cid)
		return false
	elseif player:getVocation():getId() > 0 then
		npcHandler:say("It seems you already have a vocation.", cid)
		return false
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if msgcontains(msg, "yes") and npcHandler.topic[cid] == 0 then
		npcHandler:say("Lets see... We can take you to {Thais}. Where would you like go?", cid)
		npcHandler.topic[cid] = 1
	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, "thais") then
			town[cid] = 2
			destination[cid] = Position(497, 753, 7)
			npcHandler:say("Interesting... The oldest city in the world. Very well, and as for your vocation, would you like to be a {Knight}, {Paladin}, {Sorcerer}, or {Druid}?", cid)
			npcHandler.topic[cid] = 2
		else
			npcHandler:say("Lets see... We can take you to {Thais}. Where would you like go?", cid)
		end
	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, "sorcerer") then
			npcHandler:say("You shall be a wise sorcerer, citizen. Before we send you off, are you sure you've made the right decision? There is no going back.", cid)
			npcHandler.topic[cid] = 3
			vocation[cid] = 1
		elseif msgcontains(msg, "druid") then
			npcHandler:say("A druid, you must be a true child of nature. Before we send you off, are you sure you've made the right decision? There is no going back.", cid)
			npcHandler.topic[cid] = 3
			vocation[cid] = 2
		elseif msgcontains(msg, "paladin") then
			npcHandler:say("There's no better paladin in all of Avalon than you, citizen. Before we send you off, are you sure you've made the right decision? There is no going back.", cid)
			npcHandler.topic[cid] = 3
			vocation[cid] = 3
		elseif msgcontains(msg, "knight") then
			npcHandler:say("May your blades never dull, knight. Before we send you off, are you sure you've made the right decision? There is no going back.", cid)
			npcHandler.topic[cid] = 3
			vocation[cid] = 4
		else
			npcHandler:say("That is not a vocation, citizen. You can be a {Knight}, {Paladin}, {Sorcerer}, or {Druid}. Which will it be?", cid)
		end
	elseif npcHandler.topic[cid] == 3 then
		if msgcontains(msg, "yes") then
			local player = Player(cid)
			npcHandler:say("Very well. I wish you the best of luck.", cid)
			player:setVocation(Vocation(vocation[cid]))
			player:setTown(Town(town[cid]))

			local destination = destination[cid]
			npcHandler:releaseFocus(cid)
			player:teleportTo(destination)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
		else
			npcHandler:say("No? Very well, would you like to be a {Knight}, {Paladin}, {Sorcerer}, OR {Druid}?", cid)
			npcHandler.topic[cid] = 2
		end
	end
	return true
end

local function onAddFocus(cid)
	town[cid] = 0
	vocation[cid] = 0
	destination[cid] = 0
end

local function onReleaseFocus(cid)
	town[cid] = nil
	vocation[cid] = nil
	destination[cid] = nil
end

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
