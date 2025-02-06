-- Dragonmaid Archetype
SMODS.Atlas({
    key = "joy_Dragonmaid",
    path = "Dragonmaid.png",
    px = 71,
    py = 95
})

-- Kitchen Dragonmaid
SMODS.Joker({
    key = "dmaid_kitchen",
    atlas = 'joy_Dragonmaid',
    pos = { x = 0, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_dmaid_tinkhec
        end
        return { vars = { card.ability.extra.base_rerolls, card.ability.extra.rerolls } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "FIRE",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            base_rerolls = 1,
            rerolls = 1
        },
    },
    calculate = function(self, card, context)
        if context.setting_blind and not context.repetition and not context.individual then
            JoyousSpring.transform_card(card, "j_joy_dmaid_tinkhec")
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + card.ability.extra.rerolls
        calculate_reroll_cost(true)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls - card.ability.extra.rerolls
        calculate_reroll_cost(true)
    end,
    in_pool = function(self, args)
        return true
    end,
})

-- Dragonmaid Tinkhec
SMODS.Joker({
    key = "dmaid_tinkhec",
    atlas = 'Dragonmaid',
    pos = { x = 1, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_dmaid_kitchen
        end
        return { vars = { card.ability.extra.mult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "FIRE",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            mult = 20
        },
    },
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and not context.repetition and not context.individual then
            JoyousSpring.transform_card(card, "j_joy_dmaid_kitchen")
            return {}
        end
        if card.facing == 'back' then
            return {}
        end
        if context.other_joker and context.other_joker.ability.set == "Joker" and JoyousSpring.is_monster_archetype(context.other_joker, "Dragonmaid") then
            G.E_MANAGER:add_event(Event({
                func = function()
                    context.other_joker:juice_up(0.5, 0.5)
                    return true
                end,
            }))
            return {
                mult = card.ability.extra.mult,
            }
        end
    end,
    in_pool = function(self, args)
        return false
    end
})

-- Parlor Dragonmaid
SMODS.Joker({
    key = "dmaid_parlor",
    atlas = 'Dragonmaid',
    pos = { x = 2, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_dmaid_lorpar
        end
        return { vars = { card.ability.extra.discards, card.ability.extra.dragonmaid_count } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "WIND",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            discards = 1,
            dragonmaid_count = 5
        },
    },
    calculate = function(self, card, context)
        if context.setting_blind and not context.repetition and not context.individual then
            JoyousSpring.transform_card(card, "j_joy_dmaid_lorpar")
        end
    end,
    in_pool = function(self, args)
        return true
    end,
})

-- Dragonmaid Lorpar
SMODS.Joker({
    key = "dmaid_lorpar",
    atlas = 'Dragonmaid',
    pos = { x = 3, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_dmaid_parlor
        end
        return { vars = { card.ability.extra.chips } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "WIND",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            chips = 20
        },
    },
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and not context.repetition and not context.individual then
            JoyousSpring.transform_card(card, "j_joy_dmaid_parlor")
        end
        if card.facing == 'back' then
            return {}
        end
        if context.other_joker and context.other_joker.ability.set == "Joker" and JoyousSpring.is_monster_archetype(context.other_joker, "Dragonmaid") then
            G.E_MANAGER:add_event(Event({
                func = function()
                    context.other_joker:juice_up(0.5, 0.5)
                    return true
                end,
            }))
            return {
                chips = card.ability.extra.chips,
            }
        end
    end,
    in_pool = function(self, args)
        return false
    end
})

-- Nurse Dragonmaid
SMODS.Joker({
    key = "dmaid_nurse",
    atlas = 'Dragonmaid',
    pos = { x = 4, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    cost = 3,
    generate_ui = JoyousSpring.generate_info_ui,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_dmaid_ernus
        end
        return { vars = { card.ability.extra.revives } }
    end,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "EARTH",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            revives = 1
        },
    },
    calculate = function(self, card, context)
        if context.setting_blind and not context.repetition and not context.individual then
            JoyousSpring.transform_card(card, "j_joy_dmaid_ernus")
        end
    end,
    in_pool = function(self, args)
        return true
    end,
})

