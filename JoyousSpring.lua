JoyousSpring = {}
JoyousSpring.debug = false
JoyousSpring.debug_shop_cards = { { key = "j_joy_dogma_knight" } }

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

JoyousSpring.config = SMODS.current_mod.config

assert(SMODS.load_file("src/utils.lua"))()
assert(SMODS.load_file("src/mod_info.lua"))()
assert(SMODS.load_file("src/globals.lua"))()
assert(SMODS.load_file("src/zones.lua"))()
assert(SMODS.load_file("src/monsters.lua"))()

-- Jokers

local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers")
for _, file in ipairs(joker_src) do
    sendInfoMessage("Loading " .. file, "JoyousSpring")
    assert(SMODS.load_file("src/jokers/" .. file))()
end

-- Others

local others_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/others")
for _, file in ipairs(others_src) do
    sendInfoMessage("Loading " .. file, "JoyousSpring")
    assert(SMODS.load_file("src/others/" .. file))()
end
