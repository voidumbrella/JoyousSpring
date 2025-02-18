--- GENERAIDER
SMODS.Atlas({
    key = "joy_Generaider",
    path = "07Generaider.png",
    px = 71,
    py = 95
})

-- Loptr, Shadow of the Generaider Bosses
SMODS.Joker({
    key = "generaider_loptr",
    atlas = 'Generaider',
    pos = { x = 0, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_generaider_boss_stage
        end
        return {}
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "FIRE",
                monster_type = "Fairy",
                monster_archetypes = { ["Generaider"] = true },
            },
        },
    },
})

-- Vala, Seidhr of the Generaider Bosses
SMODS.Joker({
    key = "generaider_vala",
    atlas = 'Generaider',
    pos = { x = 1, y = 0 },
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
                attribute = "FIRE",
                monster_type = "Fairy",
                monster_archetypes = { ["Generaider"] = true },
            },
            revives = 1
        },
    },
})

-- Harr, Generaider Boss of Storms
SMODS.Joker({
    key = "generaider_harr",
    atlas = 'Generaider',
    pos = { x = 2, y = 0 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tributes } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "DARK",
                monster_type = "SPELLCASTER",
                monster_archetypes = { ["Generaider"] = true },
            },
            tributes = 2
        },
    },
    in_pool = function(self, args)
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- Nidhogg, Generaider Boss of Ice
SMODS.Joker({
    key = "generaider_nidhogg",
    atlas = 'Generaider',
    pos = { x = 3, y = 0 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tributes } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Wyrm",
                monster_archetypes = { ["Generaider"] = true },
            },
            tributes = 2
        },
    },
    in_pool = function(self, args)
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- Frodi, Generaider Boss of Swords
SMODS.Joker({
    key = "generaider_nidhogg",
    atlas = 'Generaider',
    pos = { x = 0, y = 1 },
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
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "WIND",
                monster_type = "Warrior",
                monster_archetypes = { ["Generaider"] = true },
            },
        },
    },
    in_pool = function(self, args)
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- Utgarda, Generaider Boss of Delusion
SMODS.Joker({
    key = "generaider_utgarda",
    atlas = 'Generaider',
    pos = { x = 1, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tributes } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Rock",
                monster_archetypes = { ["Generaider"] = true },
            },
            tributes = 1
        },
    },
    in_pool = function(self, args)
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- Mardel, Generaider Boss of Light
SMODS.Joker({
    key = "generaider_mardel",
    atlas = 'Generaider',
    pos = { x = 2, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tributes, card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Plant",
                monster_archetypes = { ["Generaider"] = true },
            },
            tributes = 1,
            cards_to_create = 1
        },
    },
    in_pool = function(self, args)
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- Dovelgus, Generaider Boss of Iron
SMODS.Joker({
    key = "generaider_dovelgus",
    atlas = 'Generaider',
    pos = { x = 3, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tributes, card.ability.extra.xmult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "EARTH",
                monster_type = "Machine",
                monster_archetypes = { ["Generaider"] = true },
            },
            tributes = 2,
            xmult = 4
        },
    },
    in_pool = function(self, args)
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- Naglfar, Generaider Boss of Fire
SMODS.Joker({
    key = "generaider_naglfar",
    atlas = 'Generaider',
    pos = { x = 0, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tributes, card.ability.extra.hands, card.ability.extra.discards } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "FIRE",
                monster_type = "BeastWarrior",
                monster_archetypes = { ["Generaider"] = true },
            },
            tributes = 2,
            hands = 1,
            discards = 1
        },
    },
    in_pool = function(self, args)
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- Hela, Generaider Boss of Doom
SMODS.Joker({
    key = "generaider_hela",
    atlas = 'Generaider',
    pos = { x = 1, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tributes, card.ability.extra.revives } }
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
                monster_archetypes = { ["Generaider"] = true },
            },
            tributes = 3,
            revives = 1,
        },
    },
    in_pool = function(self, args)
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- Jormungandr, Generaider Boss of Eternity
SMODS.Joker({
    key = "generaider_jormungandr",
    atlas = 'Generaider',
    pos = { x = 3, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.detach, card.ability.extra.hsize } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "XYZ",
                is_effect = true,
                attribute = "EARTH",
                monster_type = "Reptile",
                monster_archetypes = { ["Generaider"] = true },
                summon_conditions = {
                    {
                        type = "XYZ",
                        materials = {
                            { min = 2, rarity = 3, exclude_tokens = true, exclude_summon_types = { "LINK" } },
                        },
                    }
                },
            },
            mult = 100,
            detach = 2,
            hsize = 1,
        },
    },
})

-- Laevatein, Generaider Boss of Shadows
SMODS.Joker({
    key = "generaider_laevatein",
    atlas = 'Generaider',
    pos = { x = 0, y = 3 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_generaider_jormungandr
        end
        return {}
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "XYZ",
                is_effect = true,
                attribute = "FIRE",
                monster_type = "Fairy",
                monster_archetypes = { ["Generaider"] = true },
                summon_conditions = {
                    {
                        type = "XYZ",
                        materials = {
                            { rarity = 3, exclude_tokens = true, exclude_summon_types = { "LINK" } },
                            { rarity = 3, exclude_tokens = true, exclude_summon_types = { "LINK" } },
                            { rarity = 3, exclude_tokens = true, exclude_summon_types = { "LINK" } },
                            { rarity = 3, exclude_tokens = true, exclude_summon_types = { "LINK" } },
                            { rarity = 3, exclude_tokens = true, exclude_summon_types = { "LINK" } },
                        },
                    }
                },
            },
        },
    },
})

-- Generaider Boss Stage
SMODS.Joker({
    key = "generaider_boss_stage",
    atlas = 'Generaider',
    pos = { x = 2, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tributes, card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_field_spell = true,
                monster_archetypes = { ["Generaider"] = true },
            },
            tributes = 2,
            cards_to_create = 1,
        },
    },
})

JoyousSpring.token_pool["generaider"] = {
    name = "j_joy_token_generaider",
    atlas = "joy_Generaider",
    sprite_pos = { x = 1, y = 3 },
    attribute = "LIGHT",
    monster_type = "Fairy",
    monster_archetypes = { ["Generaider"] = true }
}

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "generaider" },
    label = "k_joy_archetype_generaider"
}
