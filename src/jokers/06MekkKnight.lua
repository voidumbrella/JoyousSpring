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
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, 0 } }
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
            },
            mult = 10
        },

    },
})

-- Mekk-Knight Orange Sunset
SMODS.Joker({
    key = "mekk_orange",
    atlas = 'MekkKnight',
    pos = { x = 2, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { 0 } }
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
            },
        },
    },
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
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money, 0 } }
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
            },
            money = 2
        },
    },
})

-- Mekk-Knight Green Horizon
SMODS.Joker({
    key = "mekk_green",
    atlas = 'MekkKnight',
    pos = { x = 0, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { 0 } }
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
            },
        },
    },
})

-- Mekk-Knight Blue Sky
SMODS.Joker({
    key = "mekk_blue",
    atlas = 'MekkKnight',
    pos = { x = 1, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, 0 } }
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
            },
            chips = 20
        },
    },
})

-- Mekk-Knight Indigo Eclipse
SMODS.Joker({
    key = "mekk_indigo",
    atlas = 'MekkKnight',
    pos = { x = 2, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.xmult,
                card.ability.extra.money
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
                monster_type = "Psychic",
                monster_archetypes = { ["MekkKnight"] = true },
            },
            chips = 20,
            mult = 20,
            xmult = 2,
            money = 5
        },

    },
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
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create, 0 } }
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
            },
            cards_to_create = 1
        },
    },
})

-- Mekk-Knight of the Morning Star
SMODS.Joker({
    key = "mekk_morningstar",
    atlas = 'MekkKnight',
    pos = { x = 0, y = 2 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, 0, 0 } }
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
            },
            xmult = 2
        },
    },
})

-- Mekk-Knight Spectrum Supreme
SMODS.Joker({
    key = "mekk_spectrum",
    atlas = 'MekkKnight',
    pos = { x = 1, y = 2 },
    rarity = 3,
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
            },
            cards_to_create = 1
        },
    },
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
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { 0, 0 } }
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
            },
        },
    },
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "mekk", "mekkcrus" },
    label = "k_joy_archetype_mekk"
}
