--- RUNICK
SMODS.Atlas({
    key = "joy_Runick",
    path = "10Runick.png",
    px = 71,
    py = 95
})

-- Hugin the Runick Wings
SMODS.Joker({
    key = "runick_hugin",
    atlas = 'Runick',
    pos = { x = 1, y = 0 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_runick_fountain
        end

        return { vars = { card.ability.extra.extra_slots, card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "FUSION",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Fairy",
                monster_archetypes = { ["Runick"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            extra_slots = 1,
            cards_to_create = 1
        },
    },
})

-- Munin the Runick Wings
SMODS.Joker({
    key = "runick_munin",
    atlas = 'Runick',
    pos = { x = 2, y = 0 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.extra_slots, card.ability.extra.chips, 0 } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "FUSION",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Fairy",
                monster_archetypes = { ["Runick"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            extra_slots = 1,
            chips = 20
        },
    },
})

-- Geri the Runick Fangs
SMODS.Joker({
    key = "runick_geri",
    atlas = 'Runick',
    pos = { x = 0, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_runick_fountain
        end
        return { vars = { card.ability.extra.fields_to_create, card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "FUSION",
                is_effect = true,
                attribute = "DARK",
                monster_type = "Beast",
                monster_archetypes = { ["Runick"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            fields_to_create = 1,
            cards_to_create = 2
        },
    },
})

-- Freki the Runick Fangs
SMODS.Joker({
    key = "runick_freki",
    atlas = 'Runick',
    pos = { x = 1, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.playing_cards_to_create, card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "FUSION",
                is_effect = true,
                attribute = "DARK",
                monster_type = "Beast",
                monster_archetypes = { ["Runick"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            playing_cards_to_create = 1,
            cards_to_create = 2
        },
    },
})

-- Sleipnir the Runick Mane
SMODS.Joker({
    key = "runick_sleipnir",
    atlas = 'Runick',
    pos = { x = 2, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "FUSION",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Beast",
                monster_archetypes = { ["Runick"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            cards_to_create = 2
        },
    },
})

-- Runick Fountain
SMODS.Joker({
    key = "runick_fountain",
    atlas = 'Runick',
    pos = { x = 0, y = 0 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_destroy } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_field_spell = true,
                monster_archetypes = { ["Runick"] = true },
            },
            cards_to_destroy = 5
        },
    },
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "runick" },
    label = "k_joy_archetype_runick"
}
