--- GHOTI
SMODS.Atlas({
    key = "joy_Ghoti",
    path = "08Ghoti.png",
    px = 71,
    py = 95
})

-- Keaf, Murk of the Ghoti
SMODS.Joker({
    key = "fish_keaf",
    atlas = 'Ghoti',
    pos = { x = 0, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.revives } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            revives = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                local func = function(c)
                    for i = 1, c.ability.extra.revives do
                        JoyousSpring.revive_pseudorandom(
                            {
                                { is_extra_deck = true, monster_archetypes = { "Ghoti" } },
                            },
                            pseudoseed("j_joy_fish_keaf"),
                            true
                        )
                    end
                end
                JoyousSpring.banish(card, "blind_selected", func)
            end
        end
    end,
})

-- Paces, Light of the Ghoti
SMODS.Joker({
    key = "fish_paces",
    atlas = 'Ghoti',
    pos = { x = 1, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                is_tuner = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            chips = 10
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                JoyousSpring.banish(card, "blind_selected")
            end
            if context.joker_main then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end,
})

-- Shif, Fairy of the Ghoti
SMODS.Joker({
    key = "fish_shif",
    atlas = 'Ghoti',
    pos = { x = 2, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                is_tuner = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            mult = 5
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                JoyousSpring.banish(card, "blind_selected")
            end
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end,
})

-- Zep, Ruby of the Ghoti
SMODS.Joker({
    key = "fish_zep",
    atlas = 'Ghoti',
    pos = { x = 3, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.revives } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                is_tuner = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            revives = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                local func = function(c)
                    for i = 1, c.ability.extra.revives do
                        JoyousSpring.revive_pseudorandom(
                            {
                                { is_main_deck = true, monster_archetypes = { "Ghoti" } },
                            },
                            pseudoseed("j_joy_fish_zep"),
                            true
                        )
                    end
                end
                JoyousSpring.banish(card, "blind_selected", func)
            end
        end
    end,
})

-- Ixeep, Omen of the Ghoti
SMODS.Joker({
    key = "fish_ixeep",
    atlas = 'Ghoti',
    pos = { x = 0, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
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
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
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
                context.end_of_round and context.game_over == false and context.main_eval then
                local func = function(c)
                    local choices = {
                        "j_joy_fish_keaf",
                        "j_joy_fish_paces",
                        "j_joy_fish_shif",
                        "j_joy_fish_zep",
                        "j_joy_fish_eanoc",
                        "j_joy_fish_psiics",
                        "j_joy_fish_snopios",
                    }

                    for i = 1, c.ability.extra.cards_to_create do
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            SMODS.add_card({
                                key = pseudorandom_element(choices, pseudoseed("j_joy_fish_ixeep"))
                            })
                        end
                    end
                end
                JoyousSpring.banish(card, "blind_selected", func)
            end
        end
    end,
})

-- Eanoc, Sentry of the Ghoti
SMODS.Joker({
    key = "fish_eanoc",
    atlas = 'Ghoti',
    pos = { x = 1, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create, card.ability.extra.times, card.ability.extra.returned } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            cards_to_create = 1,
            times = 3,
            returned = 0
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                JoyousSpring.banish(card, "blind_selected")
            end
            if not context.blueprint_card and not context.retrigger_joker and
                context.joy_returned and context.joy_returned_card == card then
                card.ability.extra.returned = card.ability.extra.returned + 1
                if card.ability.extra.returned >= card.ability.extra.times then
                    card.ability.extra.returned = 0
                    local choices = {
                        "j_joy_fish_arionpos",
                        "j_joy_fish_askaan",
                        "j_joy_fish_guoglim",
                        "j_joy_fish_deepbeyond",
                    }

                    for i = 1, card.ability.extra.cards_to_create do
                        local key_to_add, _ = pseudorandom_element(choices, pseudoseed("j_joy_fish_eanoc"))
                        if key_to_add and #JoyousSpring.extra_deck_area.cards < JoyousSpring.extra_deck_area.config.card_limit then
                            JoyousSpring.add_to_extra_deck(key_to_add)
                        end
                    end
                end
            end
        end
    end,
})

-- Psiics, Moonlight of the Ghoti
SMODS.Joker({
    key = "fish_psiics",
    atlas = 'Ghoti',
    pos = { x = 2, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.revives } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            revives = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                local func = function(c)
                    for i = 1, c.ability.extra.revives do
                        JoyousSpring.revive_pseudorandom(
                            {
                                { is_tuner = true },
                            },
                            pseudoseed("j_joy_fish_psiics"),
                            true,
                            { negative = true }
                        )
                    end
                end
                JoyousSpring.banish(card, "boss_selected", func)
            end
        end
    end,
})

-- Snopios, Shade of the Ghoti
SMODS.Joker({
    key = "fish_snopios",
    atlas = 'Ghoti',
    pos = { x = 3, y = 1 },
    rarity = 2,
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
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                JoyousSpring.banish(card, "blind_selected")
                local choices = JoyousSpring.get_materials_owned({ { exclude_monster_archetypes = { "Ghoti" } } })
                local to_banish = pseudorandom_element(choices, pseudoseed("j_joy_fish_snopios"))
                if to_banish then
                    JoyousSpring.banish(to_banish, "blind_selected")
                end
            end
        end
    end,
})

-- Arionpos, Serpent of the Ghoti
SMODS.Joker({
    key = "fish_arionpos",
    atlas = 'Ghoti',
    pos = { x = 0, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chips * (G.GAME.joy_cards_banished or 0), card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "SYNCHRO",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
                summon_conditions = {
                    {
                        type = "SYNCHRO",
                        materials = {
                            { is_tuner = true,       monster_type = "Fish",                   exclude_summon_types = { "XYZ", "LINK" } },
                            { exclude_tuners = true, exclude_summon_types = { "XYZ", "LINK" } },
                        },
                    }
                },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            chips = 4,
            cards_to_create = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                local func = function(c)
                    local choices = {
                        "j_joy_fish_askaan",
                        "j_joy_fish_guoglim",
                        "j_joy_fish_deepbeyond",
                    }

                    for i = 1, c.ability.extra.cards_to_create do
                        local key_to_add, _ = pseudorandom_element(choices, pseudoseed("j_joy_fish_arionpos"))
                        if key_to_add and #JoyousSpring.extra_deck_area.cards < JoyousSpring.extra_deck_area.config.card_limit then
                            JoyousSpring.add_to_extra_deck(key_to_add)
                        end
                    end
                end
                JoyousSpring.banish(card, "blind_selected", func)
            end
            if context.joker_main then
                return {
                    chips = card.ability.extra.chips * (G.GAME.joy_cards_banished or 0)
                }
            end
        end
    end,
})

-- Askaan, the Bicorned Ghoti
SMODS.Joker({
    key = "fish_askaan",
    atlas = 'Ghoti',
    pos = { x = 1, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult * (G.GAME.joy_cards_banished or 0) } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "SYNCHRO",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
                summon_conditions = {
                    {
                        type = "SYNCHRO",
                        materials = {
                            { is_tuner = true, exclude_summon_types = { "XYZ", "LINK" } },
                            { rarity = 3,      exclude_tuners = true,                   exclude_summon_types = { "XYZ", "LINK" } },
                        },
                    }
                },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            mult = 2,
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                JoyousSpring.banish(card, "blind_selected")

                local choices = JoyousSpring.get_materials_owned({ { exclude_monster_archetypes = { "Ghoti" } } })
                local to_banish = pseudorandom_element(choices, pseudoseed("j_joy_fish_askaan"))
                if to_banish then
                    JoyousSpring.banish(to_banish, "blind_selected")
                end
            end
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult * (G.GAME.joy_cards_banished or 0)
                }
            end
        end
    end,
})

-- Guoglim, Spear of the Ghoti
SMODS.Joker({
    key = "fish_guoglim",
    atlas = 'Ghoti',
    pos = { x = 2, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, 1 + (card.ability.extra.xmult * (G.GAME.joy_cards_banished or 0)) } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "SYNCHRO",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
                summon_conditions = {
                    {
                        type = "SYNCHRO",
                        materials = {
                            { is_tuner = true, exclude_summon_types = { "XYZ", "LINK" } },
                            { rarity = 3,      exclude_tuners = true,                   exclude_summon_types = { "XYZ", "LINK" } },
                        },
                    }
                },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            xmult = 0.05,
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                JoyousSpring.banish(card, "blind_selected")
            end
            if context.joker_main then
                return {
                    xmult = 1 + (card.ability.extra.xmult * (G.GAME.joy_cards_banished or 0))
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff and not card.debuff then
            if (#G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit - ((card.edition and card.edition.negative) and 0 or 1)) then
                local revive_fish = JoyousSpring.revive_pseudorandom(
                    { { monster_type = "Fish" } },
                    pseudoseed("j_joy_fish_guoglim"),
                    true
                )
                while revive_fish and (#G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit - ((card.edition and card.edition.negative) and 0 or 1)) do
                    revive_fish = JoyousSpring.revive_pseudorandom(
                        { { monster_type = "Fish" } },
                        pseudoseed("j_joy_fish_guoglim"),
                        true
                    )
                end
            end
        end
    end,
})

-- Ghoti of the Deep Beyond
SMODS.Joker({
    key = "fish_deepbeyond",
    atlas = 'Ghoti',
    pos = { x = 3, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "SYNCHRO",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
                summon_conditions = {
                    {
                        type = "SYNCHRO",
                        materials = {
                            { is_tuner = true,       monster_type = "Fish",                   exclude_summon_types = { "XYZ", "LINK" } },
                            { is_tuner = true,       monster_type = "Fish",                   exclude_summon_types = { "XYZ", "LINK" } },
                            { exclude_tuners = true, exclude_summon_types = { "XYZ", "LINK" } },
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
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                JoyousSpring.banish(card, "blind_selected")
                local choices = JoyousSpring.get_materials_owned({ { exclude_monster_archetypes = { "Ghoti" } } })
                for _, joker in ipairs(choices) do
                    JoyousSpring.banish(joker, "blind_selected")
                end
            end
        end
    end,
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "fish" },
    label = "k_joy_archetype_fish"
}
