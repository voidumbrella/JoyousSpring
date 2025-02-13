-- --- MISCELLANEOUS
SMODS.Atlas({
    key = "joy_Misc01",
    path = "99Misc01.png",
    px = 71,
    py = 95
})

--#region Effect

-- Inspector Boarder

SMODS.Joker({
    key = "boarder",
    atlas = 'Misc01',
    pos = { x = 0, y = 0 },
    rarity = 3,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                1 + card.ability.extra.xmult * JoyousSpring.count_materials_owned({ { is_extra_deck = true } })
            }
        }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Machine",
                monster_archetypes = {},
            },
            xmult = 2,
            hands = {}
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.joker_main then
                return {
                    xmult = 1 +
                        card.ability.extra.xmult *
                        JoyousSpring.count_materials_owned({ { is_extra_deck = true } })
                }
            end
            if context.setting_blind and context.main_eval then
                local types_owned = JoyousSpring.extra_deck_types_owned() + 1
                ease_hands_played(types_owned - G.GAME.current_round.hands_left, true)
                card.ability.extra.hands = {}
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff then
            for _, joker in ipairs(JoyousSpring.get_materials_owned({ { is_main_deck = true, exclude_keys = { "j_joy_boarder" } } })) do
                SMODS.debuff_card(joker, true, "j_joy_boarder")
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if not next(SMODS.find_card("j_joy_boarder")) then
            for _, joker in ipairs(G.jokers.cards) do
                SMODS.debuff_card(joker, false, "j_joy_boarder")
            end
        end
    end,
    joy_apply_to_jokers_added = function(card)
        if JoyousSpring.is_main_deck_monster(card) and card.config.center.key ~= "j_joy_boarder" then
            SMODS.debuff_card(card, true, "j_joy_boarder")
        end
    end,
    joy_debuff_hand = function(joker, cards, hand, handname)
        if joker.ability.extra.hands[handname] then
            return true
        else
            joker.ability.extra.hands[handname] = true
            return false
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "exp" }
                    }
                }
            },
            calc_function = function(card)
                card.joker_display_values.xmult = 1 +
                    card.ability.extra.xmult * JoyousSpring.count_materials_owned({ { is_extra_deck = true } })
            end
        }
    end
})

--#endregion

--#region Pendulum

-- Archfiend Eccentrick

SMODS.Joker({
    key = "eccentrick",
    atlas = 'Misc01',
    pos = { x = 1, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.max, card.ability.extra.mult, card.ability.extra.mult * (G.GAME.joy_cards_destroyed or 0) } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                is_pendulum = true,
                attribute = "LIGHT",
                monster_type = "Fiend",
                monster_archetypes = { ["Archfiend"] = true },
            },
            mult = 5,
            max = 2
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult * (G.GAME.joy_cards_destroyed or 0)
                }
            end
        end
    end,
    use = function(self, card, area, copier)
        local destroyed_cards = {}
        for i = #G.hand.highlighted, 1, -1 do
            destroyed_cards[#destroyed_cards + 1] = G.hand.highlighted[i]
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                for i = #G.hand.highlighted, 1, -1 do
                    local playing_card = G.hand.highlighted[i]
                    if SMODS.has_enhancement(playing_card, 'm_glass') then
                        playing_card:shatter()
                    else
                        playing_card:start_dissolve(nil, i == #G.hand.highlighted)
                    end
                end
                return true
            end
        }))
        delay(0.3)
        SMODS.calculate_context({ remove_playing_cards = true, removed = destroyed_cards })
    end,
    can_use = function(self, card)
        return card.ability.extra.max >= #G.hand.highlighted and #G.hand.highlighted >= 1
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.MULT },
            calc_function = function(card)
                card.joker_display_values.mult = card.ability.extra.mult * (G.GAME.joy_cards_destroyed or 0)
            end
        }
    end
})

--#endregion

--#region Ritual

-- Sauravis, the Ancient and Ascended

