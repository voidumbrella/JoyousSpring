--- ADAMANCIPATOR
SMODS.Atlas({
    key = "adaman",
    path = "22Adamancipator.png",
    px = 71,
    py = 95
})

SMODS.Joker({
    key = "adaman_analyzer",
    atlas = 'adaman',
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
        { properties = { { monster_archetypes = { "Adamancipator" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_tuner = true,
                attribute = "EARTH",
                monster_type = "Rock",
                monster_archetypes = { ["Adamancipator"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "adaman_researcher",
    atlas = 'adaman',
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
        { properties = { { monster_archetypes = { "Adamancipator" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_tuner = true,
                attribute = "EARTH",
                monster_type = "Rock",
                monster_archetypes = { ["Adamancipator"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "adaman_seeker",
    atlas = 'adaman',
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
        { properties = { { monster_archetypes = { "Adamancipator" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_tuner = true,
                attribute = "EARTH",
                monster_type = "Rock",
                monster_archetypes = { ["Adamancipator"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "adaman_crysdragite",
    atlas = 'adaman',
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
        { properties = { { monster_archetypes = { "Adamancipator" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WATER",
                monster_type = "Rock",
                monster_archetypes = { ["Adamancipator"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "adaman_crysraptite",
    atlas = 'adaman',
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
        { properties = { { monster_archetypes = { "Adamancipator" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WIND",
                monster_type = "Rock",
                monster_archetypes = { ["Adamancipator"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "adaman_crysleonite",
    atlas = 'adaman',
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
        { properties = { { monster_archetypes = { "Adamancipator" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "FIRE",
                monster_type = "Rock",
                monster_archetypes = { ["Adamancipator"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "adaman_dragite",
    atlas = 'adaman',
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
        { properties = { { monster_archetypes = { "Adamancipator" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WATER",
                monster_type = "Rock",
                monster_archetypes = { ["Adamancipator"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "adaman_leonite",
    atlas = 'adaman',
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
        { properties = { { monster_archetypes = { "Adamancipator" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "FIRE",
                monster_type = "Rock",
                monster_archetypes = { ["Adamancipator"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "adaman_raptite",
    atlas = 'adaman',
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
        { properties = { { monster_archetypes = { "Adamancipator" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WIND",
                monster_type = "Rock",
                monster_archetypes = { ["Adamancipator"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "adaman_laputite",
    atlas = 'adaman',
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
        { properties = { { monster_archetypes = { "Adamancipator" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_field_spell = true,
                monster_archetypes = { ["Adamancipator"] = true }
            },
        },
    },
})


JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "adaman" },
    label = "k_joy_archetype_adaman"
}
