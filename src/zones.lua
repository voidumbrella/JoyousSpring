JoyousSpring.add_to_extra_deck = function(card, args)
    local args = args or {}
    if type(card) == "string" then
        card = SMODS.create_card({
            area = JoyousSpring.extra_deck_area,
            key = card,
            no_edition = args.no_edition or false,
            skip_materialize = true,
        })
    end
    if card.edition and card.edition.card_limit then
        JoyousSpring.extra_deck_area.config.card_limit = JoyousSpring.extra_deck_area.config.card_limit +
            card.edition.card_limit
    end
    JoyousSpring.extra_deck_area:emplace(card)
end

JoyousSpring.send_to_graveyard = function(card)
    if JoyousSpring.graveyard then
        if type(card) == "string" then
            JoyousSpring.graveyard[card] = (JoyousSpring.graveyard[card] and
                JoyousSpring.graveyard[card] + 1) or 1
        elseif type(card) == "table" then
            JoyousSpring.graveyard[card.config.center_key] = (JoyousSpring.graveyard[card.config.center_key] and
                JoyousSpring.graveyard[card.config.center_key] + 1) or 1
        end
    end
end

JoyousSpring.create_UIBox_extra_deck = function()
    local t = {
        n = G.UIT.ROOT,
        config = { align = 'cm', r = 0.1, colour = G.C.JOY.SPELL },
        nodes = {
            {
                n = G.UIT.O,
                config = {
                    object = JoyousSpring.extra_deck_area
                }
            }
        }
    }
    return t
end

JoyousSpring.open_extra_deck = function(forced, open, delay_close)
    if open and not JoyousSpring.extra_deck_open then
        JoyousSpring.extra_deck_open = true
        JoyousSpring.extra_deck_forced = JoyousSpring.extra_deck_forced or forced and true
        G.E_MANAGER:add_event(Event({
            blockable = false,
            func = function()
                G.jokers.states.visible = false
                G.joy_extra_deck.states.visible = true
                G.joy_extra_deck.alignment.offset.y = 0
                return true
            end
        }))
    elseif not open and (not JoyousSpring.extra_deck_forced or forced) and JoyousSpring.extra_deck_open then
        JoyousSpring.extra_deck_open = false
        JoyousSpring.extra_deck_forced = false
        G.E_MANAGER:add_event(Event({
            blockable = false,
            trigger = "after",
            delay = 0.15 + (delay_close or 0),
            func = function()
                G.joy_extra_deck.alignment.offset.y = -5
                G.jokers.states.visible = true
                G.E_MANAGER:add_event(Event({
                    blockable = false,
                    trigger = "after",
                    delay = 0.15,
                    func = function()
                        G.joy_extra_deck.states.visible = false
                        return true
                    end
                }))
                return true
            end
        }))
    end
end

