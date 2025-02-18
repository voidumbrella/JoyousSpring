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

JoyousSpring.return_to_extra_deck = function(card)
    if card.area and card.area == G.jokers then
        G.jokers:remove_card(card)
        card:remove_from_deck()
        card.ability.extra.joyous_spring.summoned = false
        card:set_cost()
        JoyousSpring.extra_deck_area:emplace(card)
        if JokerDisplay then
            card:joker_display_remove()
        end
    end
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
                                                            text = localize('k_joy_summon'),
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
    --print(material_combos)
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
        JoyousSpring.summon_material_area.material_combos = material_combos


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
                                    string = { localize('k_joy_graveyard') },
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

JoyousSpring.create_sell_and_use_buttons = function(card, args)
    local args = args or {}
    local sell = nil
    local summon = nil
    local detach = nil
    local use = nil

    if args.sell then
        sell = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { ref_table = card, align = "cr", padding = 0.1, r = 0.08, minw = 1.25, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'sell_card', func = 'can_sell_card' },
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
                                        { n = G.UIT.T, config = { ref_table = card, ref_value = 'sell_cost_label', colour = G.C.WHITE, scale = 0.55, shadow = true } }
                                    }
                                }
                            }
                        }
                    }
                },
            }
        }
    end
    if args.summon then
        summon = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = {

                {
                    n = G.UIT.C,
                    config = { ref_table = card, align = "cr", maxw = 1.25, padding = 0.1, r = 0.08, minw = 1.25, minh = 0, hover = true, shadow = true, colour = args.can_summon and G.C.JOY[args.summon_type] or G.C.UI.BACKGROUND_INACTIVE, button = args.can_summon and 'joy_perform_summon' or nil },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                        { n = G.UIT.T, config = { text = localize('k_joy_summon'), colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true } }
                    }
                }
            }
        }
    end
    if args.detach then
        detach = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { ref_table = card, align = "cr", maxw = 1.25, padding = 0.1, r = 0.08, minw = 1.25, minh = 0, hover = true, shadow = true, colour = G.C.JOY.XYZ or G.C.UI.BACKGROUND_INACTIVE, button = 'joy_detach_material' },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                        { n = G.UIT.T, config = { text = localize('k_joy_detach'), colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true } }
                    }
                }
            }
        }
    end
    if args.use then
        use = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = {

                {
                    n = G.UIT.C,
                    config = { ref_table = card, align = "cr", maxw = 1.25, padding = 0.1, r = 0.08, minw = 1.25, minh = 0, hover = true, shadow = true, colour = G.C.JOY.PENDULUM or G.C.UI.BACKGROUND_INACTIVE, one_press = true, func = 'joy_can_use', button = 'joy_use_card' },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                        { n = G.UIT.T, config = { text = localize('b_use'), colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true } }
                    }
                }
            }
        }
    end

    return {
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
                    sell and {
                        n = G.UIT.R,
                        config = { align = 'cl' },
                        nodes = { sell }
                    } or nil,
                    summon and {
                        n = G.UIT.R,
                        config = { align = 'cl' },
                        nodes = { summon }
                    } or nil,
                    detach and {
                        n = G.UIT.R,
                        config = { align = 'cl' },
                        nodes = { detach }
                    } or nil,
                    use and {
                        n = G.UIT.R,
                        config = { align = 'cl' },
                        nodes = { use }
                    } or nil,
                }
            }
        }
    }
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

        if JoyousSpring.can_summon_with_combo(card, JoyousSpring.summon_material_area.highlighted) then
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

G.FUNCS.joy_detach_material = function(e)
    local card = e.config.ref_table

    if JoyousSpring.get_xyz_materials(card) > 0 then
        card.ability.extra.joyous_spring.xyz_materials = card.ability.extra.joyous_spring.xyz_materials - 1
        SMODS.calculate_context({ joy_detach = true, joy_detaching_card = card })
    end
end

