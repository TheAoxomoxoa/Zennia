function onStepIn(cid, item, position, fromPosition)
    if(item.actionid > 30020 and item.actionid < 30100) then
        local townId = (item.actionid - 30020)
        doPlayerSetTown(cid, townId)
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The city of " .. getTownName(townId) .. " is your new home." .. "\nRemember to mark the " .. getTownName(townId) .. " temple on your minimap to easily find it again.")

    end

    return true
end
