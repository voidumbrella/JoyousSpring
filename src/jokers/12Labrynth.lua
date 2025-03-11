--- RUNICK
SMODS.Atlas({
    key = "lab",
    path = "12Labrynth.png",
    px = 71,
    py = 95
})

SMODS.Joker({
    key = "lab_clock",
    atlas = 'lab',
    pos = { x = 0, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.flips, card.ability.extra.bonus_mult, card.ability.extra.revives } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Labrynth" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["Labrynth"] = true }
            },
            flips = 1,
            bonus_mult = 20,
            revives = 2
        },
    },
})
SMODS.Joker({
    key = "lab_stovie",
    atlas = 'lab',
    pos = { x = 1, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.flips, card.ability.extra.bonus_chips, card.ability.extra.money } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Labrynth" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["Labrynth"] = true }
            },
            flips = 3,
            bonus_chips = 50,
            money = 10
        },
    },
})
SMODS.Joker({
    key = "lab_changdra",
    atlas = 'lab',
    pos = { x = 2, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_tribute" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_revive" }
        end
        return { vars = { card.ability.extra.flips, card.ability.extra.bonus_dollars, card.ability.extra.creates } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Labrynth" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["Labrynth"] = true }
            },
            flips = 3,
            bonus_dollars = 4,
            creates = 2
        },
    },
})
SMODS.Joker({
    key = "lab_ariane",
    atlas = 'lab',
    pos = { x = 3, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_tribute" }
        end
        return { vars = { card.ability.extra.h_size, card.ability.extra.flipped } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Labrynth" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["Labrynth"] = true }
            },
            h_size = 1,
            flipped = 5
        },
    },
})
SMODS.Joker({
    key = "lab_arianna",
    atlas = 'lab',
    pos = { x = 0, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_tribute" }
        end
        return { vars = { card.ability.extra.h_size, card.ability.extra.flipped } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Labrynth" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["Labrynth"] = true }
            },
            h_size = 1,
            flipped = 5
        },
    },
})
SMODS.Joker({
    key = "lab_arias",
    atlas = 'lab',
    pos = { x = 1, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, 0, card.ability.extra.flipped } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Labrynth" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["Labrynth"] = true }
            },
            chips = 10,
            flipped = 10
        },
    },
})
SMODS.Joker({
    key = "lab_archfiend",
    atlas = 'lab',
    pos = { x = 2, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, 0 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Labrynth" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["Labrynth"] = true }
            },
            mult = 5
        },
    },
})
SMODS.Joker({
    key = "lab_lovely",
    atlas = 'lab',
    pos = { x = 3, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1, card.ability.extra.chance, card.ability.extra.mult, 0 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Labrynth" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["Labrynth"] = true }
            },
            chance = 8,
            mult = 5,
        },
    },
})
SMODS.Joker({
    key = "lab_lady",
    atlas = 'lab',
    pos = { x = 0, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, 1 } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Labrynth" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["Labrynth"] = true }
            },
            xmult = 0.1,
        },
    },
})
SMODS.Joker({
    key = "lab_labyrinth",
    atlas = 'lab',
    pos = { x = 1, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money, 1, card.ability.extra.chance, card.ability.extra.flips } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Labrynth" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_field_spell = true,
                monster_archetypes = { ["Labrynth"] = true }
            },
            money = 5,
            chance = 2,
            flips = 1
        },
    },
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "lab" },
    label = "k_joy_archetype_lab"
}
