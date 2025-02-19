--- LIVE TWIN
SMODS.Atlas({
    key = "LiveTwin",
    path = "02LiveTwin.png",
    px = 71,
    py = 95
})

-- Live☆Twin Lil-la
SMODS.Joker({
    key = "ltwin_lilla",
    atlas = 'LiveTwin',
    pos = { x = 0, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 2,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_ltwin_kisikil
        end
        return { vars = { card.ability.extra.chips, card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["LiveTwin"] = true, ["Lilla"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            chips = 20,
            cards_to_create = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.joker_main then
                return {
                    chips = card.ability.extra.chips,
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.joy_from_kisikil and not next(SMODS.find_card("j_joy_ltwin_kisikil", true)) and not card.debuff and not from_debuff then
            for i = 1, card.ability.extra.cards_to_create do
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    local added_card = SMODS.create_card({
                        key = "j_joy_ltwin_kisikil"
                    })
                    added_card.joy_from_lilla = true
                    added_card:add_to_deck()
                    G.jokers:emplace(added_card)
                end
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+" },
                { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.CHIPS },
        }
    end
})

-- Live☆Twin Ki-sikil
SMODS.Joker({
    key = "ltwin_kisikil",
    atlas = 'LiveTwin',
    pos = { x = 1, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 2,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_ltwin_lilla
        end
        return { vars = { card.ability.extra.mult, card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Cyberse",
                monster_archetypes = { ["LiveTwin"] = true, ["Kisikil"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            mult = 10,
            cards_to_create = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult,
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.joy_from_lilla and not next(SMODS.find_card("j_joy_ltwin_lilla", true)) and not card.debuff and not from_debuff then
            for i = 1, card.ability.extra.cards_to_create do
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    local added_card = SMODS.create_card({
                        key = "j_joy_ltwin_lilla"
                    })
                    added_card.joy_from_kisikil = true
                    added_card:add_to_deck()
                    G.jokers:emplace(added_card)
                end
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+" },
                { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.MULT },
        }
    end
})

-- Live☆Twin Lil-la Treat
SMODS.Joker({
    key = "ltwin_lilla_treat",
    atlas = 'LiveTwin',
    pos = { x = 2, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.discards } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "DARK",
                monster_type = "Zombie",
                monster_archetypes = { ["LiveTwin"] = true, ["Lilla"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            discards = 1
        },
    },
    add_to_deck = function(self, card, from_debuff)
        if not JoyousSpring.is_perma_debuffed(card) then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
            ease_discard(card.ability.extra.discards)
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if not JoyousSpring.is_perma_debuffed(card) then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discards
            ease_discard(-card.ability.extra.discards)
        end
    end,
    joy_set_cost = function(card)
        if JoyousSpring.count_materials_owned({ { monster_archetypes = { "Kisikil" } } }) > 0 then
            card.cost = 0
        end
    end
})

-- Live☆Twin Lil-la Sweet
SMODS.Joker({
    key = "ltwin_lilla_sweet",
    atlas = 'LiveTwin',
    pos = { x = 3, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hands } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "DARK",
                monster_type = "Spellcaster",
                monster_archetypes = { ["LiveTwin"] = true, ["Lilla"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            hands = 1
        },
    },
    add_to_deck = function(self, card, from_debuff)
        if not JoyousSpring.is_perma_debuffed(card) then
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
            ease_hands_played(card.ability.extra.hands)
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if not JoyousSpring.is_perma_debuffed(card) then
            G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
            ease_hands_played(-card.ability.extra.hands)
        end
    end,
    joy_set_cost = function(card)
        if JoyousSpring.count_materials_owned({ { monster_archetypes = { "Kisikil" } } }) > 0 then
            card.cost = 0
        end
    end
})

-- Live☆Twin Ki-sikil Frost
SMODS.Joker({
    key = "ltwin_kisikil_frost",
    atlas = 'LiveTwin',
    pos = { x = 0, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.h_size } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Aqua",
                monster_archetypes = { ["LiveTwin"] = true, ["Kisikil"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            h_size = 1
        },
    },
    add_to_deck = function(self, card, from_debuff)
        if not JoyousSpring.is_perma_debuffed(card) then
            G.hand:change_size(card.ability.extra.h_size)
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if not JoyousSpring.is_perma_debuffed(card) then
            G.hand:change_size(-card.ability.extra.h_size)
        end
    end,
    joy_set_cost = function(card)
        if JoyousSpring.count_materials_owned({ { monster_archetypes = { "Lilla" } } }) > 0 then
            card.cost = 0
        end
    end
})

-- Evil★Twin Ki-sikil Deal
SMODS.Joker({
    key = "etwin_kisikil_deal",
    atlas = 'LiveTwin',
    pos = { x = 2, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.h_size, card.ability.extra.mill } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "LINK",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Fiend",
                monster_archetypes = { ["EvilTwin"] = true, ["Kisikil"] = true },
                summon_conditions = {
                    {
                        type = "LINK",
                        materials = {
                            { monster_archetypes = { "Kisikil" } },
                        }
                    }
                },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            mult = 10,
            h_size = 1,
            mill = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult,
                }
            end
            if context.setting_blind and context.main_eval then
                local choices = {
                    "j_joy_ltwin_lilla",
                    "j_joy_ltwin_lilla_treat",
                    "j_joy_ltwin_lilla_sweet",
                }

                for i = 1, card.ability.extra.mill do
                    JoyousSpring.send_to_graveyard(pseudorandom_element(choices, pseudoseed("j_joy_etwin_kisikil_deal")))
                end
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not JoyousSpring.is_perma_debuffed(card) then
            G.hand:change_size(card.ability.extra.h_size)
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if not JoyousSpring.is_perma_debuffed(card) then
            G.hand:change_size(-card.ability.extra.h_size)
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+" },
                { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.MULT },
        }
    end
})

-- Evil★Twin Ki-sikil
SMODS.Joker({
    key = "etwin_kisikil",
    atlas = 'LiveTwin',
    pos = { x = 3, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.h_size, card.ability.extra.revives } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "LINK",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Fiend",
                monster_archetypes = { ["EvilTwin"] = true, ["Kisikil"] = true },
                summon_conditions = {
                    {
                        type = "LINK",
                        materials = {
                            { monster_archetypes = { "Kisikil" } },
                            {}
                        }
                    }
                },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            mult = 20,
            h_size = 1,
            revives = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult,
                }
            end
            if context.setting_blind and context.main_eval then
                if JoyousSpring.graveyard["j_joy_etwin_lilla"] and JoyousSpring.graveyard["j_joy_etwin_lilla"].summonable > 0 then
                    for i = 1, card.ability.extra.revives do
                        JoyousSpring.revive("j_joy_etwin_lilla", true)
                    end
                else
                    for i = 1, card.ability.extra.revives do
                        JoyousSpring.revive_pseudorandom(
                            { { monster_archetypes = { "Lilla" } } },
                            pseudoseed("j_joy_etwin_kisikil"),
                            true
                        )
                    end
                end
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff and JoyousSpring.count_materials_owned({ { monster_archetypes = { "Lilla" } } }) > 0 then
            G.hand:change_size(card.ability.extra.h_size)
            card_eval_status_text(card, 'extra', nil, nil, nil,
                { message = localize { type = 'variable', key = 'a_handsize', vars = { card.ability.extra.h_size } } })
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+" },
                { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.MULT },
        }
    end
})

-- Evil★Twin Lil-la
SMODS.Joker({
    key = "etwin_lilla",
    atlas = 'LiveTwin',
    pos = { x = 0, y = 2 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.money, card.ability.extra.revives } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "LINK",
                is_effect = true,
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["EvilTwin"] = true, ["Lilla"] = true },
                summon_conditions = {
                    {
                        type = "LINK",
                        materials = {
                            { monster_archetypes = { "Lilla" } },
                            {}
                        }
                    }
                },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            chips = 40,
            money = 5,
            revives = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.joker_main then
                return {
                    chips = card.ability.extra.chips,
                }
            end
            if context.setting_blind and context.main_eval then
                if JoyousSpring.graveyard["j_joy_etwin_kisikil"] and JoyousSpring.graveyard["j_joy_etwin_kisikil"].summonable > 0 then
                    for i = 1, card.ability.extra.revives do
                        JoyousSpring.revive("j_joy_etwin_kisikil", true)
                    end
                else
                    for i = 1, card.ability.extra.revives do
                        JoyousSpring.revive_pseudorandom(
                            { { monster_archetypes = { "Kisikil" } } },
                            pseudoseed("j_joy_etwin_lilla"),
                            true
                        )
                    end
                end
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff and JoyousSpring.count_materials_owned({ { monster_archetypes = { "Kisikil" } } }) > 0 then
            ease_dollars(card.ability.extra.money)
            card_eval_status_text(card, 'dollars', card.ability.extra.money)
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+" },
                { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.CHIPS },
        }
    end
})

-- Evil★Twins Ki-sikil & Lil-la
SMODS.Joker({
    key = "etwin_kisikil_lilla",
    atlas = 'LiveTwin',
    pos = { x = 1, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.h_size,
                card.ability.extra.chips *
                JoyousSpring.count_materials_in_graveyard({ { monster_archetypes = { "Lilla" } } }),
                card.ability.extra.mult *
                JoyousSpring.count_materials_in_graveyard({ { monster_archetypes = { "Kisikil" } } })
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
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["EvilTwin"] = true, ["Kisikil"] = true, ["Lilla"] = true },
                cannot_revive = true,
                is_free = false,
            },
            chips = 40,
            mult = 20,
            h_size = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.setting_blind and context.main_eval then
                local links_owned = JoyousSpring.count_materials_owned({ { summon_type = "LINK" } })
                if links_owned and links_owned > 0 then
                    ease_discard(-links_owned)
                end
            end
            if context.joker_main then
                return {
                    chips = card.ability.extra.chips *
                        JoyousSpring.count_materials_in_graveyard({ { monster_archetypes = { "Lilla" } } }),
                    mult = card.ability.extra.mult *
                        JoyousSpring.count_materials_in_graveyard({ { monster_archetypes = { "Kisikil" } } }),
                }
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+",                              colour = G.C.CHIPS },
                { ref_table = "card.joker_display_values", ref_value = "chips", colour = G.C.CHIPS, retrigger_type = "mult" },
                { text = " +",                             colour = G.C.MULT },
                { ref_table = "card.joker_display_values", ref_value = "mult",  colour = G.C.MULT,  retrigger_type = "mult" }
            },
            calc_function = function(card)
                card.joker_display_values.chips = card.ability.extra.chips *
                    JoyousSpring.count_materials_in_graveyard({ { monster_archetypes = { "Lilla" } } })
                card.joker_display_values.mult = card.ability.extra.mult *
                    JoyousSpring.count_materials_in_graveyard({ { monster_archetypes = { "Kisikil" } } })
            end
        }
    end
})