G.FUNCS.joy_can_use = function(e)
    local card = e.config.ref_table
    if card.config.center.can_use and card.config.center:can_use(card) then
        e.config.colour = G.C.JOY.PENDULUM
        e.config.button = 'joy_use_card'
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.joy_can_buy_and_use = function(e)
    local card = e.config.ref_table
    if (((card.cost > G.GAME.dollars - G.GAME.bankrupt_at) and (card.cost > 0)) or
            not (card.config.center.can_use and card.config.center:can_use(card))) then
        e.UIBox.states.visible = false
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        if card.highlighted then
            e.UIBox.states.visible = true
        end
        e.config.colour = G.C.SECONDARY_SET.Voucher
        e.config.button = 'joy_buy_and_use'
    end
end

G.FUNCS.joy_buy_and_use = function(e)
    local card = e.config.ref_table
    if card and card:is(Card) then
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                card.area:remove_card(card)
                card:add_to_deck()
                if card.children.price then card.children.price:remove() end
                card.children.price = nil
                if card.children.buy_button then card.children.buy_button:remove() end
                card.children.buy_button = nil
                remove_nils(card.children)

                G.GAME.round_scores.cards_purchased.amt = G.GAME.round_scores.cards_purchased.amt + 1
                G.GAME.current_round.jokers_purchased = G.GAME.current_round.jokers_purchased + 1

                for i = 1, #G.jokers.cards do
                    G.jokers.cards[i]:calculate_joker({ buying_card = true, card = card })
                end

                if G.GAME.modifiers.inflation then
                    G.GAME.inflation = G.GAME.inflation + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            for k, v in pairs(G.I.CARD) do
                                if v.set_cost then v:set_cost() end
                            end
                            return true
                        end
                    }))
                end

                play_sound('card1')
                inc_career_stat('c_shop_dollars_spent', card.cost)
                if card.cost ~= 0 then
                    ease_dollars(-card.cost)
                end
                G.CONTROLLER:save_cardarea_focus('jokers')
                G.CONTROLLER:recall_cardarea_focus('jokers')

                G.FUNCS.joy_use_card(e)
                return true
            end
        }))
    end
end

G.FUNCS.joy_use_card = function(e)
    local card = e.config.ref_table
    local prev_state = G.STATE

    if card.config.center.use then
        G.TAROT_INTERRUPT = G.STATE
        G.STATE = (G.STATE == G.STATES.TAROT_PACK and G.STATES.TAROT_PACK) or
            (G.STATE == G.STATES.PLANET_PACK and G.STATES.PLANET_PACK) or
            (G.STATE == G.STATES.SPECTRAL_PACK and G.STATES.SPECTRAL_PACK) or
            (G.STATE == G.STATES.STANDARD_PACK and G.STATES.STANDARD_PACK) or
            (G.STATE == G.STATES.SMODS_BOOSTER_OPENED and G.STATES.SMODS_BOOSTER_OPENED) or
            (G.STATE == G.STATES.BUFFOON_PACK and G.STATES.BUFFOON_PACK) or
            G.STATES.PLAY_TAROT

        G.CONTROLLER.locks.use = true
        if G.booster_pack and not G.booster_pack.alignment.offset.py then
            G.booster_pack.alignment.offset.py = G.booster_pack.alignment.offset.y
            G.booster_pack.alignment.offset.y = G.ROOM.T.y + 29
        end
        if G.shop and not G.shop.alignment.offset.py then
            G.shop.alignment.offset.py = G.shop.alignment.offset.y
            G.shop.alignment.offset.y = G.ROOM.T.y + 29
        end
        if G.blind_select and not G.blind_select.alignment.offset.py then
            G.blind_select.alignment.offset.py = G.blind_select.alignment.offset.y
            G.blind_select.alignment.offset.y = G.ROOM.T.y + 39
        end
        if G.round_eval and not G.round_eval.alignment.offset.py then
            G.round_eval.alignment.offset.py = G.round_eval.alignment.offset.y
            G.round_eval.alignment.offset.y = G.ROOM.T.y + 29
        end

        if card.children.use_button then
            card.children.use_button:remove()
            card.children.use_button = nil
        end
        if card.children.sell_button then
            card.children.sell_button:remove()
            card.children.sell_button = nil
        end
        if card.children.price then
            card.children.price:remove()
            card.children.price = nil
        end
        G.jokers:remove_card(card)
        draw_card(G.hand, G.play, 1, 'up', true, card, nil, false)
        delay(0.2)
        stop_use()
        set_consumeable_usage(card)
        card.config.center:use(card, G.jokers)
        SMODS.calculate_context({ using_consumeable = true, consumeable = card, area = G.jokers })

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                card:start_dissolve()
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.STATE = prev_state
                        G.TAROT_INTERRUPT = nil
                        G.CONTROLLER.locks.use = false

                        if (prev_state == G.STATES.TAROT_PACK or prev_state == G.STATES.PLANET_PACK or
                                prev_state == G.STATES.SPECTRAL_PACK or prev_state == G.STATES.STANDARD_PACK or
                                prev_state == G.STATES.SMODS_BOOSTER_OPENED or
                                prev_state == G.STATES.BUFFOON_PACK) and G.booster_pack then
                            G.booster_pack.alignment.offset.y = G.booster_pack.alignment.offset.py
                            G.booster_pack.alignment.offset.py = nil
                        else
                            if G.shop then
                                G.shop.alignment.offset.y = G.shop.alignment.offset.py
                                G.shop.alignment.offset.py = nil
                            end
                            if G.blind_select then
                                G.blind_select.alignment.offset.y = G.blind_select.alignment.offset.py
                                G.blind_select.alignment.offset.py = nil
                            end
                            if G.round_eval then
                                G.round_eval.alignment.offset.y = G.round_eval.alignment.offset.py
                                G.round_eval.alignment.offset.py = nil
                            end
                            if G.jokers and G.jokers.cards[1] then
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.E_MANAGER:add_event(Event({
                                            func = function()
                                                G.CONTROLLER.interrupt.focus = nil
                                                if G.jokers then
                                                    G.CONTROLLER:recall_cardarea_focus(G.jokers)
                                                end
                                                return true
                                            end
                                        }))
                                        return true
                                    end
                                }))
                            end
                        end
                        return true
                    end
                }))
                return true
            end
        }))
    end
