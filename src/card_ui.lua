---CARD UI

---Creates UI for a monsters type information
---@param card Card
---@return table
JoyousSpring.get_type_ui = function(card)
    local joyous_spring_table = card and card.ability and card.ability.extra.joyous_spring or {}

    if joyous_spring_table.is_field_spell then
        return {
            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = { localize("k_joy_fieldspell") },
                        colours = { G.C.JOY.SPELL },
                        bump = true,
                        silent = true,
                        pop_in = 0,
                        pop_in_rate = 4,
                        maxw = 5,
                        shadow = true,
                        y_offset = 0,
                        spacing = math.max(0, 0.32 * (17 - #localize("k_joy_fieldspell"))),
                        scale = (0.4 - 0.004 * #localize("k_joy_fieldspell"))
                    })
                }
            }
        }
    end

    local attribute_text = localize("k_joy_" .. (joyous_spring_table.attribute or "LIGHT"))
    local type_text = localize("k_joy_" .. (joyous_spring_table.monster_type or "Beast"))
    local summon_type_text = joyous_spring_table.summon_type and joyous_spring_table.summon_type ~= "NORMAL" and
        localize("k_joy_" .. joyous_spring_table.summon_type) or nil
    local pendulum_text = joyous_spring_table.is_pendulum and localize("k_joy_pendulum") or nil
    local tuner_text = joyous_spring_table.is_tuner and localize("k_joy_tuner") or nil
    local effect_text = joyous_spring_table.is_effect and localize("k_joy_effect") or localize("k_joy_normal")
    local trap_text = joyous_spring_table.is_trap and localize("k_joy_trap") or nil
    local full_text = attribute_text ..
        "/" .. type_text .. "/" .. (summon_type_text or "") .. (summon_type_text and "/" or "") ..
        (pendulum_text or "") .. (pendulum_text and "/" or "") ..
        (tuner_text or "") .. (tuner_text and "/" or "") ..
        effect_text .. (trap_text and "/" or "") ..
        (trap_text or "")

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
                    colours = { G.C.JOY[joyous_spring_table.summon_type] or G.C.JOY.FUSION },
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
    local trap
    if trap_text then
        trap = {
            n = G.UIT.O,
            config = {
                object = DynaText({
                    string = { trap_text },
                    colours = { G.C.JOY.TRAP },
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
        effect,
        trap and separator or nil,
        trap
    }
end

---Generates Joker's description UI. This is done to:
---* Add type information under names
---* Add summoning conditions to info_queue automatically
---* Change Token's name
---* Remove color codes from info_queue tooltip names
---@param self table
---@param info_queue table
---@param card Card
---@param desc_nodes table
---@param specific_vars table
---@param full_UI_table table
JoyousSpring.generate_info_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    -- Change Token's name
    if card and card.config.center.key == "j_joy_token" then
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.joyous_spring.token_name or "j_joy_token", nodes = {} }
    end

    SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)

    if desc_nodes ~= full_UI_table.main then
        -- Remove color codes from info_queue tooltip names
        if string.len(desc_nodes.name) > 2 and string.sub(desc_nodes.name, string.len(desc_nodes.name) - 1, string.len(desc_nodes.name)) == "{}" then
            desc_nodes.name = string.sub(desc_nodes.name, 1, string.len(desc_nodes.name) - 2)
        end
        if string.sub(desc_nodes.name, 1, 3) == "{C:" then
            local _, _, _, real_name = string.find(desc_nodes.name, "{C:(.*)}(.*)")
            desc_nodes.name = real_name
        end
    else
        -- Add type information under names
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
        -- Add summoning conditions to info_queue automatically
        if G.localization.descriptions[self.set][self.key].joy_summon_conditions then
            full_UI_table.info[#full_UI_table.info + 1] = {}
            local summon_desc_nodes = full_UI_table.info[#full_UI_table.info]
            summon_desc_nodes.name = localize('k_joy_summon_conditions')
            localize { type = "joy_summon_conditions", set = self.set, key = self.key, nodes = summon_desc_nodes }
        end
    end
end

---Adds YGO's back to cards
---@param self table|SMODS.Center
---@param card Card
---@param front table
JoyousSpring.set_back_sprite = function(self, card, front)
    if card.children.back then card.children.back:remove() end
    card.children.back = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["joy_Back"], { x = 0, y = 0 })
    card.children.back.states.hover = card.states.hover
    card.children.back.states.click = card.states.click
    card.children.back.states.drag = card.states.drag
    card.children.back.states.collide.can = false
    card.children.back:set_role({ major = card, role_type = 'Glued', draw_major = card })
end

---Creates counter UI for Xyz materials
---@param card Card
---@return UIBox
JoyousSpring.create_UIBox_xyz_materials = function(card)
    return UIBox {
        definition = {
            n = G.UIT.ROOT,
            config = {
                minh = 0.6,
                maxh = 1.2,
                minw = 0.6,
                maxw = 2,
                r = 0.001,
                padding = 0.1,
                align = 'cm',
                colour = adjust_alpha(darken(G.C.BLACK, 0.2), 0.8),
                shadow = false,
                ref_table = card
            },
            nodes = {
                {
                    n = G.UIT.R, -- node type
                    config = {
                        align = 'cm',
                        colour = G.C.CLEAR
                    },
                    nodes = {
                        {
                            n = G.UIT.T, -- node type
                            config = {
                                text = 'X',
                                scale = 0.45,
                                colour = G.C.JOY.TRAP
                            },
                        },
                        {
                            n = G.UIT.T, -- node type
                            config = {
                                ref_table = card.ability.extra.joyous_spring,
                                ref_value = "xyz_materials",
                                scale = 0.45,
                                colour = G.C.UI.TEXT_LIGHT
                            }
                        }
                    }
                },
            }
        },
        config = {
            align = "tri",
            bond = 'Strong',
            parent = card,
        },
        states = {
            collide = { can = false },
            drag = { can = true }
        }
    }
end
