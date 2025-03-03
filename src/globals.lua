--- GLOBALS

G.C.JOY = {
    MOD = HEX("F4A6C7"),
    NORMAL = HEX("FDDD5D"),
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

local localize_ref = localize
function localize(args, misc_cat)
    if args and not (type(args) == 'table') then
        return localize_ref(args, misc_cat)
    end

    local loc_target = nil
    if args.type == 'joy_summon_conditions' then
        loc_target = G.localization.descriptions[(args.set or args.node.config.center.set)]
            [args.key or args.node.config.center.key]

        if loc_target then
            for _, lines in ipairs(loc_target.joy_summon_conditions_parsed) do
                local final_line = {}
                for _, part in ipairs(lines) do
                    local assembled_string = ''
                    for _, subpart in ipairs(part.strings) do
                        assembled_string = assembled_string ..
                            (type(subpart) == 'string' and subpart or format_ui_value(args.vars[tonumber(subpart[1])]) or 'ERROR')
                    end
                    local desc_scale = G.LANG.font.DESCSCALE
                    if G.F_MOBILE_UI then desc_scale = desc_scale * 1.5 end
                    if part.control.E then
                        local _float, _silent, _pop_in, _bump, _spacing = nil, true, nil, nil, nil
                        if part.control.E == '1' then
                            _float = true; _silent = true; _pop_in = 0
                        elseif part.control.E == '2' then
                            _bump = true; _spacing = 1
                        end
                        final_line[#final_line + 1] = {
                            n = G.UIT.O,
                            config = {
                                object = DynaText({
                                    string = { assembled_string },
                                    colours = { part.control.V and args.vars.colours[tonumber(part.control.V)] or loc_colour(part.control.C or nil) },
                                    float = _float,
                                    silent = _silent,
                                    pop_in = _pop_in,
                                    bump = _bump,
                                    spacing = _spacing,
                                    scale = 0.32 * (part.control.s and tonumber(part.control.s) or args.scale or 1) *
                                        desc_scale
                                })
                            }
                        }
                    elseif part.control.X then
                        final_line[#final_line + 1] = {
                            n = G.UIT.C,
                            config = { align = "m", colour = loc_colour(part.control.X), r = 0.05, padding = 0.03, res = 0.15 },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = assembled_string,
                                        colour = loc_colour(part.control.C or nil),
                                        scale = 0.32 * (part.control.s and tonumber(part.control.s) or args.scale or 1) *
                                            desc_scale
                                    }
                                },
                            }
                        }
                    else
                        final_line[#final_line + 1] = {
                            n = G.UIT.T,
                            config = {
                                detailed_tooltip = part.control.T and
                                    (G.P_CENTERS[part.control.T] or G.P_TAGS[part.control.T]) or nil,
                                text = assembled_string,
                                shadow = args.shadow,
                                colour = part.control.V and args.vars.colours[tonumber(part.control.V)] or
                                    not part.control.C and args.text_colour or
                                    loc_colour(part.control.C or nil, args.default_col),
                                scale = 0.32 * (part.control.s and tonumber(part.control.s) or args.scale or 1) *
                                    desc_scale
                            },
                        }
                    end
                end
                args.nodes[#args.nodes + 1] = final_line
            end
        end
    else
        return localize_ref(args, misc_cat)
    end
end

local init_localization_ref = init_localization
function init_localization()
    init_localization_ref()

    for _, center in pairs(G.localization.descriptions.Joker) do
        if center.joy_summon_conditions then
            center.joy_summon_conditions_parsed = {}
            for _, line in ipairs(center.joy_summon_conditions) do
                center.joy_summon_conditions_parsed[#center.joy_summon_conditions_parsed + 1] = loc_parse_string(line)
            end
        end
    end
end

-- Prevent other cards from spawning if the Only YGO Cards conffig is enabled
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
    if not JoyousSpring.lists then
        JoyousSpring.lists = {}
        JoyousSpring.lists.main_deck = {}
        JoyousSpring.lists.extra_deck = {}
        JoyousSpring.lists.legendary = {}
        JoyousSpring.lists.rare = {}
        JoyousSpring.lists.uncommon = {}
        JoyousSpring.lists.common = {}
        for k, v in pairs(G.P_CENTERS) do
            if string.sub(k, 1, 6) == "j_joy_" then
                local monster_card_properties = v.config.extra.joyous_spring
                if monster_card_properties.is_main_deck then
                    table.insert(JoyousSpring.lists.main_deck, k)
                else
                    table.insert(JoyousSpring.lists.extra_deck, k)
                end
                if v.rarity == 4 then
                    table.insert(JoyousSpring.lists.legendary, k)
                elseif v.rarity == 3 then
                    table.insert(JoyousSpring.lists.rare, k)
                elseif v.rarity == 2 then
                    table.insert(JoyousSpring.lists.uncommon, k)
                else
                    table.insert(JoyousSpring.lists.common, k)
                end
            end
        end
    end

    game_start_run_ref(self, args)

    self.GAME.joy_create_card = JoyousSpring.debug and JoyousSpring.debug_shop_cards or self.GAME.joy_create_card or {}
    JoyousSpring.cards_to_create = self.GAME.joy_create_card
end
