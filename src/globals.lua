--- GLOBALS

G.C.JOY = {
    MOD = HEX("F4A6C7"),
    NORMAL = darken(HEX("FDDD5D"), 0.1),
    EFFECT = HEX("FF8B53"),
    SPELL = HEX("1D9E74"),
    PENDULUM = HEX("1D9E74"),
    TRAP = HEX("BC5A84"),
    RITUAL = HEX("9DB5CC"),
    FUSION = HEX("A086B7"),
    SYNCHRO = HEX("CCCCCC"),
    XYZ = HEX("717070"),
    LINK = HEX("006EAD"),
    TOKEN = HEX("828E85"),
    LIGHT = HEX("DBBB51"),
    DARK = lighten(HEX("785BA2"), 0.2),
    WATER = HEX("21BBE4"),
    FIRE = HEX("FD0404"),
    EARTH = lighten(HEX("747447"), 0.2),
    WIND = HEX("8CC56E"),
    DIVINE = HEX("836A3C"),
}

-- Hooks

local loc_colour_ref = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        loc_colour_ref()
    end
    G.ARGS.LOC_COLOURS.joy_mod = G.C.JOY.MOD
    G.ARGS.LOC_COLOURS.joy_normal = G.C.JOY.NORMAL
    G.ARGS.LOC_COLOURS.joy_effect = G.C.JOY.EFFECT
    G.ARGS.LOC_COLOURS.joy_spell = G.C.JOY.SPELL
    G.ARGS.LOC_COLOURS.joy_pendulum = G.C.JOY.PENDULUM
    G.ARGS.LOC_COLOURS.joy_trap = G.C.JOY.TRAP
    G.ARGS.LOC_COLOURS.joy_ritual = G.C.JOY.RITUAL
    G.ARGS.LOC_COLOURS.joy_fusion = G.C.JOY.FUSION
    G.ARGS.LOC_COLOURS.joy_synchro = G.C.JOY.SYNCHRO
    G.ARGS.LOC_COLOURS.joy_xyz = G.C.JOY.XYZ
    G.ARGS.LOC_COLOURS.joy_link = G.C.JOY.LINK
    G.ARGS.LOC_COLOURS.joy_token = G.C.JOY.TOKEN
    G.ARGS.LOC_COLOURS.joy_light = G.C.JOY.LIGHT
    G.ARGS.LOC_COLOURS.joy_dark = G.C.JOY.DARK
    G.ARGS.LOC_COLOURS.joy_water = G.C.JOY.WATER
    G.ARGS.LOC_COLOURS.joy_fire = G.C.JOY.FIRE
    G.ARGS.LOC_COLOURS.joy_earth = G.C.JOY.EARTH
    G.ARGS.LOC_COLOURS.joy_wind = G.C.JOY.WIND
    G.ARGS.LOC_COLOURS.joy_divine = G.C.JOY.DIVINE

    return loc_colour_ref(_c, _default)
end

-- Prevent other cards from spawning if the Only YGO Cards config is enabled
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

local game_start_run_ref = Game.start_run
function Game:start_run(args)
    game_start_run_ref(self, args)

    self.GAME.joy_create_card = JoyousSpring.debug and JoyousSpring.debug_shop_cards or self.GAME.joy_create_card or {}
    JoyousSpring.cards_to_create = self.GAME.joy_create_card
end
