--- INVOKED
SMODS.Atlas({
    key = "invoked",
    path = "20Invoked.png",
    px = 71,
    py = 95
})

-- Aleister the Invoker
SMODS.Joker({
    key = "invoked_aleister",
    atlas = 'invoked',
    pos = { x = 0, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1, 20 } }
    end,
    joy_desc_cards = {
        { "j_joy_invoked_meltdown", properties = { { monster_archetypes = { "Aleister" } }, { monster_archetypes = { "Invoked" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Aleister"] = true }
            },
        },
    },
})

-- Aleister the Invoker of Madness
SMODS.Joker({
    key = "invoked_madness",
    atlas = 'invoked',
    pos = { x = 2, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1, 1, 10 } }
    end,
    joy_desc_cards = {
        { "j_joy_invoked_meltdown", properties = { { monster_archetypes = { "Aleister" } }, { monster_archetypes = { "Invoked" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Aleister"] = true }
            },
        },
    },
})

-- Invoked Caliga
SMODS.Joker({
    key = "invoked_caliga",
    atlas = 'invoked',
    pos = { x = 3, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 2, 0.1, 1, 2 } }
    end,
    joy_desc_cards = {
        { "j_joy_invoked_meltdown", properties = { { monster_archetypes = { "Aleister" } }, { monster_archetypes = { "Invoked" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Beast",
                monster_archetypes = { ["Invoked"] = true }
            },
        },
    },
})

-- Invoked Raidjin
SMODS.Joker({
    key = "invoked_raidjin",
    atlas = 'invoked',
    pos = { x = 1, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 2, 0.1, 1, 1 } }
    end,
    joy_desc_cards = {
        { "j_joy_invoked_meltdown", properties = { { monster_archetypes = { "Aleister" } }, { monster_archetypes = { "Invoked" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WIND",
                monster_type = "Warrior",
                monster_archetypes = { ["Invoked"] = true }
            },
        },
    },
})

-- Invoked Cocytus
SMODS.Joker({
    key = "invoked_cocytus",
    atlas = 'invoked',
    pos = { x = 0, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 2, 10 } }
    end,
    joy_desc_cards = {
        { "j_joy_invoked_meltdown", properties = { { monster_archetypes = { "Aleister" } }, { monster_archetypes = { "Invoked" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WATER",
                monster_type = "Dragon",
                monster_archetypes = { ["Invoked"] = true }
            },
        },
    },
})

-- Invoked Purgatrio
SMODS.Joker({
    key = "invoked_purgatorio",
    atlas = 'invoked',
    pos = { x = 0, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 2, 2 } }
    end,
    joy_desc_cards = {
        { "j_joy_invoked_meltdown", properties = { { monster_archetypes = { "Aleister" } }, { monster_archetypes = { "Invoked" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "FIRE",
                monster_type = "Fiend",
                monster_archetypes = { ["Invoked"] = true }
            },
        },
    },
})

-- Invoked Magellanica
SMODS.Joker({
    key = "invoked_mage",
    atlas = 'invoked',
    pos = { x = 2, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 2, 150 } }
    end,
    joy_desc_cards = {
        { "j_joy_invoked_meltdown", properties = { { monster_archetypes = { "Aleister" } }, { monster_archetypes = { "Invoked" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Rock",
                monster_archetypes = { ["Invoked"] = true }
            },
        },
    },
})

-- Invoked Augoeides
SMODS.Joker({
    key = "invoked_augo",
    atlas = 'invoked',
    pos = { x = 2, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 2, 0.1, 1 } }
    end,
    joy_desc_cards = {
        { "j_joy_invoked_meltdown", properties = { { monster_archetypes = { "Aleister" } }, { monster_archetypes = { "Invoked" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Fairy",
                monster_archetypes = { ["Invoked"] = true }
            },
        },
    },
})

-- Invoked Mechaba
SMODS.Joker({
    key = "invoked_mechaba",
    atlas = 'invoked',
    pos = { x = 3, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 2, 3 } }
    end,
    joy_desc_cards = {
        { "j_joy_invoked_meltdown", properties = { { monster_archetypes = { "Aleister" } }, { monster_archetypes = { "Invoked" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Machine",
                monster_archetypes = { ["Invoked"] = true }
            },
        },
    },
})

-- Invoked Elysium
SMODS.Joker({
    key = "invoked_elysium",
    atlas = 'invoked',
    pos = { x = 1, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 2 } }
    end,
    joy_desc_cards = {
        { "j_joy_invoked_meltdown", properties = { { monster_archetypes = { "Aleister" } }, { monster_archetypes = { "Invoked" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Fairy",
                monster_archetypes = { ["Invoked"] = true }
            },
        },
    },
})

-- Magical Meltdown
SMODS.Joker({
    key = "invoked_meltdown",
    atlas = 'invoked',
    pos = { x = 1, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 2, 1, 0.1, 1 } }
    end,
    joy_desc_cards = {
        { "j_joy_invoked_meltdown", properties = { { monster_archetypes = { "Aleister" } }, { monster_archetypes = { "Invoked" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_field_spell = true
            },
        },
    },
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "invoked" },
    label = "k_joy_archetype_invoked"
}
