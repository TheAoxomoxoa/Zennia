local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

local condition = Condition(CONDITION_ENERGY)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)

local ticks = 3 -- Enter the amount of seconds between each damage tick
local repeats = 10 -- Enter the amount of times you want this damage to repeat

function onCastSpell(creature, var)
    local damage = 8
    condition:addDamage(repeats, ticks * 1000, -damage)
    combat:setCondition(condition)
    return combat:execute(creature, var)
end
