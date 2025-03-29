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
        return { vars = { card.ability.extra.tributes, card.ability.extra.chips } }
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
            tributes = 1,
            chips = 50
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
        return { vars = { card.ability.extra.tributes, card.ability.extra.creates, card.ability.extra.mult } }
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
            tributes = 1,
            creates = 1,
            mult = 15
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
        return { vars = { card.ability.extra.tributes, card.ability.extra.xmult, card.ability.extra.current_xmult, card.ability.extra.reduces } }
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
            tributes = 1,
            xmult = 0.1,
            current_xmult = 1,
            reduces = 2
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
        return { vars = { card.ability.extra.tributes, card.ability.extra.xmult, card.ability.extra.current_xmult, card.ability.extra.flips } }
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
            tributes = 1,
            xmult = 0.1,
            current_xmult = 1,
            flips = 1
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
        return { vars = { card.ability.extra.tributes, card.ability.extra.percent * 100 } }
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
            tributes = 1,
            percent = 0.1
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
        return { vars = { card.ability.extra.tributes, card.ability.extra.xmult } }
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
            tributes = 1,
            xmult = 2
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
        return { vars = { card.ability.extra.tributes, card.ability.extra.mult } }
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
            tributes = 1,
            mult = 100
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
        return { vars = { card.ability.extra.tributes, card.ability.extra.sell, card.ability.extra.sold } }
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
            tributes = 1,
            sell = 3,
            sold = 0
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
        return { vars = { card.ability.extra.tributes, card.ability.extra.xmult, card.ability.extra.current_xmult, card.ability.extra.mills } }
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
            tributes = 1,
            xmult = 0.1,
            current_xmult = 1,
            mills = 1
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
        return { vars = { card.ability.extra.tributes } }
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
            tributes = 1
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
        return { vars = { card.ability.extra.tributes, card.ability.extra.creates, card.ability.extra.xmult, card.ability.extra.current_xmult } }
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
            tributes = 2,
            creates = 1,
            xmult = 0.1,
            current_xmult = 1
        },
    },
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "invoked" },
    label = "k_joy_archetype_invoked"
}