end

G.FUNCS.joy_can_summon_from_shop = function(e)
    local card = e.config.ref_table
    if JoyousSpring.can_summon(card) then
        e.config.colour = G.C.JOY.RITUAL
        e.config.button = 'joy_perform_summon'
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.joy_show_extra_deck = function (e)
    if JoyousSpring.extra_deck_area and #JoyousSpring.extra_deck_area.cards > 0 then
        G.GAME.joy_show_extra_deck = true
    end
    if G.GAME.joy_show_extra_deck then
        e.states.visible = true
    else
        e.states.visible = false
    end
end

G.FUNCS.joy_show_graveyard = function (e)
    if JoyousSpring.graveyard and next(JoyousSpring.graveyard) then
        G.GAME.joy_show_graveyard = true
    end
    if G.GAME.joy_show_graveyard then
        e.states.visible = true
    else
        e.states.visible = false
    end
end

G.FUNCS.exit_select_material_menu = function(e)
    if not G.OVERLAY_MENU then return end

    local card = e.config.ref_table
    local summon_type = card.ability.extra.joyous_spring.summon_type or "Fusion"

    if card and JoyousSpring.summon_material_area and next(JoyousSpring.summon_material_area.highlighted) then
        local material_list = {}
        for _, material in ipairs(JoyousSpring.summon_material_area.highlighted) do
            if material.joy_g_jokers_pos then
                table.insert(material_list, G.jokers.cards[material.joy_g_jokers_pos])
            end
        end
        JoyousSpring.perform_summon(card, material_list, summon_type)
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

local create_card_for_shop_ref = create_card_for_shop
function create_card_for_shop(area)
    local card = create_card_for_shop_ref(area)
    if card and G.jokers then
        for _, joker in ipairs(G.jokers.cards) do
            if joker.config.center.joy_create_card_for_shop then
                joker.config.center.joy_create_card_for_shop(card, area)
            end
        end
    end
    return card
end

