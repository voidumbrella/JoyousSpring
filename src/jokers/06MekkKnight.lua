--- MEKK-KNIGHT
SMODS.Atlas({
    key = "joy_MekkKnight",
    path = "06MekkKnight.png",
    px = 71,
    py = 95
})

-- Mekk-Knight Avram
SMODS.Joker({
    key = "mekk_avram",
    atlas = 'MekkKnight',
    pos = { x = 0, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = false,
                attribute = "LIGHT",
                monster_type = "Psychic",
                monster_archetypes = { ["MekkKnight"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
        },
    },
    in_pool = function(self, args)
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- Mekk-Knight Red Moon
SMODS.Joker({
    key = "mekk_red",
    atlas = 'MekkKnight',
    pos = { x = 1, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, JoyousSpring.get_joker_column(card) } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Psychic",
                monster_archetypes = { ["MekkKnight"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            mult = 2
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.individual and context.cardarea == G.play then
                if next(SMODS.find_card("j_joy_mekk_spectrum")) or JoyousSpring.get_joker_column(card) == (JoyousSpring.index_of(context.full_hand, context.other_card)) then
                    return {
                        mult = context.other_card.base.nominal * card.ability.extra.mult
                    }
                end
            end
        end
    end,
})

-- Mekk-Knight Orange Sunset
SMODS.Joker({
    key = "mekk_orange",
    atlas = 'MekkKnight',
    pos = { x = 2, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { JoyousSpring.get_joker_column(card) } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Psychic",
                monster_archetypes = { ["MekkKnight"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.modify_scoring_hand then
                if next(SMODS.find_card("j_joy_mekk_spectrum")) or JoyousSpring.get_joker_column(card) == (JoyousSpring.index_of(context.full_hand, context.other_card)) then
                    return {
                        add_to_hand = true,
                        message = localize("k_joy_splash")
                    }
                end
            end
        end
    end,
})

-- Mekk-Knight Yellow Star
SMODS.Joker({
    key = "mekk_yellow",
    atlas = 'MekkKnight',
    pos = { x = 3, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money, JoyousSpring.get_joker_column(card) } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Psychic",
                monster_archetypes = { ["MekkKnight"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            money = 3
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.individual and context.cardarea == G.play then
                if next(SMODS.find_card("j_joy_mekk_spectrum")) or JoyousSpring.get_joker_column(card) == (JoyousSpring.index_of(context.full_hand, context.other_card)) then
                    return {
                        dollars = context.other_card.base.nominal * card.ability.extra.money
                    }
                end
            end
        end
    end,
})

-- Mekk-Knight Green Horizon
SMODS.Joker({
    key = "mekk_green",
    atlas = 'MekkKnight',
    pos = { x = 0, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { JoyousSpring.get_joker_column(card) } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Psychic",
                monster_archetypes = { ["MekkKnight"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.repetition and context.cardarea == G.play then
                if next(SMODS.find_card("j_joy_mekk_spectrum")) or JoyousSpring.get_joker_column(card) == (JoyousSpring.index_of(context.full_hand, context.other_card)) then
                    if pseudorandom("j_joy_mekk_green") < G.GAME.probabilities.normal / (context.other_card.base.nominal >= 1 and context.other_card.base.nominal or 1) then
                        return {
                            repetitions = ((context.other_card.base.nominal >= 1) and context.other_card.base.nominal or nil)
                        }
                    end
                end
            end
        end
    end,
})

-- Mekk-Knight Blue Sky
SMODS.Joker({
    key = "mekk_blue",
    atlas = 'MekkKnight',
    pos = { x = 1, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, JoyousSpring.get_joker_column(card) } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Psychic",
                monster_archetypes = { ["MekkKnight"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            chips = 4
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.individual and context.cardarea == G.play then
                if next(SMODS.find_card("j_joy_mekk_spectrum")) or JoyousSpring.get_joker_column(card) == (JoyousSpring.index_of(context.full_hand, context.other_card)) then
                    return {
                        chips = context.other_card.base.nominal * card.ability.extra.chips
                    }
                end
            end
        end
    end,
})

-- Mekk-Knight Indigo Eclipse
SMODS.Joker({
    key = "mekk_indigo",
    atlas = 'MekkKnight',
    pos = { x = 2, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.xmult,
                card.ability.extra.money,
                colours = {
                    JoyousSpring.get_joker_column(card) == 1 and G.C.UI.TEXT_DARK or G.C.UI.TEXT_INACTIVE,
                    JoyousSpring.get_joker_column(card) == 2 and G.C.UI.TEXT_DARK or G.C.UI.TEXT_INACTIVE,
                    JoyousSpring.get_joker_column(card) == 3 and G.C.UI.TEXT_DARK or G.C.UI.TEXT_INACTIVE,
                    JoyousSpring.get_joker_column(card) == 4 and G.C.UI.TEXT_DARK or G.C.UI.TEXT_INACTIVE,
                    JoyousSpring.get_joker_column(card) >= 5 and G.C.UI.TEXT_DARK or G.C.UI.TEXT_INACTIVE
                }
            },

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
                monster_type = "Psychic",
                monster_archetypes = { ["MekkKnight"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            chips = 20,
            mult = 20,
            xmult = 2,
            money = 5
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.joker_main then
                return {
                    chips = JoyousSpring.get_joker_column(card) == 2 and card.ability.extra.chips or nil,
                    mult = JoyousSpring.get_joker_column(card) == 3 and card.ability.extra.mult or nil,
                    xmult = JoyousSpring.get_joker_column(card) == 4 and card.ability.extra.xmult or nil
                }
            end
            if context.repetition and context.cardarea == G.play then
                if JoyousSpring.get_joker_column(card) == 1 then
                    return {
                        repetitions = 1
                    }
                end
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        return JoyousSpring.get_joker_column(card) >= 5 and card.ability.extra.money or nil
    end,
})

-- Mekk-Knight Purple Nightfall
SMODS.Joker({
    key = "mekk_purple",
    atlas = 'MekkKnight',
    pos = { x = 3, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Psychic",
                monster_archetypes = { ["MekkKnight"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            cards_to_create = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.setting_blind and context.main_eval then
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit +
                    ((card.edition and card.edition.negative) and 0 or 1) then
                    JoyousSpring.banish(card, "end_of_ante")
                    local choices = {
                        "j_joy_mekk_avram",
                        "j_joy_mekk_red",
                        "j_joy_mekk_orange",
                        "j_joy_mekk_yellow",
                        "j_joy_mekk_green",
                        "j_joy_mekk_blue",
                        "j_joy_mekk_indigo",
                    }
                    for i = 1, card.ability.extra.cards_to_create do
                        SMODS.add_card({
                            key = pseudorandom_element(choices, pseudoseed("j_joy_mekk_purple"))
                        })
                    end
                end
            end
        end
    end,
})

-- Mekk-Knight of the Morning Star
SMODS.Joker({
    key = "mekk_morningstar",
    atlas = 'MekkKnight',
    pos = { x = 0, y = 2 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, JoyousSpring.get_joker_column(card) - 1, JoyousSpring.get_joker_column(card) + 1 } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "LINK",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Machine",
                monster_archetypes = { ["MekkKnight"] = true },
                summon_conditions = {
                    {
                        type = "LINK",
                        materials = {
                            {},
                            {},
                        },
                    }
                },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            xmult = 2
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.individual and context.cardarea == G.play then
                local card_index = JoyousSpring.index_of(context.full_hand, context.other_card)
                local is_mekk = G.jokers.cards[card_index] and
                    JoyousSpring.is_monster_archetype(G.jokers.cards[card_index], "MekkKnight")
                if is_mekk and (next(SMODS.find_card("j_joy_mekk_spectrum")) or
                        card_index == JoyousSpring.get_joker_column(card) - 1 or card_index == JoyousSpring.get_joker_column(card) + 1) then
                    return {
                        xmult = card.ability.extra.xmult
                    }
                end
            end
        end
    end,
})

-- Mekk-Knight Spectrum Supreme
SMODS.Joker({
    key = "mekk_spectrum",
    atlas = 'MekkKnight',
    pos = { x = 1, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "LINK",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Cyberse",
                monster_archetypes = { ["MekkKnight"] = true },
                summon_conditions = {
                    {
                        type = "LINK",
                        materials = {
                            { monster_archetypes = { "MekkKnight" } },
                            { monster_archetypes = { "MekkKnight" } },
                            { monster_archetypes = { "MekkKnight" } },
                        },
                    }
                },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            cards_to_create = 1,
            activated = false
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not card.ability.extra.activated and context.selling_card and JoyousSpring.is_monster_archetype(context.card, "MekkKnight") then
                card.ability.extra.activated = true
                local choices = {
                    "j_joy_mekk_avram",
                    "j_joy_mekk_red",
                    "j_joy_mekk_orange",
                    "j_joy_mekk_yellow",
                    "j_joy_mekk_green",
                    "j_joy_mekk_blue",
                    "j_joy_mekk_indigo",
                    "j_joy_mekk_purple",
                }
                for i = 1, card.ability.extra.cards_to_create do
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit +
                        ((context.card.edition and context.card.edition.negative) and 0 or 1) then
                        SMODS.add_card({
                            key = pseudorandom_element(choices, pseudoseed("j_joy_mekk_spectrum"))
                        })
                    end
                end
            end
            if context.end_of_round and context.game_over == false and context.main_eval then
                card.ability.extra.activated = false
                local eval = function(card)
                    return not card.ability.extra.activated
                end
                juice_card_until(card, eval, true)
            end
        end
    end,
})

-- Mekk-Knight Crusadia Avramax
SMODS.Joker({
    key = "mekkcrus_avramax",
    atlas = 'MekkKnight',
    pos = { x = 2, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 12,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.blinds, #JoyousSpring.get_materials(card) } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "LINK",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Cyberse",
                monster_archetypes = { ["MekkKnight"] = true },
                summon_conditions = {
                    {
                        type = "LINK",
                        materials = {
                            { min = 2, is_summoned = true, is_extra_deck = true },
                        },
                    }
                },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            blinds = 0
        },
    },
    calculate = function(self, card, context)
        if context.joy_selecting_hand then
            G.GAME.chips = G.GAME.blind.chips
            G.STATE = G.STATES.HAND_PLAYED
            G.STATE_COMPLETE = true
            end_round()
            return {
                message = localize("k_joy_defeated")
            }
        end
        if not context.blueprint and context.end_of_round and context.game_over == false and context.main_eval then
            card.ability.extra.blinds = card.ability.extra.blinds + 1
            if card.ability.extra.blinds >= #JoyousSpring.get_materials(card) then
                card:start_dissolve()
            end
        end
    end,
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "mekk", "mekkcrus" },
    label = "k_joy_archetype_mekk"
}
