local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)

local condition = Condition(CONDITION_CURSED)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)

local ticks = 3 -- Enter the amount of seconds between each damage tick
local repeats = 10 -- Enter the amount of times you want this damage to repeat

function onCastSpell(creature, var)
    local damage = 8
    condition:addDamage(repeats, ticks * 1000, -damage)
    combat:setCondition(condition)
    return combat:execute(creature, var)
end