-- Dragonmaid Ernus
SMODS.Joker({
    key = "dmaid_ernus",
    atlas = 'Dragonmaid',
    pos = { x = 5, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_dmaid_nurse
        end
        return { vars = { card.ability.extra.mult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "EARTH",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            mult = 5
        },
    },
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and not context.repetition and not context.individual then
            JoyousSpring.transform_card(card, "j_joy_dmaid_nurse")
        end
    end,
    in_pool = function(self, args)
        return false
    end
})

-- Laundry Dragonmaid
SMODS.Joker({
    key = "dmaid_laundry",
    atlas = 'Dragonmaid',
    pos = { x = 0, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_dmaid_nudyarl
        end
        return { vars = { card.ability.extra.mill } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            mill = 3
        },
    },
    calculate = function(self, card, context)
        if context.setting_blind and not context.repetition and not context.individual then
            JoyousSpring.transform_card(card, "j_joy_dmaid_nudyarl")
        end
    end,
    in_pool = function(self, args)
        return true
    end,
})

-- Dragonmaid Nudyarl
SMODS.Joker({
    key = "dmaid_nudyarl",
    atlas = 'Dragonmaid',
    pos = { x = 1, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_dmaid_laundry
        end
        return { vars = { card.ability.extra.chips } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            chips = 10
        },
    },
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and not context.repetition and not context.individual then
            JoyousSpring.transform_card(card, "j_joy_dmaid_laundry")
        end
    end,
    in_pool = function(self, args)
        return false
    end
})

-- Chamber Dragonmaid
SMODS.Joker({
    key = "dmaid_chamber",
    atlas = 'Dragonmaid',
    pos = { x = 2, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_dmaid_stern
        end
        return { vars = { card.ability.extra.cards_to_add, card.ability.extra.dragonmaid_count } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "DARK",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            cards_to_add = 1,
            dragonmaid_count = 5
        },
    },
    calculate = function(self, card, context)
        if context.setting_blind and not context.repetition and not context.individual then
            JoyousSpring.transform_card(card, "j_joy_dmaid_stern")
        end
    end,
    in_pool = function(self, args)
        return true
    end,
})

-- Dragonmaid Stern
SMODS.Joker({
    key = "dmaid_stern",
    atlas = 'Dragonmaid',
    pos = { x = 3, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_dmaid_chamber
        end
        return {}
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "DARK",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
        },
    },
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and not context.repetition and not context.individual then
            JoyousSpring.transform_card(card, "j_joy_dmaid_chamber")
        end
    end,
    in_pool = function(self, args)
        return false
    end
})

-- House Dragonmaid
SMODS.Joker({
    key = "dmaid_house",
    atlas = 'Dragonmaid',
    pos = { x = 4, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_dmaid_sheou
        end
        return { vars = { card.ability.extra.base_x_mult, card.ability.extra.x_mult, card.ability.extra.blinds, 0 } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "FUSION",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
                summon_conditions = {
                    {
                        type = "fusion",
                        materials = {
                            { monster_archetypes = { "Dragonmaid" } },
                            { monster_archetypes = { "Dragonmaid" } }
                        }
                    }
                },
            },
            base_x_mult = 0.1,
            x_mult = 1,
            blinds = 3
        },
    },
    calculate = function(self, card, context)
        if context.setting_blind and not context.repetition and not context.individual then
            JoyousSpring.transform_card(card, "j_joy_dmaid_sheou")
        end
    end,
    in_pool = function(self, args)
        return true
    end,
})

-- Dragonmaid Sheou
SMODS.Joker({
    key = "dmaid_sheou",
    atlas = 'Dragonmaid',
    pos = { x = 5, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_dmaid_house
        end
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
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            cards_to_create = 1
        },
    },
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and not context.repetition and not context.individual then
            JoyousSpring.transform_card(card, "j_joy_dmaid_house")
        end
    end,
    in_pool = function(self, args)
        return false
    end,
})