JoyousSpring.create_UIBox_select_summon_materials = function(card)
    local summon_type = card.ability.extra.joyous_spring.summon_type or "Fusion"

    local colour = G.C.JOY[summon_type] or G.C.JOY.FUSION
    return {
        n = G.UIT.ROOT,
        config = {
            align = "cm",
            minw = G.ROOM.T.w * 5,
            minh = G.ROOM.T.h * 5,
            padding = 0.1,
            r = 0.1,
            colour = { colour[1], colour[2], colour[3], 0.7 }
        },
        nodes = {
            {
                n = G.UIT.R,
                config = {
                    align = "cm",
                    minh = 1,
                    r = 0.3,
                    padding = 0.07,
                    minw = 1,
                    colour = lighten(colour, 0.4),
                    emboss = 0.1
                },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = {
                            align = "cm",
                            minh = 1,
                            r = 0.2,
                            padding = 0.05,
                            minw = 1,
                            colour = G.C.L_BLACK
                        },
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = {
                                    align = "cm",
                                    padding = 0.05,
                                    minw = 7
                                },
                                nodes = {
                                    {
                                        n = G.UIT.O,
                                        config = {
                                            object = DynaText({
                                                string = { "Select Materials" },
                                                colours = { G.C.UI.TEXT_LIGHT },
                                                bump = true,
                                                silent = true,
                                                pop_in = 0,
                                                pop_in_rate = 4,
                                                minw = 10,
                                                shadow = true,
                                                y_offset = -0.6,
                                                scale = 0.8
                                            })
                                        }
                                    }
                                }

                            },
                            {
                                n = G.UIT.R,
                                config = {
                                    align = "cm",
                                    padding = 0.2,
                                    minw = 7
                                },
                                nodes = {
                                    {
                                        n = G.UIT.R,
                                        config = {
                                            r = 0.1,
                                            minw = 7,
                                            minh = 5,
                                            align = "cm",
                                            padding = 1,
                                            colour = G.C.BLACK
                                        },
                                        nodes = {
                                            {
                                                n = G.UIT.R,
                                                config = {
                                                    align = "cm",
                                                    padding = 0.07,
                                                    no_fill = true,
                                                    scale = 1
                                                },
                                                nodes = {
                                                    {
                                                        n = G.UIT.O,
                                                        config = {
                                                            object = JoyousSpring.summon_material_area
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = {
                                    align = "cm",
                                    padding = 0.1,
                                    minw = 7,
                                    colour = G.C.CLEAR,
                                },
                                nodes = {
                                    {
                                        n = G.UIT.C,
                                        config = {
                                            ref_table = card,
                                            align = "cm",
                                            minh = 0.7,
                                            minw = 10,
                                            padding = 0.1,
                                            r = 0.1,
                                            hover = true,
                                            colour = G.C.UI.BACKGROUND_INACTIVE,
                                            button = 'exit_select_material_menu',
                                            shadow = true,
                                            func = 'can_select_material',
                                            focus_args = {
                                                nav = 'wide',
                                                button = 'rightshoulder'
                                            }
                                        },
                                        nodes = {
                                            {
                                                n = G.UIT.R,
                                                config = { align = "cm", padding = 0, no_fill = true },
                                                nodes = {
                                                    {
                                                        n = G.UIT.T,
                                                        config = {
                                                            text = localize('b_joy_summon'),
                                                            scale = 0.5,
                                                            colour = G.C.UI.TEXT_LIGHT,
                                                            shadow = true,
                                                            func = 'set_button_pip',
                                                            focus_args = {
                                                                button = 'rightshoulder'
                                                            }
                                                        }
                                                    }
                                                }
                                            },
                                        }
                                    },
                                    {
                                        n = G.UIT.C,
                                        config = {
                                            align = "cm",
                                            minh = 0.7,
                                            minw = 3,
                                            padding = 0.1,
                                            r = 0.1,
                                            hover = true,
                                            colour = colour,
                                            button = "exit_overlay_menu",
                                            shadow = true,
                                            focus_args = {
                                                nav = 'wide',
                                                button = 'b'
                                            }
                                        },
                                        nodes = {
                                            {
                                                n = G.UIT.R,
                                                config = { align = "cm", padding = 0, no_fill = true },
                                                nodes = {
                                                    {
                                                        n = G.UIT.T,
                                                        config = {
                                                            text = localize('b_back'),
                                                            scale = 0.5,
                                                            colour = G.C.UI.TEXT_LIGHT,
                                                            shadow = true,
                                                            func = 'set_button_pip',
                                                            focus_args = {
                                                                button = 'b'
                                                            }
                                                        }
                                                    }
                                                }
                                            },
                                        }
                                    },
                                }
                            },
                        }
                    },
                }
            },
        }
    }
end

JoyousSpring.create_overlay_select_summon_materials = function(card, card_list)
    local material_combos = JoyousSpring.get_all_summon_material_combos(card, card_list)

    if material_combos then
        local material_list = SMODS.merge_lists(material_combos)

        local highlight_limit = 1
        for _, combo in ipairs(material_combos) do
            highlight_limit = #combo > highlight_limit and #combo or highlight_limit
        end
        JoyousSpring.summon_material_area = CardArea(
            0,
            0,
            G.CARD_W * 4.95,
            G.CARD_H,
            {
                type = 'summon_materials',
                highlight_limit = highlight_limit,
            }
        )

        for _, joker in ipairs(material_list) do
            local added_joker = copy_card(joker)
            JoyousSpring.summon_material_area:emplace(added_joker)
            for i, og_joker in ipairs(G.jokers.cards) do
                if og_joker == joker then
                    added_joker.joy_g_jokers_pos = i
                end
            end
        end

        G.FUNCS.overlay_menu({
            definition = JoyousSpring.create_UIBox_select_summon_materials(card)
        })
    end
end

JoyousSpring.create_overlay_graveyard = function()
    JoyousSpring.graveyard_area = {}
    local num_graveyard_areas = math.min(4, math.floor(#JoyousSpring.graveyard / 25) + 1)
    for i = 1, num_graveyard_areas do
        JoyousSpring.graveyard_area[i] = CardArea(
            G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2,
            G.ROOM.T.h,
            6.5 * G.CARD_W,
            0.6 * G.CARD_H,
            {
                card_limit = (num_graveyard_areas == i and #JoyousSpring.graveyard - 25 * (i - 1)) or 25,
                type = 'title',
                highlight_limit = 0,
                card_w = G.CARD_W * 0.7,
                draw_layers = { 'card' },
            }
        )
        JoyousSpring.graveyard_area[i].monster_h_popup = true
    end

    local i = 0
    for key, count in pairs(JoyousSpring.graveyard) do
        if count > 0 then
            local added_card = SMODS.create_card({
                area = JoyousSpring.graveyard_area[math.min(4, math.floor(i / 25) + 1)],
                key = key,
                no_edition = true,
                skip_materialize = true,
            })
            JoyousSpring.graveyard_area[math.min(4, math.floor(i / 25) + 1)]:emplace(added_card)
            i = i + 1
            -- copied from Cartomancer
            if not added_card.children.stack_display and count > 1 then
                added_card.children.stack_display = UIBox {
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
                            ref_table = added_card
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
                                            text = count,
                                            scale = 0.45,
                                            colour = G.C.UI.TEXT_LIGHT
                                        }
                                    }
                                }
                            },
                        }
                    },
                    config = {
                        align = "tli",
                        bond = 'Strong',
                        parent = added_card,
                    },
                    states = {
                        collide = { can = false },
                        drag = { can = true }
                    }
                }
            end
        end
    end

    G.FUNCS.overlay_menu({
        definition = create_UIBox_generic_options({
            contents = {
                {
                    n = G.UIT.R,
                    config = {
                        align = "cm",
                        padding = 0.05,
                        minw = 7
                    },
                    nodes = {
                        {
                            n = G.UIT.O,
                            config = {
                                object = DynaText({
                                    string = { localize('b_joy_graveyard') },
                                    colours = { G.C.UI.TEXT_LIGHT },
                                    bump = true,
                                    silent = true,
                                    pop_in = 0,
                                    pop_in_rate = 4,
                                    minw = 10,
                                    shadow = true,
                                    y_offset = -0.6,
                                    scale = 0.9
                                })
                            }
                        }
                    }

                },
                {
                    n = G.UIT.R,
                    config = {
                        align = "cm",
                        padding = 0.2,
                        minw = 7
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = {
                                r = 0.1,
                                minw = 7,
                                minh = 5,
                                align = "cm",
                                padding = 1,
                                colour = G.C.BLACK
                            },
                            nodes = {
                                {
                                    n = G.UIT.C,
                                    config = {
                                        align = "cm",
                                        padding = 0.07,
                                        no_fill = true,
                                        scale = 1
                                    },
                                    nodes = {
                                        num_graveyard_areas > 0 and {
                                            n = G.UIT.R,
                                            config = {
                                                align = "cm",
                                                padding = 0.07,
                                                no_fill = true,
                                                scale = 1
                                            },
                                            nodes = {
                                                {
                                                    n = G.UIT.O,
                                                    config = {
                                                        object = JoyousSpring.graveyard_area[1]
                                                    }
                                                },
                                            }
                                        } or nil,
                                        num_graveyard_areas > 1 and {
                                            n = G.UIT.R,
                                            config = {
                                                align = "cm",
                                                padding = 0.07,
                                                no_fill = true,
                                                scale = 1
                                            },
                                            nodes = {
                                                {
                                                    n = G.UIT.O,
                                                    config = {
                                                        object = JoyousSpring.graveyard_area[2]
                                                    }
                                                },
                                            }
                                        } or nil,
                                        num_graveyard_areas > 2 and {
                                            n = G.UIT.R,
                                            config = {
                                                align = "cm",
                                                padding = 0.07,
                                                no_fill = true,
                                                scale = 1
                                            },
                                            nodes = {
                                                {
                                                    n = G.UIT.O,
                                                    config = {
                                                        object = JoyousSpring.graveyard_area[3]
                                                    }
                                                },
                                            }
                                        } or nil,
                                        num_graveyard_areas > 3 and {
                                            n = G.UIT.R,
                                            config = {
                                                align = "cm",
                                                padding = 0.07,
                                                no_fill = true,
                                                scale = 1
                                            },
                                            nodes = {
                                                {
                                                    n = G.UIT.O,
                                                    config = {
                                                        object = JoyousSpring.graveyard_area[4]
                                                    }
                                                },
                                            }
                                        } or nil,
                                    }
                                }
                            }
                        }
                    }
                }
            }
        })
    })
