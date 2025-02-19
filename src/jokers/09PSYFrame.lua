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
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- PSY-Framegear Alpha
SMODS.Joker({
    key = "psy_alpha",
    atlas = 'PSYFrame',
    pos = { x = 1, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create, card.ability.extra.banishes, card.ability.extra.xmult } }
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
            banishes = 1,
            xmult = 1.1
        },
    },
})

-- PSY-Framegear Beta
SMODS.Joker({
    key = "psy_beta",
    atlas = 'PSYFrame',
    pos = { x = 2, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create, card.ability.extra.banishes, card.ability.extra.xmult } }
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
            banishes = 1,
            xmult = 1.5
        },
    },
})

-- PSY-Framegear Gamma
SMODS.Joker({
    key = "psy_gamma",
    atlas = 'PSYFrame',
    pos = { x = 3, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create, card.ability.extra.banishes, card.ability.extra.xmult } }
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
            banishes = 1,
            xmult = 1.2
        },
    },
})

-- PSY-Framegear Delta
SMODS.Joker({
    key = "psy_delta",
    atlas = 'PSYFrame',
    pos = { x = 0, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create, card.ability.extra.banishes, card.ability.extra.xmult } }
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
            banishes = 1,
            xmult = 1.2
        },
    },
})

-- PSY-Framegear Epsilon
SMODS.Joker({
    key = "psy_epsilon",
    atlas = 'PSYFrame',
    pos = { x = 1, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create, card.ability.extra.banishes, card.ability.extra.xmult } }
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
            banishes = 1,
            xmult = 1.2
        },
    },
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
    cost = 1,
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
                            { rarity = 1,      exclude_tuners = true,                 exclude_summon_types = { "XYZ", "LINK" } },
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
    cost = 1,
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
                            { rarity = 1,      exclude_tuners = true,                 exclude_summon_types = { "XYZ", "LINK" } },
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
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "psy" },
    label = "k_joy_archetype_psy"
}
