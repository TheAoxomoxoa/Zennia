local outfits = {

-- Config
	dollID = 26396, -- Change this to your dolls or items, item ID

	-- Main Window Messages (The first window the player sees)
	mainTitle = "Choose an Addon Set:",
	mainMsg = "You will recieve both addons for the selected outfit.",

	-- Already Owned Window (The window that appears when the player already owns the addon)
	ownedTitle = "Error: Set already owned.",
	ownedMsg = "You already have this addon set. Please choose one that you do not own.",

	-- No Doll in Backpack (The window that appears when the player doesnt have the doll in their backpack)
	dollTitle = "Error: Tome not found.",
	dollMsg = "The addon tome must be in your backpack.",
-- End Config
	-- Outfit Table
	[1] = {name = "Citizen", male = 128, female = 136},
	[2] = {name = "Hunter", male = 129, female = 137},
	[3] = {name = "Mage", male = 130, female = 138},
	[4] = {name = "Knight", male = 131, female = 139},
	[5] = {name = "Noble", male = 132, female = 140},
	[6] = {name = "Summoner", male = 133, female = 141},
	[7] = {name = "Warrior", male = 134, female = 142},
	[8] = {name = "Barbarian", male = 143, female = 147},
	[9] = {name = "Druid", male = 144, female = 148},
	[10] = {name = "Wizard", male = 145, female = 149},
	[11] = {name = "Oriental", male = 146, female = 150},
}

function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    player:sendAddonWindow(outfits)
    return true
end