end

G.FUNCS.joy_open_extra_deck = function(e)
    JoyousSpring.open_extra_deck(true, not G.joy_extra_deck.states.visible)
end

G.FUNCS.joy_open_graveyard = function(e)
    JoyousSpring.create_overlay_graveyard()
end

G.FUNCS.joy_perform_summon = function(e)
    local card = e.config.ref_table
    card:highlight(false)
    JoyousSpring.create_overlay_select_summon_materials(card)
end

G.FUNCS.can_select_material = function(e)
    local card = e.config.ref_table

    if card and JoyousSpring.summon_material_area and next(JoyousSpring.summon_material_area.highlighted) then
        local summon_type = card.ability.extra.joyous_spring.summon_type or "Fusion"
        local colour = G.C.JOY[summon_type] or G.C.JOY.FUSION
        if JoyousSpring.can_summon(card, JoyousSpring.summon_material_area.highlighted) then
            e.config.colour = colour
            e.config.button = 'exit_select_material_menu'
        else
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
        end
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.exit_select_material_menu = function(e)
    if not G.OVERLAY_MENU then return end

    local card = e.config.ref_table

    if card and JoyousSpring.summon_material_area and next(JoyousSpring.summon_material_area.highlighted) then
        local material_list = {}
        for _, material in ipairs(JoyousSpring.summon_material_area.highlighted) do
            if material.joy_g_jokers_pos then
                table.insert(material_list, G.jokers.cards[material.joy_g_jokers_pos])
            end
        end
        JoyousSpring.perform_summon(card, material_list)
        JoyousSpring.open_extra_deck(true, false)
    end
    G.FUNCS.exit_overlay_menu()