-- Evil★Twin's Trouble Sunny
SMODS.Joker({
    key = "etwin_sunny",
    atlas = 'LiveTwin',
    pos = { x = 1, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_etwin_kisikil
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_etwin_lilla
        end
        return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.revives } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "LINK",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Fiend",
                monster_archetypes = { ["EvilTwin"] = true, ["Kisikil"] = true },
                summon_conditions = {
                    {
                        type = "LINK",
                        materials = {
                            { monster_archetypes = { "EvilTwin" } },
                            { monster_archetypes = { "EvilTwin" } },
                        }
                    }
                },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            chips = 80,
            mult = 40,
            revives = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                if #JoyousSpring.extra_deck_area.cards < JoyousSpring.extra_deck_area.config.card_limit +
                    ((card.edition and card.edition.negative) and 1 or 0) then
                    JoyousSpring.return_to_extra_deck(card)
                    local is_lilla_owned = JoyousSpring.count_materials_owned({ { monster_archetypes = { "Lilla" } } }) >
                        0
                    local kisikil_summoned = {}
                    if JoyousSpring.graveyard["j_joy_etwin_kisikil"] and JoyousSpring.graveyard["j_joy_etwin_kisikil"].summonable > 0 then
                        for i = 1, card.ability.extra.revives do
                            table.insert(kisikil_summoned, JoyousSpring.revive("j_joy_etwin_kisikil", true))
                        end
                    end
                    if JoyousSpring.graveyard["j_joy_etwin_lilla"] and JoyousSpring.graveyard["j_joy_etwin_lilla"].summonable > 0 then
                        for i = 1, card.ability.extra.revives do
                            JoyousSpring.revive("j_joy_etwin_lilla", true)
                        end
                    end
                    if not is_lilla_owned then
                        for _, joker in ipairs(kisikil_summoned) do
                            joker.config.center:add_to_deck(joker)
                        end
                    end
                end
            end
            if context.joker_main then
                return {
                    chips = card.ability.extra.chips,
                    mult = card.ability.extra.mult,
                }
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+",                       colour = G.C.CHIPS },
                { ref_table = "card.ability.extra", ref_value = "chips", colour = G.C.CHIPS, retrigger_type = "mult" },
                { text = " +",                      colour = G.C.MULT },
                { ref_table = "card.ability.extra", ref_value = "mult",  colour = G.C.MULT,  retrigger_type = "mult" }
            },
        }
    end
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "ltwin", "etwin" },
    label = "k_joy_archetype_ltwin"
}
