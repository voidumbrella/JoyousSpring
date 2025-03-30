--- SHADDOLL
SMODS.Atlas({
    key = "shaddoll",
    path = "18Shaddoll.png",
    px = 71,
    py = 95
})

-- Shaddoll Beast
SMODS.Joker({
    key = "shaddoll_beast",
    atlas = 'shaddoll',
    pos = { x = 1, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.h_size, card.ability.extra.revives, card.ability.extra.mills, card.ability.extra.turns } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fairy",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            h_size = 1,
            revives = 1,
            mills = 1,
            turns = 3
        },
    },
})

-- Shaddoll Dragon
SMODS.Joker({
    key = "shaddoll_dragon",
    atlas = 'shaddoll',
    pos = { x = 0, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hands, card.ability.extra.revives, card.ability.extra.mills, card.ability.extra.turns } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            hands = 1,
            revives = 1,
            mills = 1,
            turns = 3
        },
    },
})

-- Shaddoll Falco
SMODS.Joker({
    key = "shaddoll_falco",
    atlas = 'shaddoll',
    pos = { x = 2, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.revives_flip, card.ability.extra.revives, card.ability.extra.mills, card.ability.extra.creates } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_tuner = true,
                attribute = "DARK",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            revives_flip = 1,
            revives = 1,
            mills = 1,
            creates = 1
        },
    },
})

-- Shaddoll Hedgehog
SMODS.Joker({
    key = "shaddoll_hedgehog",
    atlas = 'shaddoll',
    pos = { x = 3, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.creates_tarot, card.ability.extra.revives, card.ability.extra.mills, card.ability.extra.creates_spectral } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            creates_tarot = 1,
            revives = 1,
            mills = 1,
            creates_spectral = 1
        },
    },
})

-- Shaddoll Hound
SMODS.Joker({
    key = "shaddoll_hound",
    atlas = 'shaddoll',
    pos = { x = 4, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money, card.ability.extra.revives, card.ability.extra.mills } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            money = 5,
            revives = 1,
            mills = 1
        },
    },
})

-- Shaddoll Squamata
SMODS.Joker({
    key = "shaddoll_squamata",
    atlas = 'shaddoll',
    pos = { x = 0, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.discards, card.ability.extra.revives, card.ability.extra.mills, card.ability.extra.turns } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            discards = 1,
            revives = 1,
            mills = 1,
            turns = 3
        },
    },
})

-- Shaddoll Core
SMODS.Joker({
    key = "shaddoll_core",
    atlas = 'shaddoll',
    pos = { x = 2, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.revives, card.ability.extra.mills, card.ability.extra.creates } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            xmult = 2,
            revives = 1,
            mills = 1,
            creates = 1
        },
    },
})

-- Naelshaddoll Ariel
SMODS.Joker({
    key = "shaddoll_ariel",
    atlas = 'shaddoll',
    pos = { x = 1, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.banishes } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WATER",
                monster_type = "Psychic",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            banishes = 1
        },
    },
})

-- Nehshaddoll Genius
SMODS.Joker({
    key = "shaddoll_genius",
    atlas = 'shaddoll',
    pos = { x = 2, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.flips } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Machine",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            flips = 1
        },
    },
})

-- Qadshaddoll Keios
SMODS.Joker({
    key = "shaddoll_keios",
    atlas = 'shaddoll',
    pos = { x = 3, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.adds, card.ability.extra.mult } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            adds = 1,
            mult = 5
        },
    },
})

-- Reeshaddoll Wendi
SMODS.Joker({
    key = "shaddoll_wendi",
    atlas = 'shaddoll',
    pos = { x = 4, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.creates, card.ability.extra.revives } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WIND",
                monster_type = "Psychic",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            creates = 1,
            revives = 1
        },
    },
})

-- Helshaddoll Hollow
SMODS.Joker({
    key = "shaddoll_hollow",
    atlas = 'shaddoll',
    pos = { x = 0, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mills, card.ability.extra.mills_transfer } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "FIRE",
                monster_type = "Fiend",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            mills = 3,
            mills_transfer = 3
        },
    },
})

-- El Shaddoll Anoyatyllis
SMODS.Joker({
    key = "shaddoll_anoya",
    atlas = 'shaddoll',
    pos = { x = 3, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, 0, card.ability.extra.adds } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WATER",
                monster_type = "Fiend",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            chips = 40,
            adds = 1
        },
    },
})

-- El Shaddoll Apkallone
SMODS.Joker({
    key = "shaddoll_apka",
    atlas = 'shaddoll',
    pos = { x = 4, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.adds } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            adds = 1
        },
    },
})

-- El Shaddoll Winda
SMODS.Joker({
    key = "shaddoll_winda",
    atlas = 'shaddoll',
    pos = { x = 4, y = 3 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, 1, card.ability.extra.adds } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            xmult = 2,
            adds = 1
        },
    },
})

-- El Shaddoll Construct
SMODS.Joker({
    key = "shaddoll_elconstruct",
    atlas = 'shaddoll',
    pos = { x = 0, y = 3 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mills, card.ability.extra.adds } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Fairy",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            mills = 10,
            adds = 1
        },
    },
})

-- El Shaddoll Grysta
SMODS.Joker({
    key = "shaddoll_grysta",
    atlas = 'shaddoll',
    pos = { x = 1, y = 3 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xchips, 1, card.ability.extra.adds } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "FIRE",
                monster_type = "Rock",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            xchips = 1.05,
            adds = 1
        },
    },
})

-- El Shaddoll Shekhinaga
SMODS.Joker({
    key = "shaddoll_shekh",
    atlas = 'shaddoll',
    pos = { x = 2, y = 3 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.adds } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Machine",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            adds = 1
        },
    },
})

-- El Shaddoll Wendigo
SMODS.Joker({
    key = "shaddoll_wendigo",
    atlas = 'shaddoll',
    pos = { x = 3, y = 3 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.adds } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WIND",
                monster_type = "Psychic",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            adds = 1
        },
    },
})

-- Shaddoll Construct
SMODS.Joker({
    key = "shaddoll_construct",
    atlas = 'shaddoll',
    pos = { x = 0, y = 4 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.adds } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Shaddoll"] = true }
            },
            adds = 1
        },
    },
})

-- Curse of the Shadow Prison
SMODS.Joker({
    key = "shaddoll_prison",
    atlas = 'shaddoll',
    pos = { x = 1, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.add_counter, card.ability.extra.chips, card.ability.extra.remove, card.ability.extra.revives } }
    end,
    joy_desc_cards = {
        { "j_joy_shaddoll_prison", properties = { { monster_archetypes = { "Solfachord" } } }, name = localize("k_joy_archetype") },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_field_spell = true,
            },
            add_counter = 1,
            chips = 5,
            remove = 10,
            revives = 1
        },
    },
})
JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "shaddoll" },
    label = "k_joy_archetype_shaddoll"
}