end

local g_funcs_reroll_shop_ref = G.FUNCS.reroll_shop
G.FUNCS.reroll_shop = function(e)
    JoyousSpring.open_extra_deck(false, false)
    g_funcs_reroll_shop_ref(e)
end

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if JoyousSpring.is_extra_deck_monster(card) then
        if #JoyousSpring.extra_deck_area.cards < JoyousSpring.extra_deck_area.config.card_limit +
            ((card.edition and card.edition.negative) and 1 or 0) then
            return true
        else
            alert_no_space(card, G.jokers)
            return false
        end
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
    local card = e.config.ref_table
    if card.ability.set == 'Joker' and JoyousSpring.is_extra_deck_monster(card) then
        if (card.edition and card.edition.negative) or
            #JoyousSpring.extra_deck_area.cards < JoyousSpring.extra_deck_area.config.card_limit then
            e.config.colour = G.C.GREEN
            e.config.button = 'use_card'
        else
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
        end
    else
        can_select_card_ref(e)
    end
end

local card_align_h_popup = Card.align_h_popup
function Card:align_h_popup()
    local ret = card_align_h_popup(self)
    local focused_ui = self.children.focused_ui and true or false
    if (self.area and self.area.config.type == "summon_materials") or
        (self.area.config.type == "title" and self.area.monster_h_popup and JoyousSpring.is_monster_card(self)) then
        ret.offset.x = 0
        ret.offset.y = focused_ui and 0.12 or 0.1
        ret.type = 'bm'
    end
    return ret
