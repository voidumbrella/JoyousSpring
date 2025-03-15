--- @IGNISTER
SMODS.Atlas({
    key = "ignis",
    path = "15Ignister.png",
    px = 71,
    py = 95
})

-- Achichi @Ignister
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
        return { vars = { 15, 1 } }
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

-- Pikari @Ignister
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
        return { vars = { 3, 1 } }
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

-- Hiyari @Ignister
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
        return { vars = { 1, 1, 1 } }
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

-- Bururu @Ignister
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
        return { vars = { 3, 1 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_tuner = true,
                attribute = "WIND",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})

-- Doshin @Ignister
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
        return { vars = { 20, 1 } }
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

-- Gatchiri @Ignister
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
        return { vars = { 1.1 } }
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

-- Gussari @Ignister
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
        return { vars = { 30 } }
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

-- Danmari @Ignister
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
        return { vars = { 5 } }
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

-- Doyon @Ignister
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
        return { vars = { 1, 1 } }
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

-- Donyoribo @Ignister
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
        return { vars = { 2, 1 } }
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

-- Backup @Ignister
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
        return { vars = { 1 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Ignister" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_tuner = true,
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
})

-- Wizard @Ignister
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
        return { vars = { 2 } }
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

-- Kurikulink @Ignister
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
        return { vars = {} }
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

-- Water Leviathan @Ignister
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
        return { vars = { 1, 100, 10 } }
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

-- Earth Golem @Ignister
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
        return { vars = { 1, 1 } }
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

-- Wind Pegasus @Ignister
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
        return { vars = { 1, 1, 6 } }
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

-- Light Dragon @Ignister
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
        return { vars = { 1, 1 } }
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

-- Fire Phoenix @Ignister
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
        return { vars = { 1, 1, 0.1, 0.05 } }
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

-- Accode Talker @Ignister
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
        return { vars = { 3, 3 } }
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

-- Dark Infant @Ignister
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
        return { vars = { 1 } }
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

-- Dark Templar @Ignister
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
        return { vars = { 1 } }
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

-- The Arrival Cyberse @Ignister
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
        return { vars = { 6, 25, 1, 1000, 250, 1, 4, 5 } }
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

-- Ignister A.I.Land
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
        return { vars = { 1, 6 } }
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
                monster_archetypes = {}
            },
        },
    },
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "ignis" },
    label = "k_joy_archetype_ignis"
}
