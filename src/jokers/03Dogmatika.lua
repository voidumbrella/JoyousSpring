--- DOGMATIKA
SMODS.Atlas({
    key = "joy_Dogmatika",
    path = "03Dogmatika.png",
    px = 71,
    py = 95
})

-- Dogmatika Ecclesia, the Virtuous
SMODS.Joker({
    key = "dogma_ecclesia",
    atlas = 'Dogmatika',
    pos = { x = 0, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 2,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, 0 } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Dogmatika"] = true },
            },
            xmult = 0.5
        },
    },
})


-- Dogmatika Fleurdelis, the Knighted
SMODS.Joker({
    key = "dogma_fleur",
    atlas = 'Dogmatika',
    pos = { x = 1, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Dogmatika"] = true },
            },
            mult = 50
        },
    },
})



-- Dogmatika Maximus
SMODS.Joker({
    key = "dogma_maximus",
    atlas = 'Dogmatika',
    pos = { x = 2, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 2,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Dogmatika"] = true },
            },
            cards_to_create = 1
        },
    },
})



-- Dogmatika Adin, the Enlightened
SMODS.Joker({
    key = "dogma_adin",
    atlas = 'Dogmatika',
    pos = { x = 0, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 9,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Dogmatika"] = true },
            },
            cards_to_create = 1
        },
    },
})




-- Dogmatika Theo, the Iron Punch
SMODS.Joker({
    key = "dogma_theo",
    atlas = 'Dogmatika',
    pos = { x = 1, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, 0 } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Dogmatika"] = true },
            },
            chips = 5
        },
    },
})




-- Dogmatika Ashiyan
SMODS.Joker({
    key = "dogma_ashiyan",
    atlas = 'Dogmatika',
    pos = { x = 2, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 2,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.revives } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Dogmatika"] = true },
            },
            revives = 1
        },
    },
})




-- Dogmatika Nexus
SMODS.Joker({
    key = "dogma_nexus",
    atlas = 'Dogmatika',
    pos = { x = 0, y = 2 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.duplicates } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Dogmatika"] = true },
            },
            duplicates = 2
        },
    },
})



-- White Relic of Dogmatika
SMODS.Joker({
    key = "dogma_relic",
    atlas = 'Dogmatika',
    pos = { x = 1, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.h_size, card.ability.extra.debuffed_ed_count } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "RITUAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Dogmatika"] = true },
                summon_conditions = {
                    {
                        type = "RITUAL",
                        materials = {
                            { monster_archetypes = { "Dogmatika" } },
                            { monster_archetypes = {} },
                        }
                    }
                },
            },
            h_size = 1,
            debuffed_ed_count = 5
        },
    },
})



-- White Knight of Dogmatika
SMODS.Joker({
    key = "dogma_knight",
    atlas = 'Dogmatika',
    pos = { x = 2, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, 0 } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "RITUAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Dogmatika"] = true },
                summon_conditions = {
                    {
                        type = "RITUAL",
                        materials = {
                            { monster_archetypes = { "Dogmatika" } },
                            { monster_archetypes = { "Dogmatika" } },
                        }
                    }
                },
            },
            mult = 10
        },
    },
})
