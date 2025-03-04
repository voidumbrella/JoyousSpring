--- GHOST GIRLS
SMODS.Atlas({
    key = "joy_Spright",
    path = "05Spright.png",
    px = 71,
    py = 95
})

-- Spright Blue
SMODS.Joker({
    key = "spright_blue",
    atlas = 'Spright',
    pos = { x = 0, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Thunder",
                monster_archetypes = { ["Spright"] = true }
            },
            cards_to_create = 1,
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.end_of_round and context.game_over == false and context.main_eval then
                local choices = {
                    "j_joy_spright_blue",
                    "j_joy_spright_jet",
                    "j_joy_spright_carrot",
                    "j_joy_spright_red",
                    "j_joy_spright_pixies",
                }

                for i = 1, card.ability.extra.cards_to_create do
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        SMODS.add_card({
                            key = pseudorandom_element(choices, pseudoseed("j_joy_spright_blue"))
                        })
                    end
                end
            end
        end
    end,
    joy_set_cost = function(card)
        if JoyousSpring.count_materials_owned({ { rarity = 2 } }) > 0 then
            card.cost = 0
        end
    end,
})

-- Spright Jet
SMODS.Joker({
    key = "spright_jet",
    atlas = 'Spright',
    pos = { x = 1, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 2,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mill } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Thunder",
                monster_archetypes = { ["Spright"] = true }
            },
            mill = 2,
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.setting_blind and context.main_eval then
                local choices = JoyousSpring.lists.uncommon

                for i = 1, card.ability.extra.mill do
                    JoyousSpring.send_to_graveyard(pseudorandom_element(choices, pseudoseed("j_joy_spright_jet")))
                end
            end
        end
    end,
    joy_set_cost = function(card)
        if JoyousSpring.count_materials_owned({ { rarity = 2 } }) > 0 then
            card.cost = 0
        end
    end,
})

-- Spright Carrot
SMODS.Joker({
    key = "spright_carrot",
    atlas = 'Spright',
    pos = { x = 2, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                1 + card.ability.extra.xmult *
                (JoyousSpring.count_materials_owned({ { rarity = 2 } }) + (next(SMODS.find_card("j_joy_spright_elf")) and JoyousSpring.count_materials_in_graveyard({ { rarity = 2 } }) or 0))
            }
        }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "FIRE",
                monster_type = "Thunder",
                monster_archetypes = { ["Spright"] = true }
            },
            xmult = 0.1,
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.joker_main then
                local uncommon_count = JoyousSpring.count_materials_owned({ { rarity = 2 } }) +
                    (next(SMODS.find_card("j_joy_spright_elf")) and JoyousSpring.count_materials_in_graveyard({ { rarity = 2 } }) or 0)
                return {
                    xmult = 1 + card.ability.extra.xmult * uncommon_count
                }
            end
        end
    end,
    joy_set_cost = function(card)
        if JoyousSpring.count_materials_owned({ { rarity = 2 } }) > 0 then
            card.cost = 0
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "exp" }
                    }
                }
            },
            calc_function = function(card)
                local uncommon_count = JoyousSpring.count_materials_owned({ { rarity = 2 } }) +
                    (next(SMODS.find_card("j_joy_spright_elf")) and JoyousSpring.count_materials_in_graveyard({ { rarity = 2 } }) or 0)
                card.joker_display_values.xmult = 1 + card.ability.extra.xmult * uncommon_count
            end
        }
    end
})

-- Spright Red
SMODS.Joker({
    key = "spright_red",
    atlas = 'Spright',
    pos = { x = 0, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.mult *
                (JoyousSpring.count_materials_owned({ { rarity = 2 } }) + (next(SMODS.find_card("j_joy_spright_elf")) and JoyousSpring.count_materials_in_graveyard({ { rarity = 2 } }) or 0))
            }
        }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "FIRE",
                monster_type = "Thunder",
                monster_archetypes = { ["Spright"] = true }
            },
            mult = 10,
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.joker_main then
                local uncommon_count = JoyousSpring.count_materials_owned({ { rarity = 2 } }) +
                    (next(SMODS.find_card("j_joy_spright_elf")) and JoyousSpring.count_materials_in_graveyard({ { rarity = 2 } }) or 0)
                return {
                    mult = card.ability.extra.mult * uncommon_count
                }
            end
        end
    end,
    joy_set_cost = function(card)
        if JoyousSpring.count_materials_owned({ { rarity = 2 } }) > 0 then
            card.cost = 0
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.MULT },
            calc_function = function(card)
                local uncommon_count = JoyousSpring.count_materials_owned({ { rarity = 2 } }) +
                    (next(SMODS.find_card("j_joy_spright_elf")) and JoyousSpring.count_materials_in_graveyard({ { rarity = 2 } }) or 0)
                card.joker_display_values.mult = card.ability.extra.mult * uncommon_count
            end
        }
    end
})

