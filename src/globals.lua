--- GLOBALS

G.C.JOY = {
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

local SMODS_calculate_context_ref = SMODS.calculate_context
function SMODS.calculate_context(context, return_table)
    if context.remove_playing_cards then
        G.GAME.joy_cards_destroyed = G.GAME.joy_cards_destroyed and
            (G.GAME.joy_cards_destroyed + #context.removed) or #context.removed
    end
    SMODS_calculate_context_ref(context, return_table)
end

JoyousSpring.get_type_ui = function(card)
    local joyous_spring_table = card and card.ability and card.ability.extra.joyous_spring or {}
    local attribute_text = localize("k_joy_".. (joyous_spring_table.attribute or "LIGHT"))
    local type_text = localize("k_joy_".. (joyous_spring_table.monster_type or "Beast"))
    local summon_type_text = joyous_spring_table.summon_type and joyous_spring_table.summon_type ~= "NORMAL" and
    localize("k_joy_".. joyous_spring_table.summon_type) or nil
    local pendulum_text = joyous_spring_table.is_pendulum and localize("k_joy_pendulum") or nil
    local tuner_text = joyous_spring_table.is_tuner and localize("k_joy_tuner") or nil
    local effect_text = joyous_spring_table.is_effect and localize("k_joy_effect") or localize("k_joy_normal")
    local full_text = attribute_text.. "/".. type_text .. "/" .. (summon_type_text or "") .. (summon_type_text and "/" or "") ..
        (pendulum_text or "") .. (pendulum_text and "/" or "") ..
        (tuner_text or "") .. (tuner_text and "/" or "") ..
        effect_text

    local attribute = {
        n = G.UIT.O,
        config = {
            object = DynaText({
                string = { attribute_text },
                colours = { G.C.JOY[attribute_text] },
                bump = true,
                silent = true,
                pop_in = 0,
                pop_in_rate = 4,
                maxw = 5,
                shadow = true,
                y_offset = 0,
                spacing = math.max(0, 0.32 * (17 - #full_text)),
                scale = (0.4 - 0.004 * #full_text)
            })
        }
    }
    local type = {
        n = G.UIT.O,
        config = {
            object = DynaText({
                string = { type_text },
                colours = { G.C.JOY.NORMAL },
                bump = true,
                silent = true,
                pop_in = 0,
                pop_in_rate = 4,
                maxw = 5,
                shadow = true,
                y_offset = 0,
                spacing = math.max(0, 0.32 * (17 - #full_text)),
                scale = (0.4 - 0.004 * #full_text)
            })
        }
    }
    local summon_type
    if summon_type_text then
        summon_type = {
            n = G.UIT.O,
            config = {
                object = DynaText({
                    string = { summon_type_text },
                    colours = { G.C.JOY[summon_type_text] or G.C.JOY.FUSION },
                    bump = true,
                    silent = true,
                    pop_in = 0,
                    pop_in_rate = 4,
                    maxw = 5,
                    shadow = true,
                    y_offset = 0,
                    spacing = math.max(0, 0.32 * (17 - #full_text)),
                    scale = (0.4 - 0.004 * #full_text)
                })
            }
        }
    end
    local pendulum
    if joyous_spring_table.is_pendulum then
        pendulum = {
            n = G.UIT.O,
            config = {
                object = DynaText({
                    string = { pendulum_text },
                    colours = { G.C.JOY.SPELL },
                    bump = true,
                    silent = true,
                    pop_in = 0,
                    pop_in_rate = 4,
                    maxw = 5,
                    shadow = true,
                    y_offset = 0,
                    spacing = math.max(0, 0.32 * (17 - #full_text)),
                    scale = (0.4 - 0.004 * #full_text)
                })
            }
        }
    end
    local tuner
    if tuner_text then
        tuner = {
            n = G.UIT.O,
            config = {
                object = DynaText({
                    string = { tuner_text },
                    colours = { G.C.JOY.SYNCHRO },
                    bump = true,
                    silent = true,
                    pop_in = 0,
                    pop_in_rate = 4,
                    maxw = 5,
                    shadow = true,
                    y_offset = 0,
                    spacing = math.max(0, 0.32 * (17 - #full_text)),
                    scale = (0.4 - 0.004 * #full_text)
                })
            }
        }
    end
    local effect = {
        n = G.UIT.O,
        config = {
            object = DynaText({
                string = { effect_text },
                colours = { joyous_spring_table.is_effect and G.C.JOY.EFFECT or G.C.JOY.NORMAL },
                bump = true,
                silent = true,
                pop_in = 0,
                pop_in_rate = 4,
                maxw = 5,
                shadow = true,
                y_offset = 0,
                spacing = math.max(0, 0.32 * (17 - #full_text)),
                scale = (0.4 - 0.004 * #full_text)
            })
        }
    }
    local separator = {
        n = G.UIT.T,
        config = {
            text = "/",
            colour = G.C.UI.TEXT_LIGHT,
            scale = (0.4 - 0.004 * #full_text)
        }
    }
    return {
        attribute,
        separator,
        type,
        separator,
        summon_type,
        summon_type and separator or nil,
        pendulum,
        pendulum and separator or nil,
        tuner,
        tuner and separator or nil,
        effect
    }
end

---This removes the colour markup on the Joker names on the info tooltips and adds summoning conditions
JoyousSpring.generate_info_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    if card and card.config.center.key == "j_joy_token" then
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.joyous_spring.token_name or "j_joy_token", nodes = {} }
    end

    SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)

    if desc_nodes ~= full_UI_table.main then
        if string.len(desc_nodes.name) > 2 and string.sub(desc_nodes.name, string.len(desc_nodes.name) - 1, string.len(desc_nodes.name)) == "{}" then
            desc_nodes.name = string.sub(desc_nodes.name, 1, string.len(desc_nodes.name) - 2)
        end
        if string.sub(desc_nodes.name, 1, 3) == "{C:" then
            local _, _, _, real_name = string.find(desc_nodes.name, "{C:(.*)}(.*)")
            desc_nodes.name = real_name
        end
    else
        full_UI_table.name = {
            {
                n = G.UIT.C,
                config = { align = "cm", padding = 0.05 },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = { align = "cm" },
                        nodes = full_UI_table.name
                    },
                    {
                        n = G.UIT.R,
                        config = { align = "cm" },
                        nodes = JoyousSpring.get_type_ui(card)
                    },
                }
            }
        }
        if G.localization.descriptions[self.set][self.key].joy_summon_conditions then
            full_UI_table.info[#full_UI_table.info + 1] = {}
            local summon_desc_nodes = full_UI_table.info[#full_UI_table.info]
            summon_desc_nodes.name = localize('k_joy_summon_conditions')
            localize { type = "joy_summon_conditions", set = self.set, key = self.key, nodes = summon_desc_nodes }
        end
    end
end

-- This fixes the colours on the Joker names on the info tooltips but it looks ugly so I will revisit it in the future

-- local info_tip_from_rows_ref = info_tip_from_rows
-- function info_tip_from_rows(desc_nodes, name)
--     local ret = info_tip_from_rows_ref(desc_nodes, name)
--     if ret then
--         local name_node_config = ret.nodes[1].nodes[1].config
--         if string.len(name_node_config.text) > 2 and string.sub(name_node_config.text, string.len(name_node_config.text) - 1, string.len(name_node_config.text)) == "{}" then
--             name_node_config.text = string.sub(name_node_config.text, 1, string.len(name_node_config.text) - 2)
--         end
--         if string.sub(name_node_config.text, 1, 3) == "{C:" then
--             local _, _, colour, real_name = string.find(name_node_config.text, "{C:(.*)}(.*)")
--             name_node_config.text = real_name or name_node_config.text
--             name_node_config.colour = G.ARGS.LOC_COLOURS[colour] or G.C.UI.TEXT_LIGHT
--             if colour then
--                 name_node_config.shadow = true
--             end
--         end
--     end
--     return ret
-- end
