function onAdvance(cid, skill, oldlevel, newlevel)

        if(getPlayerStorageValue(cid, 99963) ~= 1 and skill == SKILL__LEVEL and newlevel >= 8) then
                doPlayerSendTextMessage(cid, 22, "Congratulations, you've reached level 8! You can now leave Avalon and continue your adventure by speaking to Governor Avalonius III in his office in northern Avalon. Beware that you can also now lose items, experience and skills when you die. Good luck!")
                end
        return TRUE
end