-- Spright Pixies
SMODS.Joker({
    key = "spright_pixies",
    atlas = 'Spright',
    pos = { x = 1, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.chips *
                (JoyousSpring.count_materials_owned({ { rarity = 2 } }) + (next(SMODS.find_card("j_joy_spright_elf")) and JoyousSpring.count_materials_in_graveyard({ { rarity = 2 } }) or 0))
            }
        }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Thunder",
                monster_archetypes = { ["Spright"] = true }
            },
            chips = 15,
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.joker_main then
                local uncommon_count = JoyousSpring.count_materials_owned({ { rarity = 2 } }) +
                    (next(SMODS.find_card("j_joy_spright_elf")) and JoyousSpring.count_materials_in_graveyard({ { rarity = 2 } }) or 0)
                return {
                    chips = card.ability.extra.chips * uncommon_count
                }
            end
        end
    end,
    joy_set_cost = function(card)
        if JoyousSpring.count_materials_owned({ { rarity = 2 } }) > 0 then
            card.cost = 0
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.CHIPS },
            calc_function = function(card)
                local uncommon_count = JoyousSpring.count_materials_owned({ { rarity = 2 } }) +
                    (next(SMODS.find_card("j_joy_spright_elf")) and JoyousSpring.count_materials_in_graveyard({ { rarity = 2 } }) or 0)
                card.joker_display_values.chips = card.ability.extra.chips * uncommon_count
            end
        }
    end
})

-- Spright Elf
SMODS.Joker({
    key = "spright_elf",
    atlas = 'Spright',
    pos = { x = 0, y = 2 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.revives } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                summon_type = "LINK",
                attribute = "FIRE",
                monster_type = "Thunder",
                monster_archetypes = { ["Spright"] = true },
                summon_conditions = {
                    {
                        type = "LINK",
                        materials = {
                            { rarity = 2 },
                            { rarity = 2 }
                        }
                    }
                }
            },
            revives = 1,
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.setting_blind and context.main_eval then
                for i = 1, card.ability.extra.revives do
                    JoyousSpring.revive_pseudorandom(
                        { { rarity = 2 } },
                        pseudoseed("j_joy_spright_elf"),
                        true
                    )
                end
            end
        end
    end,
})

-- Spright Sprind
SMODS.Joker({
    key = "spright_sprind",
    atlas = 'Spright',
    pos = { x = 1, y = 2 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.base_materials, card.ability.extra.detached } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                summon_type = "LINK",
                attribute = "FIRE",
                monster_type = "Thunder",
                monster_archetypes = { ["Spright"] = true },
                summon_conditions = {
                    {
                        type = "LINK",
                        materials = {
                            { rarity = 2, summon_type = "XYZ" },
                            { rarity = 2 }
                        }
                    }
                }
            },
            base_materials = 2,
            detached = 0
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and context.joy_detach then
                card.ability.extra.detached = card.ability.extra.detached + 1
                if card.ability.extra.detached >= card.ability.extra.base_materials then
                    card.ability.extra.detached = 0
                    if #JoyousSpring.extra_deck_area.cards < JoyousSpring.extra_deck_area.config.card_limit then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                card:juice_up(0.5, 0.5)
                                return true
                            end,
                        }))
                        JoyousSpring.add_to_extra_deck("j_joy_spright_gigantic")
                    end
                end
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff then
            for _, joker in ipairs(G.jokers.cards) do
                if joker.config.center.rarity == 2 then
                    if not joker.edition then
                        joker:set_edition({ negative = true })
                    end
                else
                    SMODS.debuff_card(joker, true, "j_joy_spright_sprind")
                end
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        for _, joker in ipairs(G.jokers.cards) do
            SMODS.debuff_card(joker, false, "j_joy_spright_sprind")
        end
    end,
    joy_apply_to_jokers_added = function(card)
        if card.config.center.rarity == 2 then
            if not card.edition then
                card:set_edition({ negative = true })
            end
        else
            SMODS.debuff_card(card, true, "j_joy_spright_sprind")
        end
    end
})

-- Gigantic Spright
SMODS.Joker({
    key = "spright_gigantic",
    atlas = 'Spright',
    pos = { x = 2, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    update = function(self, card, dt)
        if card.area and card.area == G.jokers then
            if not card.children.xyz_materials and card.ability.extra.joyous_spring.xyz_materials then
                card.children.xyz_materials = JoyousSpring.create_UIBox_xyz_materials(card)
            end
        end
    end,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                summon_type = "XYZ",
                attribute = "DARK",
                monster_type = "Thunder",
                monster_archetypes = { ["Spright"] = true },
                summon_conditions = {
                    {
                        type = "XYZ",
                        materials = {
                            { rarity = 2, exclude_tokens = true, exclude_summon_types = { "XYZ" } },
                            { rarity = 2, exclude_tokens = true, exclude_summon_types = { "XYZ" } }
                        },
                    }
                }
            },
            cards_to_create = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.joy_detach and context.joy_detaching_card == card then
                local choices, _ = get_current_pool("Joker", "Uncommon", nil, "JoyousSpring")

                for i = 1, card.ability.extra.cards_to_create do
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        local it = 0
                        local center = pseudorandom_element(choices, pseudoseed("j_joy_spright_gigantic"))
                        while center == 'UNAVAILABLE' do
                            it = it + 1
                            center = pseudorandom_element(choices,
                                pseudoseed("j_joy_spright_gigantic" .. '_resample' .. it))
                        end
                        SMODS.add_card({
                            key = center
                        })
                    end
                end
            end
        end
    end,
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "spright" },
    label = "k_joy_archetype_spright"
}