end

local card_highlight_ref = Card.highlight
function Card:highlight(is_highlighted)
    if self.area and self.area.config.type == "extra_deck" then
        self.highlighted = is_highlighted
        if self.highlighted then
            local can_summon = JoyousSpring.can_summon(self)
            local summon_type = self.ability.extra.joyous_spring.summon_type or "Fusion"
            local sell = {
                n = G.UIT.C,
                config = { align = "cr" },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { ref_table = self, align = "cr", padding = 0.1, r = 0.08, minw = 1.25, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'sell_card', func = 'can_sell_card' },
                        nodes = {
                            { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                            {
                                n = G.UIT.C,
                                config = { align = "tm" },
                                nodes = {
                                    {
                                        n = G.UIT.R,
                                        config = { align = "cm", maxw = 1.25 },
                                        nodes = {
                                            { n = G.UIT.T, config = { text = localize('b_sell'), colour = G.C.UI.TEXT_LIGHT, scale = 0.4, shadow = true } }
                                        }
                                    },
                                    {
                                        n = G.UIT.R,
                                        config = { align = "cm" },
                                        nodes = {
                                            { n = G.UIT.T, config = { text = localize('$'), colour = G.C.WHITE, scale = 0.4, shadow = true } },
                                            { n = G.UIT.T, config = { ref_table = self, ref_value = 'sell_cost_label', colour = G.C.WHITE, scale = 0.55, shadow = true } }
                                        }
                                    }
                                }
                            }
                        }
                    },
                }
            }
            local summon = {
                n = G.UIT.C,
                config = { align = "cr" },
                nodes = {

                    {
                        n = G.UIT.C,
                        config = { ref_table = self, align = "cr", maxw = 1.25, padding = 0.1, r = 0.08, minw = 1.25, minh = 0, hover = true, shadow = true, colour = can_summon and G.C.JOY[summon_type] or G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = can_summon and 'joy_perform_summon' or nil },
                        nodes = {
                            { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                            { n = G.UIT.T, config = { text = localize('b_joy_summon'), colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true } }
                        }
                    }
                }
            }
            self.children.use_button = UIBox {
                definition = {
                    n = G.UIT.ROOT,
                    config = {
                        align = "cr",
                        padding = 0,
                        colour = G.C.CLEAR
                    },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { padding = 0.15, align = 'cl' },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = 'cl' },
                                    nodes = { sell }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = 'cl' },
                                    nodes = { summon }
                                },
                            }
                        }
                    }
                },
                config = {
                    align = "cr",
                    offset = { x = -0.4, y = 0 },
                    parent = self
                }
            }
        elseif self.children.use_button then
            self.children.use_button:remove()
            self.children.use_button = nil
        end
    elseif self.area and self.area.config.type == "summon_materials" then
        self.highlighted = is_highlighted
    else
        card_highlight_ref(self, is_highlighted)
        if self.area and JoyousSpring.is_extra_deck_monster(self) and
            (self.area == G.shop_jokers and G.shop_jokers or self.area == G.pack_cards and G.pack_cards) then
            JoyousSpring.open_extra_deck(false, is_highlighted)
        end
    end
end

