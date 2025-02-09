--- GHOST GIRLS
SMODS.Atlas({
    key = "joy_GhostGirls",
    path = "04GhostGirls.png",
    px = 71,
    py = 95
})

-- Ghost Ogre & Snow Rabbit
SMODS.Joker({
    key = "yokai_ogre",
    atlas = 'GhostGirls',
    pos = { x = 0, y = 0 },
    rarity = 4,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 12,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.base_xmult, card.ability.extra.xmult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                is_tuner = true,
                attribute = "LIGHT",
                monster_type = "Psychic",
                monster_archetypes = {},
            },
            base_xmult = 0.2,
            xmult = 1
        },
    },
})


-- Ghost Reaper & Winter Cherries
SMODS.Joker({
    key = "yokai_reaper",
    atlas = 'GhostGirls',
    pos = { x = 1, y = 0 },
    rarity = 4,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 12,
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
                is_tuner = true,
                attribute = "DARK",
                monster_type = "Zombie",
                monster_archetypes = {},
            },
            xmult = 0.2
        },
    },
})



-- Ash Blossom & Joyous Spring
SMODS.Joker({
    key = "yokai_ash",
    atlas = 'GhostGirls',
    pos = { x = 2, y = 0 },
    rarity = 4,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 12,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.base_xmult, card.ability.extra.xmult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                is_tuner = true,
                attribute = "FIRE",
                monster_type = "Zombie",
                monster_archetypes = {},
            },
            odds = 2,
            base_xmult = 0.5,
            xmult = 1
        },
    },
})



-- Ghost Belle & Haunted Mansion
SMODS.Joker({
    key = "yokai_belle",
    atlas = 'GhostGirls',
    pos = { x = 0, y = 1 },
    rarity = 4,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 12,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.base_xmult, card.ability.extra.xmult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                is_tuner = true,
                attribute = "EARTH",
                monster_type = "Zombie",
                monster_archetypes = {},
            },
            base_xmult = 0.2,
            xmult = 1
        },
    },
})




-- Ghost Sister & Spooky Dogwood
SMODS.Joker({
    key = "yokai_sister",
    atlas = 'GhostGirls',
    pos = { x = 1, y = 1 },
    rarity = 4,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 12,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.base_xmult, card.ability.extra.xmult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                is_tuner = true,
                attribute = "WATER",
                monster_type = "Zombie",
                monster_archetypes = {},
            },
            base_xmult = 0.2,
            xmult = 1
        },
    },
})



-- Ghost Mourner & Moonlit Chill
SMODS.Joker({
    key = "yokai_mourner",
    atlas = 'GhostGirls',
    pos = { x = 2, y = 1 },
    rarity = 4,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 12,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.base_xmult, card.ability.extra.xmult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                is_tuner = true,
                attribute = "WIND",
                monster_type = "Zombie",
                monster_archetypes = {},
            },
            base_xmult = 0.2,
            xmult = 1
        },
    },
})
