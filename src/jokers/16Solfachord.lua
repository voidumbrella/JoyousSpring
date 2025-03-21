--- SOLFACHORD
SMODS.Atlas({
    key = "solfa",
    path = "16Solfachord.png",
    px = 71,
    py = 95
})

SMODS.Joker({
    key = "solfa_cutia",
    atlas = 'solfa',
    pos = { x = 1, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1, 8, 0, 1, 3 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Solfachord" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_pendulum = true,
                attribute = "EARTH",
                monster_type = "Fairy",
                monster_archetypes = { ["Solfachord"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "solfa_dreamia",
    atlas = 'solfa',
    pos = { x = 2, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { 2, 7, 0 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Solfachord" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_pendulum = true,
                attribute = "WIND",
                monster_type = "Fairy",
                monster_archetypes = { ["Solfachord"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "solfa_eliteia",
    atlas = 'solfa',
    pos = { x = 3, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { 3, 6, 0, 1, 20 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Solfachord" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_pendulum = true,
                attribute = "WATER",
                monster_type = "Fairy",
                monster_archetypes = { ["Solfachord"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "solfa_fancia",
    atlas = 'solfa',
    pos = { x = 0, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { 4, 5, 0, 1, 21 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Solfachord" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_pendulum = true,
                attribute = "FIRE",
                monster_type = "Fairy",
                monster_archetypes = { ["Solfachord"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "solfa_gracia",
    atlas = 'solfa',
    pos = { x = 1, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 9,
    loc_vars = function(self, info_queue, card)
        return { vars = { 5, 4, 1, 10 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Solfachord" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_pendulum = true,
                attribute = "WATER",
                monster_type = "Fairy",
                monster_archetypes = { ["Solfachord"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "solfa_angelia",
    atlas = 'solfa',
    pos = { x = 2, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return { vars = { 6, 3, 1, 9 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Solfachord" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_pendulum = true,
                attribute = "FIRE",
                monster_type = "Fairy",
                monster_archetypes = { ["Solfachord"] = true }
            },
        },
    },
    add_to_deck = function(self, card, from_debuff)
        JoyousSpring.calculate_hand_highlight_limit(card)
    end,
    remove_from_deck = function(self, card, from_debuff)
        JoyousSpring.calculate_hand_highlight_limit(nil, card)
    end,
    joy_set_hand_highlight_limit = function(card)
        return 6
    end
})
SMODS.Joker({
    key = "solfa_beautia",
    atlas = 'solfa',
    pos = { x = 3, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 9,
    loc_vars = function(self, info_queue, card)
        return { vars = { 7, 0.2, 0, 2 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Solfachord" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_pendulum = true,
                attribute = "EARTH",
                monster_type = "Fairy",
                monster_archetypes = { ["Solfachord"] = true }
            },
        },
    },
    add_to_deck = function(self, card, from_debuff)
        JoyousSpring.calculate_hand_highlight_limit(card)
    end,
    remove_from_deck = function(self, card, from_debuff)
        JoyousSpring.calculate_hand_highlight_limit(nil, card)
    end,
    joy_set_hand_highlight_limit = function(card)
        return 7
    end
})
SMODS.Joker({
    key = "solfa_coolia",
    atlas = 'solfa',
    pos = { x = 0, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return { vars = { 8, 0.1, 0 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Solfachord" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_pendulum = true,
                attribute = "WIND",
                monster_type = "Fairy",
                monster_archetypes = { ["Solfachord"] = true }
            },
            selects = 8,
            highlight_change = 0
        },
    },
    add_to_deck = function(self, card, from_debuff)
        JoyousSpring.calculate_hand_highlight_limit(card)
    end,
    remove_from_deck = function(self, card, from_debuff)
        JoyousSpring.calculate_hand_highlight_limit(nil, card)
    end,
    joy_set_hand_highlight_limit = function(card)
        return 8
    end
})
SMODS.Joker({
    key = "solfa_musecia",
    atlas = 'solfa',
    pos = { x = 2, y = 2 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1, 3 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Solfachord" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Fairy",
                monster_archetypes = { ["Solfachord"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "solfa_grancoolia",
    atlas = 'solfa',
    pos = { x = 1, y = 2 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        return { vars = { 100, 0, 50, 3 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Solfachord" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Fairy",
                monster_archetypes = { ["Solfachord"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "solfa_harmonia",
    atlas = 'solfa',
    pos = { x = 0, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 12,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1, 1, 5 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Solfachord" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_field_spell = true,
                monster_archetypes = { ["Solfachord"] = true }
            },
        },
    },
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "solfa" },
    label = "k_joy_archetype_solfa"
}