local create_shop_card_ui_ref = create_shop_card_ui
function create_shop_card_ui(card, type, area)
    if JoyousSpring.is_pendulum_monster(card) then
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.43,
            blocking = false,
            blockable = false,
            func = (function()
                if card.opening then return true end
                local t1 = {
                    n = G.UIT.ROOT,
                    config = { minw = 0.6, align = 'tm', colour = darken(G.C.BLACK, 0.2), shadow = true, r = 0.05, padding = 0.05, minh = 1 },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "cm", colour = lighten(G.C.BLACK, 0.1), r = 0.1, minw = 1, minh = 0.55, emboss = 0.05, padding = 0.03 },
                            nodes = {
                                { n = G.UIT.O, config = { object = DynaText({ string = { { prefix = localize('$'), ref_table = card, ref_value = 'cost' } }, colours = { G.C.MONEY }, shadow = true, silent = true, bump = true, pop_in = 0, scale = 0.5 }) } },
                            }
                        }
                    }
                }
                local t2 = {
                    n = G.UIT.ROOT,
                    config = { ref_table = card, minw = 1.1, maxw = 1.3, padding = 0.1, align = 'bm', colour = G.C.GOLD, shadow = true, r = 0.08, minh = 0.94, func = 'can_buy', one_press = true, button = 'buy_from_shop', hover = true },
                    nodes = {
                        { n = G.UIT.T, config = { text = localize('b_buy'), colour = G.C.WHITE, scale = 0.5 } }
                    }
                }
                local t3 = {
                    n = G.UIT.ROOT,
                    config = { id = 'buy_and_use', ref_table = card, minh = 1.1, padding = 0.1, align = 'cr', colour = G.C.RED, shadow = true, r = 0.08, minw = 1.1, func = 'joy_can_buy_and_use', one_press = true, button = 'joy_buy_and_use', hover = true, focus_args = { type = 'none' } },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                        {
                            n = G.UIT.C,
                            config = { align = 'cm' },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = 'cm', maxw = 1 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = localize('b_buy'), colour = G.C.WHITE, scale = 0.5 } }
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = 'cm', maxw = 1 },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = localize('b_and_use'), colour = G.C.WHITE, scale = 0.3 } }
                                    }
                                },
                            }
                        }
                    }
                }


                card.children.price = UIBox {
                    definition = t1,
                    config = {
                        align = "tm",
                        offset = { x = 0, y = 1.5 },
                        major = card,
                        bond = 'Weak',
                        parent = card
                    }
                }

                card.children.buy_button = UIBox {
                    definition = t2,
                    config = {
                        align = "bm",
                        offset = { x = 0, y = -0.3 },
                        major = card,
                        bond = 'Weak',
                        parent = card
                    }
                }

                card.children.buy_and_use_button = UIBox {
                    definition = t3,
                    config = {
                        align = "cr",
                        offset = { x = -0.3, y = 0 },
                        major = card,
                        bond = 'Weak',
                        parent = card
                    }
                }

                card.children.price.alignment.offset.y = 0.38

                return true
            end)
        }))
    elseif JoyousSpring.is_summon_type(card, "RITUAL") then
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.43,
            blocking = false,
            blockable = false,
            func = (function()
                if card.opening then return true end
                local t2 = {
                    n = G.UIT.ROOT,
                    config = { ref_table = card, minw = 1.1, maxw = 1.3, padding = 0.1, align = 'bm', colour = G.C.JOY.RITUAL, shadow = true, r = 0.08, minh = 0.94, button = 'joy_perform_summon', hover = true },
                    nodes = {
                        { n = G.UIT.T, config = { text = localize('k_joy_summon'), colour = G.C.WHITE, scale = 0.5 } }
                    }
                }

                card.children.buy_button = UIBox {
                    definition = t2,
                    config = {
                        align = "bm",
                        offset = { x = 0, y = -0.3 },
                        major = card,
                        bond = 'Weak',
                        parent = card
                    }
                }

                return true
            end)
        }))
    else
        create_shop_card_ui_ref(card, type, area)
    end
end