local card_can_sell_card_ref = Card.can_sell_card
function Card:can_sell_card(context)
    if (G.play and #G.play.cards > 0) or
        (G.CONTROLLER.locked) or
        (G.GAME.STOP_USE and G.GAME.STOP_USE > 0)
    then
        return false
    end
    if self.area and
        self.area.config.type == 'extra_deck' and
        not self.ability.eternal then
        return true
    end
    return card_can_sell_card_ref(self, context)
end

local card_remove_ref = Card.remove
function Card:remove()
    if (self.area == G.jokers or self.area == JoyousSpring.extra_deck_area) and
        JoyousSpring.is_monster_card(self) then
        JoyousSpring.send_to_graveyard(self)
    end
    card_remove_ref(self)
end

local card_remove_from_area_ref = Card.remove_from_area
function Card:remove_from_area()
    if self.area == JoyousSpring.extra_deck_area and
        self.edition and self.edition.card_limit then
        JoyousSpring.extra_deck_area.config.card_limit =
            JoyousSpring.extra_deck_area.config.card_limit - self.edition.card_limit
    end
    card_remove_from_area_ref(self)
end

local cardarea_remove_ref = CardArea.remove
function CardArea:remove()
    if self == G.shop_jokers or self == G.shop_booster then
        JoyousSpring.open_extra_deck(false, false)
    end
    cardarea_remove_ref(self)
end

local cardarea_can_highlight_ref = CardArea.can_highlight
function CardArea:can_highlight(card)
    return self.config.type == 'extra_deck' or self.config.type == 'summon_materials' or cardarea_can_highlight_ref
end

local cardarea_add_to_highlighted_ref = CardArea.add_to_highlighted
function CardArea:add_to_highlighted(card, silent)
    --if self.config.highlighted_limit <= #self.highlighted then return end
    if self.config.type == 'extra_deck' or self.config.type == 'summon_materials' then
        if #self.highlighted >= self.config.highlighted_limit then
            self:remove_from_highlighted(self.highlighted[1])
        end
        self.highlighted[#self.highlighted + 1] = card
        card:highlight(true)
        if not silent then play_sound('cardSlide1') end
    else
        cardarea_add_to_highlighted_ref(self, card, silent)
    end
end

local cardarea_draw_ref = CardArea.draw
function CardArea:draw()
    cardarea_draw_ref(self)

    if self.config.type == 'extra_deck' or self.config.type == 'summon_materials' then
        for k, v in ipairs(self.ARGS.draw_layers) do
            for i = 1, #self.cards do
                if self.cards[i] ~= G.CONTROLLER.focused.target then
                    if not self.cards[i].highlighted then
                        if G.CONTROLLER.dragging.target ~= self.cards[i] then self.cards[i]:draw(v) end
                    end
                end
            end
            for i = 1, #self.cards do
                if self.cards[i] ~= G.CONTROLLER.focused.target then
                    if self.cards[i].highlighted then
                        if G.CONTROLLER.dragging.target ~= self.cards[i] then self.cards[i]:draw(v) end
                    end
                end
            end
        end
    end
end

local cardarea_align_cards_ref = CardArea.align_cards
function CardArea:align_cards()
    if self.config.type == 'extra_deck' or self.config.type == 'summon_materials' then
        for k, card in ipairs(self.cards) do
            if not card.states.drag.is then
                card.T.r = 0.1 * (- #self.cards / 2 - 0.5 + k) / (#self.cards) +
                    (G.SETTINGS.reduced_motion and 0 or 1) * 0.02 * math.sin(2 * G.TIMERS.REAL + card.T.x)
                local max_cards = math.max(#self.cards, self.config.temp_limit)
                card.T.x = self.T.x +
                    (self.T.w - self.card_w) *
                    ((k - 1) / math.max(max_cards - 1, 1) - 0.5 * (#self.cards - max_cards) / math.max(max_cards - 1, 1)) +
                    0.5 * (self.card_w - card.T.w)
                if #self.cards > 2 or (#self.cards > 1 and self == G.consumeables) or (#self.cards > 1 and self.config.spread) then
                    card.T.x = self.T.x + (self.T.w - self.card_w) * ((k - 1) / (#self.cards - 1)) +
                        0.5 * (self.card_w - card.T.w)
                elseif #self.cards > 1 and self ~= G.consumeables then
                    card.T.x = self.T.x + (self.T.w - self.card_w) * ((k - 0.5) / (#self.cards)) +
                        0.5 * (self.card_w - card.T.w)
                else
                    card.T.x = self.T.x + self.T.w / 2 - self.card_w / 2 + 0.5 * (self.card_w - card.T.w)
                end
                local highlight_height = G.HIGHLIGHT_H / 2
                if not card.highlighted then highlight_height = 0 end
                card.T.y = self.T.y + self.T.h / 2 - card.T.h / 2 - highlight_height +
                    (G.SETTINGS.reduced_motion and 0 or 1) * 0.03 * math.sin(0.666 * G.TIMERS.REAL + card.T.x)
                card.T.x = card.T.x + card.shadow_parrallax.x / 30
            end
        end
        table.sort(self.cards,
            function(a, b)
                return a.T.x + a.T.w / 2 - 100 * ((a.pinned and not a.ignore_pinned) and a.sort_id or 0) <
                    b.T.x + b.T.w / 2 - 100 * ((b.pinned and not b.ignore_pinned) and b.sort_id or 0)
            end)
    end
    cardarea_align_cards_ref(self)
    if self.config.type == 'joker' then
        for k, card in ipairs(self.cards) do
            if not card.states.drag.is and JoyousSpring.is_monster_card(card) and card.facing == 'back' then
                card.T.r = card.T.r + math.pi / 2
            end
        end
    end
end

local controller_queue_R_cursor_press_ref = Controller.queue_R_cursor_press
function Controller:queue_R_cursor_press(x, y)
    controller_queue_R_cursor_press_ref(self, x, y)

    if JoyousSpring.summon_material_area and next(JoyousSpring.summon_material_area.highlighted) then
        JoyousSpring.summon_material_area:unhighlight_all()
    end
end

local game_start_run_ref = Game.start_run
function Game:start_run(args)
    self.joy_extra_deck_area = CardArea(
        0,
        0,
        self.CARD_W * 4.95,
        self.CARD_H * 0.95,
        {
            card_limit = 5,
            type = 'extra_deck',
            highlight_limit = 1,
        }
    )
    JoyousSpring.extra_deck_area = G.joy_extra_deck_area
    game_start_run_ref(self, args)
    self.joy_extra_deck = UIBox {
        definition = JoyousSpring.create_UIBox_extra_deck(),
        config = { align = 'cmi', offset = { x = 0, y = -5 }, major = self.jokers, bond = 'Weak' }
    }
    self.joy_extra_deck.states.visible = false

    JoyousSpring.extra_deck_open = false
    JoyousSpring.extra_deck_forced = false
    JoyousSpring.extra_deck_limit = 5

    self.GAME.joy_graveyard = self.GAME.joy_graveyard or {}
    JoyousSpring.graveyard = self.GAME.joy_graveyard

    self.extra_buttons = UIBox {
        definition = {
            n = G.UIT.ROOT,
            config = {
                align = "cm",
                minw = 1,
                minh = 0.3,
                padding = 0.15,
                r = 0.1,
                colour = G.C.CLEAR
            },
            nodes = {
                {
                    n = G.UIT.C,
                    config = {
                        align = "tm",
                        minw = 2,
                        padding = 0.1,
                        r = 0.1,
                        hover = true,
                        colour = G.C.JOY.TRAP,
                        shadow = true,
                        button = "joy_open_graveyard"
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "bcm", padding = 0 },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = localize('b_joy_graveyard'),
                                        scale = 0.35,
                                        colour = G.C.UI.TEXT_LIGHT
                                    }
                                }
                            }
                        },
                    }
                },
                {
                    n = G.UIT.C,
                    config = {
                        align = "tm",
                        minw = 2,
                        padding = 0.1,
                        r = 0.1,
                        hover = true,
                        colour = G.C.JOY.SPELL,
                        shadow = true,
                        button = "joy_open_extra_deck"
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "bcm", padding = 0 },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = localize('b_joy_extra_deck'),
                                        scale = 0.35,
                                        colour = G.C.UI.TEXT_LIGHT
                                    }
                                }
                            }
                        },
                    }
                },
            }
        },
        config = {
            align = "tr",
            offset = { x = -4, y = 0 },
            major = G.consumeables,
            bond = 'Weak'
        }
    }
end