SMODS.Joker({
    key = "sauravis",
    atlas = 'Misc01',
    pos = { x = 1, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "RITUAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Dragon",
                monster_archetypes = {},
                summon_conditions = {
                    {
                        type = "RITUAL",
                        materials = {
                            {},
                            {},
                        }
                    }
                },
            },
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and context.selling_self then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind:get_type() == 'Boss')) then
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                        { message = localize('ph_boss_disabled') })
                    G.GAME.blind:disable()
                    table.insert(JoyousSpring.cards_to_create, { key = "j_joy_sauravis" })
                end
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            reminder_text = {
                { ref_table = "card.joker_display_values", ref_value = "active_text" },
            },
            calc_function = function(card)
                local disableable = G.GAME and G.GAME.blind and G.GAME.blind.get_type and
                    ((not G.GAME.blind.disabled) and (G.GAME.blind:get_type() == 'Boss'))
                card.joker_display_values.active = disableable
                card.joker_display_values.active_text = localize(disableable and 'k_active' or 'ph_no_boss_active')
            end,
            style_function = function(card, text, reminder_text, extra)
                if reminder_text and reminder_text.children[1] then
                    reminder_text.children[1].config.colour = card.joker_display_values.active and G.C.GREEN or G.C.RED
                    reminder_text.children[1].config.scale = card.joker_display_values.active and 0.35 or 0.3
                    return true
                end
                return false
            end
        }
    end
})

--#endregion

-- --#region Fusion

-- -- Mudragon of the Swamp

-- SMODS.Joker({
--     key = "mudragon",
--     atlas = 'Misc01',
--     pos = { x = 2, y = 0 },
--     rarity = 2,
--     discovered = true,
--     blueprint_compat = false,
--     eternal_compat = true,
--     cost = 3,
--     loc_vars = function(self, info_queue, card)
--         return {}
--     end,
--     generate_ui = JoyousSpring.generate_info_ui,
--     config = {
--         extra = {
--             joyous_spring = {
--                 is_main_deck = false,
--                 summon_type = "FUSION",
--                 is_effect = true,
--                 is_all_attributes = true,
--                 is_all_materials = { "FUSION" },
--                 attribute = "FIRE",
--                 monster_type = "Dragon",
--                 monster_archetypes = {},
--                 summon_conditions = {
--                     {
--                         type = "FUSION",
--                         materials = {
--                             {},
--                             {},
--                         },
--                         restrictions = {
--                             different_rarities = true
--                         }
--                     }
--                 },
--             },
--         },
--     },
-- })



-- -- Garura, Wings of Resonant Life

-- SMODS.Joker({
--     key = "garura",
--     atlas = 'Misc01',
--     pos = { x = 0, y = 1 },
--     rarity = 2,
--     discovered = true,
--     blueprint_compat = false,
--     eternal_compat = true,
--     cost = 6,
--     loc_vars = function(self, info_queue, card)
--         return { vars = { card.ability.extra.h_size, card.ability.extra.h_size_gain } }
--     end,
--     generate_ui = JoyousSpring.generate_info_ui,
--     config = {
--         extra = {
--             joyous_spring = {
--                 is_main_deck = false,
--                 summon_type = "FUSION",
--                 is_effect = true,
--                 attribute = "DARK",
--                 monster_type = "Winged Beast",
--                 monster_archetypes = {},
--                 summon_conditions = {
--                     {
--                         type = "FUSION",
--                         materials = {
--                             {},
--                             {},
--                         },
--                         restrictions = {
--                             same_rarity = true,
--                             different_names = true
--                         }
--                     }
--                 },
--             },
--             h_size = 2,
--             h_size_gain = 1
--         },
--     },
-- })

-- --#endregion

-- --#region Link

-- -- Apollousa, Bow of the Goddess

-- SMODS.Joker({
--     key = "apollousa",
--     atlas = 'Misc01',
--     pos = { x = 2, y = 1 },
--     rarity = 2,
--     discovered = true,
--     blueprint_compat = false,
--     eternal_compat = true,
--     cost = 6,
--     loc_vars = function(self, info_queue, card)
--         return { vars = { card.ability.extra.chips, card.ability.extra.chips_reduction, 0 } }
--     end,
--     generate_ui = JoyousSpring.generate_info_ui,
--     config = {
--         extra = {
--             joyous_spring = {
--                 is_main_deck = false,
--                 summon_type = "LINK",
--                 is_effect = true,
--                 attribute = "WIND",
--                 monster_type = "Fairy",
--                 monster_archetypes = {},
--                 summon_conditions = {
--                     {
--                         type = "LINK",
--                         materials = {
--                             {},
--                             {},
--                         },
--                         restrictions = {
--                             different_names = true
--                         }
--                     }
--                 },
--             },
--             chips = 80,
--             chips_reduction = 80
--         },
--     },
-- })

-- --#endregion