local card_align_h_popup = Card.align_h_popup
function Card:align_h_popup()
    local ret = card_align_h_popup(self)
    local focused_ui = self.children.focused_ui and true or false
    if self.area and (self.area.config.type == "summon_materials" or
            (self.area.config.type == "title" and self.area.monster_h_popup and JoyousSpring.is_monster_card(self))) then
        ret.offset.x = 0
        ret.offset.y = focused_ui and 0.12 or 0.1
        ret.type = 'bm'
    end
    if (self.T.y < G.CARD_H*1.2) and self.area and (self.area.config.type == "title" and JoyousSpring.is_monster_card(self)) then
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

            self.children.use_button = UIBox {
                definition = JoyousSpring.create_sell_and_use_buttons(self, { sell = true, summon = true, can_summon = can_summon, summon_type = summon_type }),
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
    elseif ((JoyousSpring.is_summon_type(self, "XYZ") and JoyousSpring.get_xyz_materials(self) > 0) or
            JoyousSpring.is_pendulum_monster(self)) and
        self.area and self.area.config.type == 'joker' then
        self.highlighted = is_highlighted
        if self.highlighted then
            self.children.use_button = UIBox {
                definition = JoyousSpring.create_sell_and_use_buttons(self, {
                    sell = true,
                    detach = (JoyousSpring.is_summon_type(self, "XYZ") and JoyousSpring.get_xyz_materials(self) > 0),
                    use = JoyousSpring.is_pendulum_monster(self)
                }),
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
    elseif JoyousSpring.is_summon_type(self, "RITUAL") and self.area and self.area == G.pack_cards then
        self.highlighted = is_highlighted
        local can_summon = JoyousSpring.can_summon(self)
        if self.highlighted then
            self.children.use_button = UIBox {
                definition = {
                    n = G.UIT.ROOT,
                    config = { padding = 0, colour = G.C.CLEAR },
                    nodes = {
                        {
                            n = G.UIT.R, config = { ref_table = self, r = 0.08, padding = 0.1, align = "bm", minw = 0.5 * self.T.w - 0.15, maxw = 0.9 * self.T.w - 0.15, minh = 0.3 * self.T.h, hover = true, shadow = true, colour = can_summon and G.C.JOY.RITUAL or G.C.UI.BACKGROUND_INACTIVE, button = can_summon and 'use_card' or nil }, nodes = {
                            { n = G.UIT.T, config = { text = localize('k_joy_summon'), colour = G.C.UI.TEXT_LIGHT, scale = 0.45, shadow = true } }
                        }
                        },
                    }
                },
                config = {
                    align = "bmi",
                    offset = { x = 0, y = 0.65 },
                    parent = self
                }
            }
        elseif self.children.use_button then
            self.children.use_button:remove()
            self.children.use_button = nil
        end
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
    if self.config.type == 'joker' then --or self.joy_demo_area
        for k, card in ipairs(self.cards) do
            if not card.states.drag.is and JoyousSpring.is_monster_card(card) and card.facing == 'back' then
                card.T.r = card.T.r + math.pi / 2
            end
        end
    end
end

local cardarea_emplace_ref = CardArea.emplace
function CardArea:emplace(card, location, stay_flipped)
    if self == G.jokers then
        for _, joker in ipairs(G.jokers.cards) do
            if joker.config.center.joy_apply_to_jokers_added then
                joker.config.center.joy_apply_to_jokers_added(card)
            end
        end
    end
    cardarea_emplace_ref(self, card, location, stay_flipped)
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
    G.GAME.joy_show_extra_deck = G.GAME.joy_show_extra_deck or false
    G.GAME.joy_show_graveyard = G.GAME.joy_show_graveyard or false

    JoyousSpring.extra_deck_open = false
    JoyousSpring.extra_deck_forced = false
    JoyousSpring.extra_deck_limit = 5

    self.GAME.joy_graveyard = self.GAME.joy_graveyard or {}
    JoyousSpring.graveyard = self.GAME.joy_graveyard

    self.GAME.joy_create_card = self.GAME.joy_create_card or {}
    JoyousSpring.cards_to_create = self.GAME.joy_create_card

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
                        button = "joy_open_graveyard",
                        func = "joy_show_graveyard"
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "bcm", padding = 0 },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = localize('k_joy_graveyard'),
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
                        button = "joy_open_extra_deck",
                        func = "joy_show_extra_deck"
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "bcm", padding = 0 },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = localize('k_joy_extra_deck'),
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
