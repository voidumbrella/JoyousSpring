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
    blueprint_compat = true,
    eternal_compat = true,
    cost = 2,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.base_xmult, card.ability.extra.xmult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Dogmatika"] = true },
                revived = false,
                is_free = false,
            },
            base_xmult = 0.5,
            xmult = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.selling_card and JoyousSpring.is_extra_deck_monster(context.card) then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.base_xmult
                return {
                    message = localize('k_upgrade_ex')
                }
            end
            if context.joker_main then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
        if not context.blueprint_card and not context.retrigger_joker and
            context.end_of_round and context.game_over == false and context.main_eval then
            if G.GAME.blind.boss and card.ability.extra.xmult > 1 then
                card.ability.extra.xmult = 1
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                    }
                }
            },
        }
    end
})

-- Dogmatika Fleurdelis, the Knighted
SMODS.Joker({
    key = "dogma_fleur",
    atlas = 'Dogmatika',
    pos = { x = 1, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Dogmatika"] = true },
                revived = false,
                is_free = false,
            },
            mult = 50
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.other_joker and JoyousSpring.is_monster_archetype(context.other_joker, "Dogmatika") then
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
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            mod_function = function(card, mod_joker)
                return {
                    mult = (JoyousSpring.is_monster_archetype(card, "Dogmatika") and mod_joker.ability.extra.mult and
                        mod_joker.ability.extra.mult * JokerDisplay.calculate_joker_triggers(mod_joker) or nil)
                }
            end
        }
    end
})

-- Dogmatika Maximus
SMODS.Joker({
    key = "dogma_maximus",
    atlas = 'Dogmatika',
    pos = { x = 2, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 2,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Dogmatika"] = true },
                revived = false,
                is_free = false,
            },
            cards_to_create = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.setting_blind and context.main_eval then
                for i = 1, card.ability.extra.cards_to_create do
                    local key_to_add = pseudorandom_element(JoyousSpring.lists.extra_deck,
                        pseudoseed("j_joy_dogma_maximus"))
                    if key_to_add then
                        JoyousSpring.create_perma_debuffed_card(key_to_add, "Dogmatika", { negative = true })
                    end
                end
            end
        end
    end,
})

-- Dogmatika Adin, the Enlightened
SMODS.Joker({
    key = "dogma_adin",
    atlas = 'Dogmatika',
    pos = { x = 0, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 9,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Dogmatika"] = true },
                revived = false,
                is_free = false,
            },
            cards_to_create = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.end_of_round and context.game_over == false and context.main_eval then
                if G.GAME.blind.boss then
                    local choices = {
                        "j_joy_dogma_ecclesia",
                        "j_joy_dogma_fleur",
                        "j_joy_dogma_maximus",
                        "j_joy_dogma_adin",
                        "j_joy_dogma_theo",
                        "j_joy_dogma_ashiyan",
                        "j_joy_dogma_nexus",
                    }

                    for i = 1, card.ability.extra.cards_to_create do
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            SMODS.add_card({
                                key = pseudorandom_element(choices, pseudoseed("j_joy_dogma_adin"))
                            })
                        end
                    end
                end
            end
        end
    end,
    joy_set_cost = function(card)
        if JoyousSpring.count_materials_owned({ { is_extra_deck = true, is_debuffed = true } }) > 0 or
            (next(SMODS.find_card("j_joy_dogma_relic")) and
                JoyousSpring.count_materials_in_graveyard({ { is_extra_deck = true } }) > 0) then
            card.cost = 0
        end
    end,
})

-- Dogmatika Theo, the Iron Punch
SMODS.Joker({
    key = "dogma_theo",
    atlas = 'Dogmatika',
    pos = { x = 1, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chips * JoyousSpring.count_materials_owned({ { is_extra_deck = true, is_debuffed = true } }) } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Dogmatika"] = true },
                revived = false,
                is_free = false,
            },
            chips = 10
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.joker_main then
                local debuffed_ed_count = JoyousSpring.count_materials_owned({ { is_extra_deck = true, is_debuffed = true } })
                if next(SMODS.find_card("j_joy_dogma_relic")) then
                    debuffed_ed_count = debuffed_ed_count +
                        JoyousSpring.count_materials_in_graveyard({ { is_extra_deck = true } })
                end
                if debuffed_ed_count > 0 then
                    return {
                        chips = card.ability.extra.chips * debuffed_ed_count
                    }
                end
            end
        end
    end,
    joy_set_cost = function(card)
        if JoyousSpring.count_materials_owned({ { is_extra_deck = true, is_debuffed = true } }) > 0 or
            (next(SMODS.find_card("j_joy_dogma_relic")) and
                JoyousSpring.count_materials_in_graveyard({ { is_extra_deck = true } }) > 0) then
            card.cost = 0
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+", },
                { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" },
            },
            text_config = { colour = G.C.CHIPS },
            calc_function = function(card)
                local debuffed_ed_count = JoyousSpring.count_materials_owned({ { is_extra_deck = true, is_debuffed = true } })
                if next(SMODS.find_card("j_joy_dogma_relic")) then
                    debuffed_ed_count = debuffed_ed_count +
                        JoyousSpring.count_materials_in_graveyard({ { is_extra_deck = true } })
                end
                card.joker_display_values.chips = card.ability.extra.chips * debuffed_ed_count
            end
        }
    end
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
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Dogmatika"] = true },
                revived = false,
                is_free = false,
            },
            revives = 1
        },
    },
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff and not card.debuff then
            for i = 1, card.ability.extra.revives do
                JoyousSpring.revive_pseudorandom(
                    { { monster_archetypes = { "Dogmatika" } } },
                    pseudoseed("j_joy_dogma_ashiyan"),
                    true
                )
            end
        end
    end,
    joy_set_cost = function(card)
        if JoyousSpring.count_materials_owned({ { is_extra_deck = true, is_debuffed = true } }) > 0 or
            (next(SMODS.find_card("j_joy_dogma_relic")) and
                JoyousSpring.count_materials_in_graveyard({ { is_extra_deck = true } }) > 0) then
            card.cost = 0
        end
    end,
})

