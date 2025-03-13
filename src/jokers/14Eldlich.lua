--- ELDLICH
SMODS.Atlas({
    key = "eld",
    path = "14Eldlich.png",
    px = 71,
    py = 95
})

SMODS.Joker({
    key = "eld_eldlich",
    atlas = 'eld',
    pos = { x = 0, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Eldlich" } }, { monster_archetypes = { "GoldenLand" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Zombie",
                monster_archetypes = { ["Eldlich"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "eld_conq",
    atlas = 'eld',
    pos = { x = 1, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Eldlich" } }, { monster_archetypes = { "GoldenLand" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_trap = true,
                attribute = "LIGHT",
                monster_type = "Zombie",
                monster_archetypes = { ["GoldenLand"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "eld_guard",
    atlas = 'eld',
    pos = { x = 0, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Eldlich" } }, { monster_archetypes = { "GoldenLand" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_trap = true,
                attribute = "LIGHT",
                monster_type = "Zombie",
                monster_archetypes = { ["GoldenLand"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "eld_huaq",
    atlas = 'eld',
    pos = { x = 2, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Eldlich" } }, { monster_archetypes = { "GoldenLand" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_trap = true,
                attribute = "LIGHT",
                monster_type = "Zombie",
                monster_archetypes = { ["GoldenLand"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "eld_exalted",
    atlas = 'eld',
    pos = { x = 1, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Eldlich" } }, { monster_archetypes = { "GoldenLand" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_trap = true,
                attribute = "LIGHT",
                monster_type = "Zombie",
                monster_archetypes = { ["GoldenLand"] = true, ["Eldlixir"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "eld_mad",
    atlas = 'eld',
    pos = { x = 2, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Eldlich" } }, { monster_archetypes = { "GoldenLand" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Zombie",
                monster_archetypes = { ["Eldlich"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "eld_angel",
    atlas = 'eld',
    pos = { x = 0, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Eldlich" } }, { monster_archetypes = { "GoldenLand" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Zombie",
                monster_archetypes = { ["GoldenLand"] = true }
            },
        },
    },
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "eld" },
    label = "k_joy_archetype_eld"
}
