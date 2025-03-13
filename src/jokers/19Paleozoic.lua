--- PALEOZOIC
SMODS.Atlas({
    key = "paleo",
    path = "19Paleozoic.png",
    px = 71,
    py = 95
})

SMODS.Joker({
    key = "paleo_canadia",
    atlas = 'paleo',
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
        { properties = { { monster_archetypes = { "Paleozoic" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_trap = true,
                attribute = "WATER",
                monster_type = "Aqua",
                monster_archetypes = { ["Paleozoic"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "paleo_dino",
    atlas = 'paleo',
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
        { properties = { { monster_archetypes = { "Paleozoic" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_trap = true,
                attribute = "WATER",
                monster_type = "Aqua",
                monster_archetypes = { ["Paleozoic"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "paleo_eldonia",
    atlas = 'paleo',
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
        { properties = { { monster_archetypes = { "Paleozoic" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_trap = true,
                attribute = "WATER",
                monster_type = "Aqua",
                monster_archetypes = { ["Paleozoic"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "paleo_hallu",
    atlas = 'paleo',
    pos = { x = 3, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Paleozoic" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_trap = true,
                attribute = "WATER",
                monster_type = "Aqua",
                monster_archetypes = { ["Paleozoic"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "paleo_lean",
    atlas = 'paleo',
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
        { properties = { { monster_archetypes = { "Paleozoic" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_trap = true,
                attribute = "WATER",
                monster_type = "Aqua",
                monster_archetypes = { ["Paleozoic"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "paleo_marrella",
    atlas = 'paleo',
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
        { properties = { { monster_archetypes = { "Paleozoic" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_trap = true,
                attribute = "WATER",
                monster_type = "Aqua",
                monster_archetypes = { ["Paleozoic"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "paleo_oleno",
    atlas = 'paleo',
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
        { properties = { { monster_archetypes = { "Paleozoic" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_trap = true,
                attribute = "WATER",
                monster_type = "Aqua",
                monster_archetypes = { ["Paleozoic"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "paleo_pikaia",
    atlas = 'paleo',
    pos = { x = 3, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Paleozoic" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_trap = true,
                attribute = "WATER",
                monster_type = "Aqua",
                monster_archetypes = { ["Paleozoic"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "paleo_cambro",
    atlas = 'paleo',
    pos = { x = 2, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Paleozoic" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WATER",
                monster_type = "Aqua",
                monster_archetypes = { ["Paleozoic"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "paleo_anomalo",
    atlas = 'paleo',
    pos = { x = 1, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Paleozoic" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WATER",
                monster_type = "Aqua",
                monster_archetypes = { ["Paleozoic"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "paleo_opa",
    atlas = 'paleo',
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
        { properties = { { monster_archetypes = { "Paleozoic" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WATER",
                monster_type = "Aqua",
                monster_archetypes = { ["Paleozoic"] = true }
            },
        },
    },
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "paleo" },
    label = "k_joy_archetype_paleo"
}