-- Dogmatika Nexus
SMODS.Joker({
    key = "dogma_nexus",
    atlas = 'Dogmatika',
    pos = { x = 0, y = 2 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.duplicates } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Dogmatika"] = true },
                revived = false,
                is_free = false,
            },
            duplicates = 2
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.end_of_round and context.game_over == false and context.main_eval then
                for i = 1, card.ability.extra.duplicates do
                    local choices = next(SMODS.find_card("j_joy_dogma_relic")) and
                        JoyousSpring.get_all_material_keys({ { is_extra_deck = true } }) or
                        JoyousSpring.get_materials_owned({ { is_extra_deck = true } })

                    local key_to_add = pseudorandom_element(choices, pseudoseed("j_joy_dogma_maximus"))
                    if key_to_add and type(key_to_add) ~= "string" then
                        key_to_add = key_to_add.config.center_key
                    end
                    if key_to_add then
                        JoyousSpring.create_perma_debuffed_card(key_to_add, "Dogmatika", { negative = true })
                    end
                end
            end
        end
    end,
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
        return {
            vars = {
                card.ability.extra.base_h_size,
                card.ability.extra.debuffed_ed_count,
                math.floor((JoyousSpring.count_materials_owned({ { is_extra_deck = true, is_debuffed = true } }) +
                        JoyousSpring.count_materials_in_graveyard({ { is_extra_deck = true } })) /
                    card.ability.extra.debuffed_ed_count)
            }

        }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
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
                            {},
                        }
                    }
                },
                revived = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            base_h_size = 1,
            h_size = 0,
            debuffed_ed_count = 5
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.hand_drawn and not context.blueprint_card and not context.retrigger_joker then
                local debuffed_ed_count = JoyousSpring.count_materials_owned({ { is_extra_deck = true, is_debuffed = true } }) +
                    JoyousSpring.count_materials_in_graveyard({ { is_extra_deck = true } })
                debuffed_ed_count = math.floor(debuffed_ed_count / card.ability.extra.debuffed_ed_count)
                if debuffed_ed_count ~= card.ability.extra.h_size then
                    G.hand:change_size(debuffed_ed_count - card.ability.extra.h_size)
                    card.ability.extra.h_size = debuffed_ed_count
                end
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff then
            local debuffed_ed_count = JoyousSpring.count_materials_owned({ { is_extra_deck = true, is_debuffed = true } }) +
                JoyousSpring.count_materials_in_graveyard({ { is_extra_deck = true } })
            debuffed_ed_count = math.floor(debuffed_ed_count / card.ability.extra.debuffed_ed_count)
            G.hand:change_size(debuffed_ed_count)
            card.ability.extra.h_size = debuffed_ed_count
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,
})

-- White Knight of Dogmatika
SMODS.Joker({
    key = "dogma_knight",
    atlas = 'Dogmatika',
    pos = { x = 2, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, 0 } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
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
                revived = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
            },
            mult = 10
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.joker_main then
                local debuffed_ed_count = JoyousSpring.count_materials_owned({ { is_extra_deck = true, is_debuffed = true } })
                if next(SMODS.find_card("j_joy_dogma_relic")) then
                    debuffed_ed_count = debuffed_ed_count +
                        JoyousSpring.count_materials_in_graveyard({ { is_extra_deck = true } })
                end
                if debuffed_ed_count > 0 then
                    return {
                        mult = card.ability.extra.mult * debuffed_ed_count
                    }
                end
            end
        end
    end,
    joy_create_card_for_shop = function(card, area)
        if card and JoyousSpring.is_extra_deck_monster(card) and next(SMODS.find_card("j_joy_dogma_knight")) then
            card.ability.extra.joyous_spring.is_free = true
            JoyousSpring.create_perma_debuffed_card(card, "Dogmatika")
            card:set_cost()
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+", },
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" },
            },
            text_config = { colour = G.C.MULT },
            calc_function = function(card)
                local debuffed_ed_count = JoyousSpring.count_materials_owned({ { is_extra_deck = true, is_debuffed = true } })
                if next(SMODS.find_card("j_joy_dogma_relic")) then
                    debuffed_ed_count = debuffed_ed_count +
                        JoyousSpring.count_materials_in_graveyard({ { is_extra_deck = true } })
                end
                card.joker_display_values.mult = card.ability.extra.mult * debuffed_ed_count
            end
        }
    end
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "dogma" },
    label = "k_joy_archetype_dogma"
}
