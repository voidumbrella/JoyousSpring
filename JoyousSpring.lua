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

-- temp patch
local get_current_pool_ref = get_current_pool
function get_current_pool(_type, _rarity, _legendary, _append)
    local _pool, _pool_key = get_current_pool_ref(_type, _rarity, _legendary, _append)
    local new_pool

    if _type == 'Joker' and JoyousSpring.config.only_ygo_cards then
        new_pool = {}
        for _, key in ipairs(_pool) do
            if key:sub(1, 5) == "j_joy" then
                table.insert(new_pool, key)
            end
        end
        if #new_pool == 0 then
            table.insert(new_pool, "j_joker")
        end
        return new_pool, _pool_key
    end
    return _pool, _pool_key
end