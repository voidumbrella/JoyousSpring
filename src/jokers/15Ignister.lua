--- @IGNISTER
SMODS.Atlas({
    key = "ignis",
    path = "15Ignister.png",
    px = 71,
    py = 95
})

SMODS.Joker({
    key = "ignis_achichi",
    atlas = 'ignis',
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
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "FIRE",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_pikari",
    atlas = 'ignis',
    pos = { x = 4, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_hiyari",
    atlas = 'ignis',
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
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WATER",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_bururu",
    atlas = 'ignis',
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
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WIND",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_doshin",
    atlas = 'ignis',
    pos = { x = 4, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_gatchiri",
    atlas = 'ignis',
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
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_gussari",
    atlas = 'ignis',
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
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_danmari",
    atlas = 'ignis',
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
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_doyon",
    atlas = 'ignis',
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
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_donyoribo",
    atlas = 'ignis',
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
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_backup",
    atlas = 'ignis',
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
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_wizard",
    atlas = 'ignis',
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
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_kiruku",
    atlas = 'ignis',
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
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_leviathan",
    atlas = 'ignis',
    pos = { x = 4, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WATER",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_golem",
    atlas = 'ignis',
    pos = { x = 0, y = 3 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_pegasus",
    atlas = 'ignis',
    pos = { x = 1, y = 3 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WIND",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_dragon",
    atlas = 'ignis',
    pos = { x = 2, y = 3 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_phoenix",
    atlas = 'ignis',
    pos = { x = 3, y = 3 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "FIRE",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_accode",
    atlas = 'ignis',
    pos = { x = 4, y = 3 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_infant",
    atlas = 'ignis',
    pos = { x = 0, y = 4 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_templar",
    atlas = 'ignis',
    pos = { x = 1, y = 4 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_arrival",
    atlas = 'ignis',
    pos = { x = 2, y = 4 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "ignis_ailand",
    atlas = 'ignis',
    pos = { x = 3, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_field_spell = true,
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "ignis" },
    label = "k_joy_archetype_ignis"
}
