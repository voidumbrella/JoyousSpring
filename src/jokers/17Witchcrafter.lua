--- WITCHCRAFTER
SMODS.Atlas({
    key = "witch",
    path = "17Witchcrafter.png",
    px = 71,
    py = 95
})

SMODS.Joker({
    key = "witch_genni",
    atlas = 'witch',
    pos = { x = 1, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1, 1, 1 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Witchcrafter" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WIND",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Witchcrafter"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "witch_potterie",
    atlas = 'witch',
    pos = { x = 0, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1, 2, 1, 1 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Witchcrafter" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Witchcrafter"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "witch_pittore",
    atlas = 'witch',
    pos = { x = 2, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 100, 0, 1, 2, 0, 1, 1 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Witchcrafter" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WATER",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Witchcrafter"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "witch_schmietta",
    atlas = 'witch',
    pos = { x = 1, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 25, 0, 1, 1, 1 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Witchcrafter" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "FIRE",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Witchcrafter"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "witch_edel",
    atlas = 'witch',
    pos = { x = 0, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1, 2, 0, 1, 1 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Witchcrafter" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Witchcrafter"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "witch_haine",
    atlas = 'witch',
    pos = { x = 0, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 5, 1, 1, 1 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Witchcrafter" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Witchcrafter"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "witch_verre",
    atlas = 'witch',
    pos = { x = 1, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1.5, 1 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Witchcrafter" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Witchcrafter"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "witch_aruru",
    atlas = 'witch',
    pos = { x = 2, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 5, 0 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Witchcrafter" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Witchcrafter"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "witch_vicemadame",
    atlas = 'witch',
    pos = { x = 2, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1, 5 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Witchcrafter" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Witchcrafter"] = true }
            },
        },
    },
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "witch" },
    label = "k_joy_archetype_witch"
}
