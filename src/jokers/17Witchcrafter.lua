--- WITCHCRAFTER
SMODS.Atlas({
    key = "witch",
    path = "17Witchcrafter.png",
    px = 71,
    py = 95
})

-- Witchcrafter Genni
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
        return { vars = { card.ability.extra.creates_tarot, card.ability.extra.tributes, card.ability.extra.creates } }
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
            creates_tarot = 1,
            tributes = 1,
            creates = 1
        },
    },
})

-- Witchcrafter Potterie
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
        return { vars = { card.ability.extra.creates_tarot, card.ability.extra.banishes, card.ability.extra.tributes, card.ability.extra.creates } }
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
            creates_tarot = 1,
            banishes = 2,
            tributes = 1,
            creates = 1
        },
    },
})

-- Witchcrafter Pittore
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
        return { vars = { card.ability.extra.chips, 0, card.ability.extra.creates_tarot, card.ability.extra.consumeables, 0, card.ability.extra.tributes, card.ability.extra.creates } }
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
            chips = 100,
            creates_tarot = 1,
            consumables = 2,
            tributes = 1,
            creates = 1
        },
    },
})

-- Witchcrafter Schmietta
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
        return { vars = { card.ability.extra.mult, 0, card.ability.extra.creates_tarot, card.ability.extra.tributes, card.ability.extra.creates } }
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
            mult = 25,
            creates_tarot = 1,
            tributes = 1,
            creates = 1
        },
    },
})

-- Witchcrafter Edel
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
        return { vars = { card.ability.extra.creates_genni, card.ability.extra.hands_to_play, card.ability.extra.hands_played, card.ability.extra.tributes, card.ability.extra.creates } }
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
            creates_genni = 1,
            hands_to_play = 2,
            hands_played = 0,
            tributes = 1,
            creates = 1
        },
    },
})

-- Witchcrafter Haine
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
        return { vars = { card.ability.extra.money, card.ability.extra.creates_tarot, card.ability.extra.tributes, card.ability.extra.creates } }
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
            money = 5,
            creates_tarot = 1,
            tributes = 1,
            creates = 1
        },
    },
})

-- Witchcrafter Madame Verre
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
        return { vars = { card.ability.extra.xmult, 1 } }
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
            xmult = 1.5
        },
    },
})

-- Witchcrafter Golem Aruru
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
        return { vars = { card.ability.extra.mult, 0 } }
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
            mult = 5,
        },
    },
})

-- Witchcrafter Vice-Madame
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
        return { vars = { card.ability.extra.creates, card.ability.extra.consumables, card.ability.extra.consumables_used } }
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
            creates = 1,
            consumables = 5,
            consumables_used = 0
        },
    },
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "witch" },
    label = "k_joy_archetype_witch"
}
