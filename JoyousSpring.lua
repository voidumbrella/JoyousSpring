JoyousSpring = {}
JoyousSpring.debug = false
JoyousSpring.dev_content = false
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
assert(SMODS.load_file("src/general_ui.lua"))()
assert(SMODS.load_file("src/card_ui.lua"))()
assert(SMODS.load_file("src/extra_deck.lua"))()
assert(SMODS.load_file("src/graveyard.lua"))()
assert(SMODS.load_file("src/banishment.lua"))()
assert(SMODS.load_file("src/pendulum.lua"))()
assert(SMODS.load_file("src/summon.lua"))()
assert(SMODS.load_file("src/monsters.lua"))()
assert(SMODS.load_file("src/effects.lua"))()

-- Jokers

local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers")
for _, file in ipairs(joker_src) do
    if JoyousSpring.dev_content or (tonumber(file:sub(1, 2)) <= 10) or (tonumber(file:sub(1, 2)) == 99) then
        sendInfoMessage("Loading " .. file, "JoyousSpring")
        assert(SMODS.load_file("src/jokers/" .. file))()
    end
end

-- Others

local others_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/others")
for _, file in ipairs(others_src) do
    sendInfoMessage("Loading " .. file, "JoyousSpring")
    assert(SMODS.load_file("src/others/" .. file))()
end
