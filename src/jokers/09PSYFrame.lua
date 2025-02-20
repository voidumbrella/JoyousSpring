--- PSY-FRAME
SMODS.Atlas({
    key = "joy_PSYFrame",
    path = "09PSYFrame.png",
    px = 71,
    py = 95
})

-- PSY-Frame Driver
SMODS.Joker({
    key = "psy_driver",
    atlas = 'PSYFrame',
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
                monster_archetypes = { ["PSYFrame"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
        },
    },
    in_pool = function(self, args)
        return args and args.source and args.source == "JoyousSpring" or false
    end,
})

-- PSY-Framegear Alpha
SMODS.Joker({
    key = "psy_alpha",
    atlas = 'PSYFrame',
    pos = { x = 1, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create, card.ability.extra.xmult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                is_tuner = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Psychic",
                monster_archetypes = { ["PSYFrame"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            cards_to_create = 1,
            xmult = 1.1,
            active = true
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and context.setting_blind and context.main_eval then
                local _, driver = next(SMODS.find_card("j_joy_psy_driver", true))
                if not driver then
                    _, driver = next(SMODS.find_card("j_joy_psy_multithreader", true))
                end
                if driver then
                    JoyousSpring.banish(driver, "end_of_round", nil, true)
                    card.ability.extra.active = true
                elseif next(SMODS.find_card("j_joy_psy_lambda")) then
                    card.ability.extra.active = true
                end
            end
            if card.ability.extra.active and context.individual and context.cardarea == G.hand then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
        if not context.blueprint_card and context.end_of_round and context.game_over == false and context.main_eval then
            card.ability.extra.active = false
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not next(SMODS.find_card("j_joy_psy_driver", true)) and not card.debuff and not from_debuff then
            for i = 1, card.ability.extra.cards_to_create do
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    SMODS.add_card({
                        key = "j_joy_psy_driver"
                    })
                end
            end
        end
    end,
})

-- PSY-Framegear Beta
SMODS.Joker({
    key = "psy_beta",
    atlas = 'PSYFrame',
    pos = { x = 2, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create, card.ability.extra.xmult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                is_tuner = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Psychic",
                monster_archetypes = { ["PSYFrame"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            cards_to_create = 1,
            xmult = 1.5
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and context.setting_blind and context.main_eval then
                local _, driver = next(SMODS.find_card("j_joy_psy_driver", true))
                if not driver then
                    _, driver = next(SMODS.find_card("j_joy_psy_multithreader", true))
                end
                if driver then
                    JoyousSpring.banish(driver, "end_of_round", nil, true)
                    card.ability.extra.active = true
                elseif next(SMODS.find_card("j_joy_psy_lambda")) then
                    card.ability.extra.active = true
                end
            end
            if card.ability.extra.active and context.individual and context.cardarea == G.play then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
        if not context.blueprint_card and context.end_of_round and context.game_over == false and context.main_eval then
            card.ability.extra.active = false
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not next(SMODS.find_card("j_joy_psy_driver", true)) and not card.debuff and not from_debuff then
            for i = 1, card.ability.extra.cards_to_create do
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    SMODS.add_card({
                        key = "j_joy_psy_driver"
                    })
                end
            end
        end
    end,
})

-- PSY-Framegear Gamma
SMODS.Joker({
    key = "psy_gamma",
    atlas = 'PSYFrame',
    pos = { x = 3, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create, card.ability.extra.xmult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                is_tuner = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Psychic",
                monster_archetypes = { ["PSYFrame"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            cards_to_create = 1,
            xmult = 1.2
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and context.setting_blind and context.main_eval then
                local _, driver = next(SMODS.find_card("j_joy_psy_driver", true))
                if not driver then
                    _, driver = next(SMODS.find_card("j_joy_psy_multithreader", true))
                end
                if driver then
                    JoyousSpring.banish(driver, "end_of_round", nil, true)
                    card.ability.extra.active = true
                elseif next(SMODS.find_card("j_joy_psy_lambda")) then
                    card.ability.extra.active = true
                end
            end
            if card.ability.extra.active and context.other_joker then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
        if not context.blueprint_card and context.end_of_round and context.game_over == false and context.main_eval then
            card.ability.extra.active = false
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not next(SMODS.find_card("j_joy_psy_driver", true)) and not card.debuff and not from_debuff then
            for i = 1, card.ability.extra.cards_to_create do
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    SMODS.add_card({
                        key = "j_joy_psy_driver"
                    })
                end
            end
        end
    end,
})

-- PSY-Framegear Delta
SMODS.Joker({
    key = "psy_delta",
    atlas = 'PSYFrame',
    pos = { x = 0, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create, card.ability.extra.xmult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                is_tuner = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Psychic",
                monster_archetypes = { ["PSYFrame"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            cards_to_create = 1,
            xmult = 1.2
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and context.setting_blind and context.main_eval then
                local _, driver = next(SMODS.find_card("j_joy_psy_driver", true))
                if not driver then
                    _, driver = next(SMODS.find_card("j_joy_psy_multithreader", true))
                end
                if driver then
                    JoyousSpring.banish(driver, "end_of_round", nil, true)
                    card.ability.extra.active = true
                elseif next(SMODS.find_card("j_joy_psy_lambda")) then
                    card.ability.extra.active = true
                end
            end
            if card.ability.extra.active and context.other_consumeable and context.other_consumeable.ability.set == "Tarot" then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
        if not context.blueprint_card and context.end_of_round and context.game_over == false and context.main_eval then
            card.ability.extra.active = false
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not next(SMODS.find_card("j_joy_psy_driver", true)) and not card.debuff and not from_debuff then
            for i = 1, card.ability.extra.cards_to_create do
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    SMODS.add_card({
                        key = "j_joy_psy_driver"
                    })
                end
            end
        end
    end,
})

-- PSY-Framegear Epsilon
SMODS.Joker({
    key = "psy_epsilon",
    atlas = 'PSYFrame',
    pos = { x = 1, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create, card.ability.extra.xmult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                is_tuner = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Psychic",
                monster_archetypes = { ["PSYFrame"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            cards_to_create = 1,
            xmult = 1.2
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and context.setting_blind and context.main_eval then
                local _, driver = next(SMODS.find_card("j_joy_psy_driver", true))
                if not driver then
                    _, driver = next(SMODS.find_card("j_joy_psy_multithreader", true))
                end
                if driver then
                    JoyousSpring.banish(driver, "end_of_round", nil, true)
                    card.ability.extra.active = true
                elseif next(SMODS.find_card("j_joy_psy_lambda")) then
                    card.ability.extra.active = true
                end
            end
            if card.ability.extra.active and context.other_consumeable and context.other_consumeable.ability.set == "Planet" then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
        if not context.blueprint_card and context.end_of_round and context.game_over == false and context.main_eval then
            card.ability.extra.active = false
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not next(SMODS.find_card("j_joy_psy_driver", true)) and not card.debuff and not from_debuff then
            for i = 1, card.ability.extra.cards_to_create do
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    SMODS.add_card({
                        key = "j_joy_psy_driver"
                    })
                end
            end
        end
    end,
})

-- PSY-Frame Multi-Threader
SMODS.Joker({
    key = "psy_multithreader",
    atlas = 'PSYFrame',
    pos = { x = 2, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 3,
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
                monster_archetypes = { ["PSYFrame"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            cards_to_create = 1,
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and context.joy_returned and context.joy_returned_card == card then
                local choices = {
                    "j_joy_psy_alpha",
                    "j_joy_psy_beta",
                    "j_joy_psy_gamma",
                    "j_joy_psy_delta",
                    "j_joy_psy_epsilon",
                }

                for i = 1, card.ability.extra.cards_to_create do
                    local key_to_add, _ = pseudorandom_element(choices, pseudoseed("j_joy_psy_multithreader"))
                    if key_to_add and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        SMODS.add_card({
                            key = key_to_add
                        })
                    end
                end
            end
        end
    end,
})

-- PSY-Framelord Zeta
SMODS.Joker({
    key = "psy_zeta",
    atlas = 'PSYFrame',
    pos = { x = 3, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 10,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "SYNCHRO",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Psychic",
                monster_archetypes = { ["PSYFrame"] = true },
                summon_conditions = {
                    {
                        type = "SYNCHRO",
                        materials = {
                            { is_tuner = true, exclude_summon_types = { "XYZ", "LINK" } },
                            { rarity = 1,      exclude_tuners = true,                   exclude_summon_types = { "XYZ", "LINK" } },
                        },
                    }
                },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and context.end_of_round and context.game_over == false and context.main_eval then
                JoyousSpring.banish(card, "blind_selected")
                local choices = G.consumeables.cards
                local to_banish = pseudorandom_element(choices, pseudoseed("j_joy_psy_zeta"))
                if to_banish then
                    JoyousSpring.banish(to_banish, "blind_selected")
                end
            end
        end
    end,
})

-- PSY-Framelord Omega
SMODS.Joker({
    key = "psy_omega",
    atlas = 'PSYFrame',
    pos = { x = 0, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 10,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "SYNCHRO",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Psychic",
                monster_archetypes = { ["PSYFrame"] = true },
                summon_conditions = {
                    {
                        type = "SYNCHRO",
                        materials = {
                            { is_tuner = true, exclude_summon_types = { "XYZ", "LINK" } },
                            { rarity = 1,      exclude_tuners = true,                   exclude_summon_types = { "XYZ", "LINK" } },
                        },
                    }
                },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and context.end_of_round and context.game_over == false and context.main_eval then
                JoyousSpring.banish(card, "blind_selected")
                local choices = JoyousSpring.get_materials_owned({ { exclude_keys = { "j_joy_psy_omega" } } })
                local to_banish = pseudorandom_element(choices, pseudoseed("j_joy_psy_omega"))
                if to_banish then
                    JoyousSpring.banish(to_banish, "blind_selected")
                end
            end
        end
    end,
})

-- PSY-Framelord Lambda
SMODS.Joker({
    key = "psy_lambda",
    atlas = 'PSYFrame',
    pos = { x = 1, y = 2 },
    rarity = 3,
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
                is_main_deck = false,
                summon_type = "LINK",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Psychic",
                monster_archetypes = { ["PSYFrame"] = true },
                summon_conditions = {
                    {
                        type = "LINK",
                        materials = {
                            { exclude_tokens = true },
                            { exclude_tokens = true },
                        },
                    }
                },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            cards_to_create = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.joy_returned and JoyousSpring.is_monster_type(context.joy_returned_card, "Psychic") then
                local choices = {
                    "j_joy_psy_zeta",
                    "j_joy_psy_omega",
                    "j_joy_psy_lambda",
                }

                for i = 1, card.ability.extra.cards_to_create do
                    local key_to_add, _ = pseudorandom_element(choices, pseudoseed("j_joy_psy_lambda"))
                    if key_to_add and #JoyousSpring.extra_deck_area.cards < JoyousSpring.extra_deck_area.config.card_limit then
                        JoyousSpring.add_to_extra_deck(key_to_add)
                    end
                end
            end
        end
    end,
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "psy" },
    label = "k_joy_archetype_psy"
}
