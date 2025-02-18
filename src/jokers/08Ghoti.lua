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
            },
            revives = 1
        },
    },
})

-- Paces, Light of the Ghoti
SMODS.Joker({
    key = "fish_paces",
    atlas = 'Ghoti',
    pos = { x = 1, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
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
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
            },
            chips = 10
        },
    },
})

-- Shif, Fairy of the Ghoti
SMODS.Joker({
    key = "fish_shif",
    atlas = 'Ghoti',
    pos = { x = 2, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
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
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
            },
            mult = 5
        },
    },
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
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
            },
            revives = 1
        },
    },
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
            },
            cards_to_create = 1
        },
    },
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
        return { vars = { card.ability.extra.cards_to_create, card.ability.extra.times } }
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
            },
            cards_to_create = 1,
            times = 3
        },
    },
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
            },
            cards_to_create = 1
        },
    },
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
            },
        },
    },
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
        return { vars = { card.ability.extra.chips, 0, card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "SYNCHRO",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
                summon_conditions = {
                    {
                        type = "SYNCHRO",
                        materials = {
                            { is_tuner = true,      monster_type = "Fish" },
                            { exclude_tuners = true },
                        },
                    }
                },
            },
            chips = 10,
            cards_to_create = 1
        },
    },
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
        return { vars = { card.ability.extra.mult, 0 } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "SYNCHRO",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
                summon_conditions = {
                    {
                        type = "SYNCHRO",
                        materials = {
                            { is_tuner = true },
                            { rarity = 3,     exclude_tuners = true },
                        },
                    }
                },
            },
            mult = 10,
        },
    },
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
        return { vars = { card.ability.extra.xmult, 0 } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "SYNCHRO",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
                summon_conditions = {
                    {
                        type = "SYNCHRO",
                        materials = {
                            { is_tuner = true },
                            { rarity = 3,     exclude_tuners = true },
                        },
                    }
                },
            },
            xmult = 10,
        },
    },
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
                is_main_deck = true,
                summon_type = "SYNCHRO",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Fish",
                monster_archetypes = { ["Ghoti"] = true },
                summon_conditions = {
                    {
                        type = "SYNCHRO",
                        materials = {
                            { is_tuner = true,      monster_type = "Fish" },
                            { is_tuner = true,      monster_type = "Fish" },
                            { exclude_tuners = true },
                        },
                    }
                },
            },
        },
    },
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "fish" },
    label = "k_joy_archetype_fish"
}
