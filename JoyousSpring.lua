SMODS.Atlas({
    key = "modicon",
    path = "icon.png",
    px = 32,
    py = 32
})

SMODS.Atlas({
    key = "joy_Back",
    path = "back.png",
    px = 142,
    py = 190
})

JoyousSpring = {}
JoyousSpring.debug = true

SMODS.load_file("src/utils.lua")()
SMODS.load_file("src/globals.lua")()
SMODS.load_file("src/zones_ui.lua")()
SMODS.load_file("src/monsters.lua")()

-- Jokers
local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers")
for _, file in ipairs(joker_src) do
    sendInfoMessage("JoyousSpring loading " .. file)
    SMODS.load_file("src/jokers/" .. file)()
end
