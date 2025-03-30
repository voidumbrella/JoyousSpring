--- DRAGONMAID
SMODS.Atlas({
    key = "joy_Dragonmaid",
    path = "01Dragonmaid.png",
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
    eternal_compat = true,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_transform" }
        end
        return { vars = { card.ability.extra.base_rerolls, card.ability.extra.rerolls } }
    end,
    joy_desc_cards = {
        { "j_joy_dmaid_tinkhec",                                      name = localize("k_joy_transforms_into") },
        { properties = { { monster_archetypes = { "Dragonmaid" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "FIRE",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            base_rerolls = 1,
            rerolls = 1
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card and not context.retrigger_joker and
                context.setting_blind and context.main_eval then
                JoyousSpring.transform_card(card, "j_joy_dmaid_tinkhec")
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff and not card.debuff then
            local count_graveyard = (next(SMODS.find_card("j_joy_dmaid_house")) or
                next(SMODS.find_card("j_joy_dmaid_sheou"))) and true
            local dragonmaid_count = JoyousSpring.count_materials_owned({ { monster_archetypes = { "Dragonmaid" } } }) +
                (count_graveyard and JoyousSpring.count_materials_in_graveyard({ { monster_archetypes = { "Dragonmaid" } } }) or 0)

            card.ability.extra.rerolls = card.ability.extra.base_rerolls * dragonmaid_count
            if not card.area or card.area ~= G.jokers then
                card.ability.extra.rerolls = card.ability.extra.rerolls + 1
            end
            G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + card.ability.extra.rerolls
            calculate_reroll_cost(true)
            card:juice_up()
        end
    end,
})

-- Dragonmaid Tinkhec
SMODS.Joker({
    key = "dmaid_tinkhec",
    atlas = 'Dragonmaid',
    pos = { x = 1, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_transform" }
        end
        return { vars = { card.ability.extra.mult } }
    end,
    joy_desc_cards = {
        { "j_joy_dmaid_kitchen",                                      name = localize("k_joy_transforms_into") },
        { properties = { { monster_archetypes = { "Dragonmaid" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "FIRE",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            mult = 20
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                JoyousSpring.transform_card(card, "j_joy_dmaid_kitchen")
            end
            if context.other_joker and JoyousSpring.is_monster_archetype(context.other_joker, "Dragonmaid") then
                return {
                    mult = card.ability.extra.mult,
                }
            end
            if context.joker_main then
                local count_graveyard = (next(SMODS.find_card("j_joy_dmaid_house")) or
                    next(SMODS.find_card("j_joy_dmaid_sheou"))) and true
                local dragonmaid_count = 0
                if count_graveyard then
                    dragonmaid_count = JoyousSpring.count_materials_in_graveyard({ { monster_archetypes = { "Dragonmaid" } } })
                    return {
                        mult = card.ability.extra.mult * dragonmaid_count,
                    }
                end
            end
        end
    end,
    in_pool = function(self, args)
        return args and args.source and args.source == "JoyousSpring" or false
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.MULT },
            calc_function = function(card)
                local count_graveyard = (next(SMODS.find_card("j_joy_dmaid_house")) or
                    next(SMODS.find_card("j_joy_dmaid_sheou"))) and true
                local dragonmaid_count = 0
                if count_graveyard then
                    dragonmaid_count = JoyousSpring.count_materials_in_graveyard({ { monster_archetypes = { "Dragonmaid" } } })
                end
                card.joker_display_values.mult = card.ability.extra.mult * dragonmaid_count
            end,
            mod_function = function(card, mod_joker)
                return {
                    mult = (JoyousSpring.is_monster_archetype(card, "Dragonmaid") and mod_joker.ability.extra.mult and
                        mod_joker.ability.extra.mult * JokerDisplay.calculate_joker_triggers(mod_joker) or nil)
                }
            end
        }
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
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = G.P_TAGS.tag_joy_booster
            if not JoyousSpring.config.disable_tooltips then
                info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_transform" }
            end
        end
        return {
            vars = { card.ability.extra.tags_to_add, card.ability.extra.dragonmaid_count,
                card.ability.extra.extra_dragonmaid_count }
        }
    end,
    joy_desc_cards = {
        { "j_joy_dmaid_lorpar",                                       name = localize("k_joy_transforms_into") },
        { properties = { { monster_archetypes = { "Dragonmaid" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WIND",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            tags_to_add = 1,
            dragonmaid_count = 5,
            extra_dragonmaid_count = 15
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card and not context.retrigger_joker and
                context.setting_blind and context.main_eval then
                JoyousSpring.transform_card(card, "j_joy_dmaid_lorpar")
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff and not card.debuff then
            local count_graveyard = (next(SMODS.find_card("j_joy_dmaid_house")) or
                next(SMODS.find_card("j_joy_dmaid_sheou"))) and true
            local dragonmaid_count = JoyousSpring.count_materials_owned({ { monster_archetypes = { "Dragonmaid" } } }) +
                (count_graveyard and JoyousSpring.count_materials_in_graveyard({ { monster_archetypes = { "Dragonmaid" } } }) or 0)
            if not card.area or card.area ~= G.jokers then
                dragonmaid_count = dragonmaid_count + 1
            end
            if dragonmaid_count >= card.ability.extra.dragonmaid_count then
                for j = 1, card.ability.extra.tags_to_add do
                    add_tag(Tag('tag_joy_booster'))
                end
            end
            local number_to_add = math.max(0,
                math.floor((dragonmaid_count - card.ability.extra.dragonmaid_count) /
                    card.ability.extra.extra_dragonmaid_count))
            for i = 1, number_to_add do
                for j = 1, card.ability.extra.tags_to_add do
                    add_tag(Tag('tag_joy_booster'))
                end
            end
            card:juice_up()
        end
    end,
})

-- Dragonmaid Lorpar
SMODS.Joker({
    key = "dmaid_lorpar",
    atlas = 'Dragonmaid',
    pos = { x = 3, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_transform" }
        end
        return { vars = { card.ability.extra.xmult } }
    end,
    joy_desc_cards = {
        { "j_joy_dmaid_parlor",                                       name = localize("k_joy_transforms_into") },
        { properties = { { monster_archetypes = { "Dragonmaid" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WIND",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            xmult = 1.1
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                JoyousSpring.transform_card(card, "j_joy_dmaid_parlor")
            end
            if context.other_joker and JoyousSpring.is_monster_archetype(context.other_joker, "Dragonmaid") then
                return {
                    xmult = card.ability.extra.xmult,
                }
            end
            if context.joker_main then
                local count_graveyard = (next(SMODS.find_card("j_joy_dmaid_house")) or
                    next(SMODS.find_card("j_joy_dmaid_sheou"))) and true
                local dragonmaid_count = 0
                if count_graveyard then
                    dragonmaid_count = JoyousSpring.count_materials_in_graveyard({ { monster_archetypes = { "Dragonmaid" } } })
                    return {
                        xmult = card.ability.extra.xmult ^ dragonmaid_count,
                    }
                end
            end
        end
    end,
    in_pool = function(self, args)
        return args and args.source and args.source == "JoyousSpring" or false
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
                local count_graveyard = (next(SMODS.find_card("j_joy_dmaid_house")) or
                    next(SMODS.find_card("j_joy_dmaid_sheou"))) and true
                local dragonmaid_count = 0
                if count_graveyard then
                    dragonmaid_count = JoyousSpring.count_materials_in_graveyard({ { monster_archetypes = { "Dragonmaid" } } })
                end
                card.joker_display_values.xmult = card.ability.extra.xmult ^ dragonmaid_count
            end,
            mod_function = function(card, mod_joker)
                return {
                    x_mult = (JoyousSpring.is_monster_archetype(card, "Dragonmaid") and mod_joker.ability.extra.xmult and
                        mod_joker.ability.extra.xmult ^ JokerDisplay.calculate_joker_triggers(mod_joker) or nil)
                }
            end
        }
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
    eternal_compat = true,
    cost = 3,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_revive" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_transform" }
        end
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.revives } }
    end,
    joy_desc_cards = {
        { "j_joy_dmaid_ernus",                                        name = localize("k_joy_transforms_into") },
        { properties = { { monster_archetypes = { "Dragonmaid" } } }, name = "k_joy_archetype" },
    },
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            revives = 1,
            odds = 3
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card and not context.retrigger_joker and
                context.setting_blind and context.main_eval then
                JoyousSpring.transform_card(card, "j_joy_dmaid_ernus")
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff and not card.debuff then
            local has_revived = false
            if pseudorandom("j_joy_dmaid_nurse") < G.GAME.probabilities.normal / card.ability.extra.odds then
                for i = 1, card.ability.extra.revives do
                    local revived_card = JoyousSpring.revive_pseudorandom(
                        { { rarity = 1, monster_archetypes = { "Dragonmaid" } } },
                        pseudoseed("j_joy_dmaid_nurse"),
                        true, nil, (card.edition and card.edition.negative and 0 or -1)
                    )
                    has_revived = (revived_card and true) or has_revived
                end
            end
            if has_revived then
                SMODS.calculate_effect({ message = localize("k_joy_revive") }, card)
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            extra = {
                {
                    { text = "(" },
                    { ref_table = "card.joker_display_values", ref_value = "odds" },
                    { text = ")" },
                }
            },
            extra_config = { colour = G.C.GREEN, scale = 0.3 },
            calc_function = function(card)
                card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
            end
        }
    end
})

-- Dragonmaid Ernus
SMODS.Joker({
    key = "dmaid_ernus",
    atlas = 'Dragonmaid',
    pos = { x = 0, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_transform" }
        end
        return { vars = { card.ability.extra.mult } }
    end,
    joy_desc_cards = {
        { "j_joy_dmaid_nurse",                                        name = localize("k_joy_transforms_into") },
        { properties = { { monster_archetypes = { "Dragonmaid" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            mult = 2
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                JoyousSpring.transform_card(card, "j_joy_dmaid_nurse")
            end

            if context.joker_main then
                local dragonmaid_count = JoyousSpring.count_materials_in_graveyard({ { monster_archetypes = { "Dragonmaid" } } })

                return {
                    mult = card.ability.extra.mult * dragonmaid_count,
                }
            end
        end
    end,
    in_pool = function(self, args)
        return args and args.source and args.source == "JoyousSpring" or false
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.MULT },
            calc_function = function(card)
                local dragonmaid_count = JoyousSpring.count_materials_in_graveyard({ { monster_archetypes = { "Dragonmaid" } } })
                card.joker_display_values.mult = card.ability.extra.mult * dragonmaid_count
            end,
        }
    end
})

-- Laundry Dragonmaid
SMODS.Joker({
    key = "dmaid_laundry",
    atlas = 'Dragonmaid',
    pos = { x = 1, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_main_deck_joker" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_transform" }
        end
        return { vars = { card.ability.extra.mill } }
    end,
    joy_desc_cards = {
        { "j_joy_dmaid_nudyarl",                                      name = localize("k_joy_transforms_into") },
        { properties = { { monster_archetypes = { "Dragonmaid" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WATER",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            mills = 3
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card and not context.retrigger_joker and
                context.setting_blind and context.main_eval then
                JoyousSpring.transform_card(card, "j_joy_dmaid_nudyarl")
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff and not card.debuff then
            local choices = JoyousSpring.get_materials_in_collection({ { monster_archetypes = { "Dragonmaid" }, is_main_deck = true } })

            for i = 1, card.ability.extra.mills do
                JoyousSpring.send_to_graveyard(pseudorandom_element(choices, pseudoseed("j_joy_dmaid_laundry")))
            end
            SMODS.calculate_effect({ message = localize("k_joy_mill") }, card)
        end
    end,
})

-- Dragonmaid Nudyarl
SMODS.Joker({
    key = "dmaid_nudyarl",
    atlas = 'Dragonmaid',
    pos = { x = 2, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_transform" }
        end
        return { vars = { card.ability.extra.chips } }
    end,
    joy_desc_cards = {
        { "j_joy_dmaid_laundry",                                      name = localize("k_joy_transforms_into") },
        { properties = { { monster_archetypes = { "Dragonmaid" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WATER",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            chips = 3
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                JoyousSpring.transform_card(card, "j_joy_dmaid_laundry")
            end

            if context.joker_main then
                local dragonmaid_count = JoyousSpring.count_materials_in_graveyard({ { monster_archetypes = { "Dragonmaid" } } })

                return {
                    chips = card.ability.extra.chips * dragonmaid_count,
                }
            end
        end
    end,
    in_pool = function(self, args)
        return args and args.source and args.source == "JoyousSpring" or false
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.CHIPS },
            calc_function = function(card)
                local dragonmaid_count = JoyousSpring.count_materials_in_graveyard({ { monster_archetypes = { "Dragonmaid" } } })
                card.joker_display_values.chips = card.ability.extra.chips * dragonmaid_count
            end,
        }
    end
})

-- Chamber Dragonmaid
SMODS.Joker({
    key = "dmaid_chamber",
    atlas = 'Dragonmaid',
    pos = { x = 3, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 2,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = G.P_TAGS.tag_voucher
            if not JoyousSpring.config.disable_tooltips then
                info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_transform" }
            end
        end
        return {
            vars = { card.ability.extra.tags_to_add, card.ability.extra.dragonmaid_count,
                card.ability.extra.extra_dragonmaid_count }
        }
    end,
    joy_desc_cards = {
        { "j_joy_dmaid_stern",                                        name = localize("k_joy_transforms_into") },
        { properties = { { monster_archetypes = { "Dragonmaid" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            tags_to_add = 1,
            dragonmaid_count = 5,
            extra_dragonmaid_count = 15
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card and not context.retrigger_joker and
                context.setting_blind and context.main_eval then
                JoyousSpring.transform_card(card, "j_joy_dmaid_stern")
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff and not card.debuff then
            local count_graveyard = (next(SMODS.find_card("j_joy_dmaid_house")) or
                next(SMODS.find_card("j_joy_dmaid_sheou"))) and true
            local dragonmaid_count = JoyousSpring.count_materials_owned({ { monster_archetypes = { "Dragonmaid" } } }) +
                (count_graveyard and JoyousSpring.count_materials_in_graveyard({ { monster_archetypes = { "Dragonmaid" } } }) or 0)
            if not card.area or card.area ~= G.jokers then
                dragonmaid_count = dragonmaid_count + 1
            end
            if dragonmaid_count >= card.ability.extra.dragonmaid_count then
                for j = 1, card.ability.extra.tags_to_add do
                    add_tag(Tag('tag_voucher'))
                end
            end
            local number_to_add = math.max(0,
                math.floor((dragonmaid_count - card.ability.extra.dragonmaid_count) /
                    card.ability.extra.extra_dragonmaid_count))
            for i = 1, number_to_add do
                for j = 1, card.ability.extra.tags_to_add do
                    add_tag(Tag('tag_voucher'))
                end
            end
        end
    end,
})

-- Dragonmaid Stern
SMODS.Joker({
    key = "dmaid_stern",
    atlas = 'Dragonmaid',
    pos = { x = 4, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 2,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_revive" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_transform" }
        end
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.revives } }
    end,
    joy_desc_cards = {
        { "j_joy_dmaid_chamber",                                      name = localize("k_joy_transforms_into") },
        { properties = { { monster_archetypes = { "Dragonmaid" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            revives = 1,
            odds = 3
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                JoyousSpring.transform_card(card, "j_joy_dmaid_chamber")
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff and not card.debuff then
            local has_revived = false
            if pseudorandom("j_joy_dmaid_stern") < G.GAME.probabilities.normal / card.ability.extra.odds then
                for i = 1, card.ability.extra.revives do
                    local revived_card
                    JoyousSpring.revive_pseudorandom(
                        {
                            { rarity = 2, monster_archetypes = { "Dragonmaid" } },
                            { rarity = 3, monster_archetypes = { "Dragonmaid" } },
                        },
                        pseudoseed("j_joy_dmaid_stern"),
                        true, nil, (card.edition and card.edition.negative and 0 or -1)
                    )
                    has_revived = revived_card and true or has_revived
                end
            end
            if has_revived then
                SMODS.calculate_effect({ message = localize("k_joy_revive") }, card)
            end
        end
    end,
    in_pool = function(self, args)
        return args and args.source and args.source == "JoyousSpring" or false
    end,
    joker_display_def = function(JokerDisplay)
        return {
            extra = {
                {
                    { text = "(" },
                    { ref_table = "card.joker_display_values", ref_value = "odds" },
                    { text = ")" },
                }
            },
            extra_config = { colour = G.C.GREEN, scale = 0.3 },
            calc_function = function(card)
                card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
            end
        }
    end
})

-- Lady's Dragonmaid
SMODS.Joker({
    key = "dmaid_lady",
    atlas = 'Dragonmaid',
    pos = { x = 0, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 9,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_transform" }
        end
        return {
            vars = { G.GAME.probabilities.normal, card.ability.extra.odds }
        }
    end,
    joy_desc_cards = {
        { "j_joy_dmaid_house",                                        name = localize("k_joy_adds") },
        { properties = { { monster_archetypes = { "Dragonmaid" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                summon_type = "FUSION",
                attribute = "LIGHT",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
                summon_conditions = {
                    {
                        type = "FUSION",
                        materials = {
                            { monster_archetypes = { "Dragonmaid" } },
                            {}
                        }
                    }
                },
            },
            odds = 3
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card and not context.retrigger_joker and
                context.setting_blind and context.main_eval then
                if pseudorandom("j_joy_dmaid_lady") < G.GAME.probabilities.normal / card.ability.extra.odds then
                    local choices = JoyousSpring.get_materials_in_collection({ { monster_archetypes = { "Dragonmaid" }, rarity = 2 } })
                    JoyousSpring.transform_card(card,
                        pseudorandom_element(choices, pseudoseed("j_joy_dmaid_lady")) or j_joy_dmaid_tinkhec)
                end
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff and not card.debuff then
            if #JoyousSpring.extra_deck_area.cards < JoyousSpring.extra_deck_area.config.card_limit then
                JoyousSpring.add_to_extra_deck("j_joy_dmaid_house")
                SMODS.calculate_effect({ message = localize("k_joy_add") }, card)
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            extra = {
                {
                    { text = "(" },
                    { ref_table = "card.joker_display_values", ref_value = "odds" },
                    { text = ")" },
                }
            },
            extra_config = { colour = G.C.GREEN, scale = 0.3 },
            calc_function = function(card)
                card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
            end
        }
    end
})

-- House Dragonmaid
SMODS.Joker({
    key = "dmaid_house",
    atlas = 'Dragonmaid',
    pos = { x = 1, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 9,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_transform" }
        end
        return {
            vars = {
                card.ability.extra.xmult,
                1 +
                (card.ability.extra.xmult * JoyousSpring.count_all_materials({ { monster_archetypes = { "Dragonmaid" } } })),
                card.ability.extra.blinds,
                math.min(card.ability.extra.blinds_won, 3)
            }
        }
    end,
    joy_desc_cards = {
        { "j_joy_dmaid_sheou",                                        name = localize("k_joy_transforms_into") },
        { properties = { { monster_archetypes = { "Dragonmaid" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                summon_type = "FUSION",
                attribute = "LIGHT",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
                summon_conditions = {
                    {
                        type = "FUSION",
                        materials = {
                            { monster_archetypes = { "Dragonmaid" } },
                            { monster_archetypes = { "Dragonmaid" } }
                        }
                    }
                },
            },
            xmult = 0.1,
            blinds = 3,
            blinds_won = 0
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval then
                card.ability.extra.blinds_won = card.ability.extra.blinds_won + 1
                if card.ability.extra.blinds_won >= 3 then
                    JoyousSpring.transform_card(card, "j_joy_dmaid_sheou")
                end
            end
            if context.joker_main then
                local dragonmaid_count = JoyousSpring.count_all_materials({ { monster_archetypes = { "Dragonmaid" } } })

                return {
                    xmult = 1 + (card.ability.extra.xmult * dragonmaid_count),
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
                        { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "exp" }
                    }
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.ability.extra", ref_value = "blinds_won" },
                { text = "/" },
                { ref_table = "card.ability.extra", ref_value = "blinds" },
                { text = ")" },
            },
            calc_function = function(card)
                local dragonmaid_count = JoyousSpring.count_all_materials({ { monster_archetypes = { "Dragonmaid" } } })
                card.joker_display_values.xmult = 1 + (card.ability.extra.xmult * dragonmaid_count)
            end,
        }
    end
})

-- Dragonmaid Sheou
SMODS.Joker({
    key = "dmaid_sheou",
    atlas = 'Dragonmaid',
    pos = { x = 2, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 9,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_transform" }
        end
        return { vars = { card.ability.extra.cards_to_create } }
    end,
    joy_desc_cards = {
        { "j_joy_dmaid_house",                                        name = localize("k_joy_transforms_into") },
        { properties = { { monster_archetypes = { "Dragonmaid" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                summon_type = "FUSION",
                attribute = "LIGHT",
                monster_type = "Dragon",
                monster_archetypes = { ["Dragonmaid"] = true },
            },
            cards_to_create = 1
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card and not context.retrigger_joker and
                context.setting_blind and context.main_eval then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.boss)) then
                    G.GAME.blind:disable()

                    for i = 1, card.ability.extra.cards_to_create do
                        JoyousSpring.create_pseudorandom({ { monster_archetypes = { "Dragonmaid" }, rarity = 1 } },
                            pseudoseed("j_joy_dmaid_sheou"), true)
                    end
                    JoyousSpring.transform_card(card, "j_joy_dmaid_house")
                    return { message = localize('ph_boss_disabled') }
                end
            end
        end
    end,
    in_pool = function(self, args)
        return args and args.source and args.source == "JoyousSpring" or false
    end,
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "dmaid" },
    label = "k_joy_archetype_dmaid"
}
