--- GENERAIDER
SMODS.Atlas({
    key = "joy_Generaider",
    path = "07Generaider.png",
    px = 71,
    py = 95
})

-- Loptr, Shadow of the Generaider Bosses
SMODS.Joker({
    key = "generaider_loptr",
    atlas = 'Generaider',
    pos = { x = 0, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_generaider_boss_stage
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
                attribute = "FIRE",
                monster_type = "Fairy",
                monster_archetypes = { ["Generaider"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind.boss then
                if #JoyousSpring.field_spell_area.cards < JoyousSpring.field_spell_area.config.card_limit then
                    JoyousSpring.add_to_extra_deck("j_joy_generaider_boss_stage")
                    card:start_dissolve()
                end
            end
        end
    end,
})

-- Vala, Seidhr of the Generaider Bosses
SMODS.Joker({
    key = "generaider_vala",
    atlas = 'Generaider',
    pos = { x = 1, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 5,
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
                attribute = "FIRE",
                monster_type = "Fairy",
                monster_archetypes = { ["Generaider"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            revives = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind.boss then
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit +
                    ((card.edition and card.edition.negative) and 0 or 1) then
                    for i = 1, card.ability.extra.revives do
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit +
                            ((card.edition and card.edition.negative) and 0 or 1) then
                            JoyousSpring.revive_pseudorandom(
                                { { rarity = 3, monster_archetypes = { "Generaider" } } },
                                pseudoseed("j_joy_generaider_vala"),
                                false
                            )
                        end
                    end
                    card:start_dissolve()
                end
            end
        end
    end,
})

-- Harr, Generaider Boss of Storms
SMODS.Joker({
    key = "generaider_harr",
    atlas = 'Generaider',
    pos = { x = 2, y = 0 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tributes } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "DARK",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Generaider"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            tributes = 2
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' and not context.blueprint_card then
            if context.joy_activate_effect and context.joy_activated_card == card then
                local generaiders = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Generaider" } } })
                local spellcasters = JoyousSpring.get_materials_owned({ { monster_type = "Spellcaster" } })
                local tokens = SMODS.merge_lists({ generaiders, spellcasters })
                if next(tokens) then
                    JoyousSpring.create_overlay_effect_selection(card, tokens, card.ability.extra.tributes,
                        card.ability.extra.tributes)
                end
            end
            if context.joy_exit_effect_selection and context.joy_card == card and
                #context.joy_selection == card.ability.extra.tributes then
                for _, selected_card in ipairs(context.joy_selection) do
                    selected_card:start_dissolve()
                end
                G.GAME.blind:disable()
            end
        end
    end,
    joy_can_activate = function(card)
        local generaiders = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Generaider" } } })
        local spellcasters = JoyousSpring.get_materials_owned({ { monster_type = "Spellcaster" } })
        local tokens = SMODS.merge_lists({ generaiders, spellcasters })
        return (G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.boss)) and next(tokens)) and
            true or false
    end,
    in_pool = function(self, args)
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- Nidhogg, Generaider Boss of Ice
SMODS.Joker({
    key = "generaider_nidhogg",
    atlas = 'Generaider',
    pos = { x = 3, y = 0 },
    rarity = 3,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tributes } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "WATER",
                monster_type = "Wyrm",
                monster_archetypes = { ["Generaider"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            tributes = 2,
            active = false
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card then
                if context.joy_activate_effect and context.joy_activated_card == card then
                    local generaiders = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Generaider" } } })
                    local wyrms = JoyousSpring.get_materials_owned({ { monster_type = "Wyrm" } })
                    local tokens = SMODS.merge_lists({ generaiders, wyrms })
                    if next(tokens) then
                        JoyousSpring.create_overlay_effect_selection(card, tokens, card.ability.extra.tributes,
                            card.ability.extra.tributes)
                    end
                end
                if context.joy_exit_effect_selection and context.joy_card == card and
                    #context.joy_selection == card.ability.extra.tributes then
                    for _, selected_card in ipairs(context.joy_selection) do
                        selected_card:start_dissolve()
                    end
                    card.ability.extra.active = true
                end
                if context.end_of_round and context.game_over == false and context.main_eval then
                    card.ability.extra.active = false
                end
            end
            if context.repetition and context.cardarea == G.play then
                if card.ability.extra.active then
                    return {
                        repetitions = 1
                    }
                end
            end
        end
    end,
    joy_can_activate = function(card)
        local generaiders = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Generaider" } } })
        local wyrms = JoyousSpring.get_materials_owned({ { monster_type = "Wyrm" } })
        local tokens = SMODS.merge_lists({ generaiders, wyrms })
        return (not card.ability.extra.active and next(tokens)) and
            true or false
    end,
    in_pool = function(self, args)
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- Frodi, Generaider Boss of Swords
SMODS.Joker({
    key = "generaider_frodi",
    atlas = 'Generaider',
    pos = { x = 0, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "WIND",
                monster_type = "Warrior",
                monster_archetypes = { ["Generaider"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            hand_gain = 0
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card then
                if context.joy_activate_effect and context.joy_activated_card == card then
                    local generaiders = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Generaider" } } })
                    local warriors = JoyousSpring.get_materials_owned({ { monster_type = "Warrior" } })
                    local tokens = SMODS.merge_lists({ generaiders, warriors })
                    if next(tokens) then
                        JoyousSpring.create_overlay_effect_selection(card, tokens, 1, 52)
                    end
                end
                if context.joy_exit_effect_selection and context.joy_card == card and
                    #context.joy_selection > 0 then
                    local count = #context.joy_selection
                    for _, selected_card in ipairs(context.joy_selection) do
                        selected_card:start_dissolve()
                    end
                    G.hand:change_size(count)
                    card.ability.extra.hand_gain = card.ability.extra.hand_gain + count
                end
                if context.end_of_round and context.game_over == false and context.main_eval then
                    G.hand:change_size(-card.ability.extra.hand_gain)
                    card.ability.extra.hand_gain = 0
                end
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.hand_gain)
        card.ability.extra.hand_gain = 0
    end,
    joy_can_activate = function(card)
        local generaiders = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Generaider" } } })
        local warriors = JoyousSpring.get_materials_owned({ { monster_type = "Warrior" } })
        local tokens = SMODS.merge_lists({ generaiders, warriors })
        return (next(tokens)) and true or false
    end,
    in_pool = function(self, args)
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- Utgarda, Generaider Boss of Delusion
SMODS.Joker({
    key = "generaider_utgarda",
    atlas = 'Generaider',
    pos = { x = 1, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tributes } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Rock",
                monster_archetypes = { ["Generaider"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            tributes = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' and not context.blueprint_card then
            if context.joy_activate_effect and context.joy_activated_card == card then
                local generaiders = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Generaider" } } })
                local rocks = JoyousSpring.get_materials_owned({ { monster_type = "Rock" } })
                local tokens = SMODS.merge_lists({ generaiders, rocks })
                if next(tokens) then
                    JoyousSpring.create_overlay_effect_selection(card, tokens, card.ability.extra.tributes,
                        card.ability.extra.tributes)
                end
            end
            if context.joy_exit_effect_selection and context.joy_card == card and
                #context.joy_selection == card.ability.extra.tributes then
                for _, selected_card in ipairs(context.joy_selection) do
                    selected_card:start_dissolve()
                end
                local choices = G.consumeables.cards
                local to_banish = pseudorandom_element(choices, pseudoseed("j_joy_generaider_utgarda"))
                if to_banish then
                    JoyousSpring.banish(to_banish, "blind_selected")
                end
            end
        end
    end,
    joy_can_activate = function(card)
        local generaiders = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Generaider" } } })
        local rocks = JoyousSpring.get_materials_owned({ { monster_type = "Rock" } })
        local tokens = SMODS.merge_lists({ generaiders, rocks })
        return (#G.consumeables.cards > 0 and next(tokens)) and
            true or false
    end,
    in_pool = function(self, args)
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- Mardel, Generaider Boss of Light
SMODS.Joker({
    key = "generaider_mardel",
    atlas = 'Generaider',
    pos = { x = 2, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tributes, card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "LIGHT",
                monster_type = "Plant",
                monster_archetypes = { ["Generaider"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            tributes = 1,
            cards_to_create = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' and not context.blueprint_card then
            if context.joy_activate_effect and context.joy_activated_card == card then
                local generaiders = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Generaider" } } })
                local plants = JoyousSpring.get_materials_owned({ { monster_type = "Plant" } })
                local tokens = SMODS.merge_lists({ generaiders, plants })
                if next(tokens) then
                    JoyousSpring.create_overlay_effect_selection(card, tokens, card.ability.extra.tributes,
                        card.ability.extra.tributes)
                end
            end
            if context.joy_exit_effect_selection and context.joy_card == card and
                #context.joy_selection == card.ability.extra.tributes then
                for _, selected_card in ipairs(context.joy_selection) do
                    selected_card:start_dissolve()
                end
                local choices = {
                    "j_joy_generaider_loptr",
                    "j_joy_generaider_vala",
                }
                for i = 1, card.ability.extra.cards_to_create do
                    if #G.jokers.cards + G.GAME.joker_buffer - card.ability.extra.tributes < G.jokers.config.card_limit then
                        SMODS.add_card({
                            key = pseudorandom_element(choices, pseudoseed("j_joy_generaider_mardel"))
                        })
                    end
                end
            end
        end
    end,
    joy_can_activate = function(card)
        local generaiders = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Generaider" } } })
        local plants = JoyousSpring.get_materials_owned({ { monster_type = "Plant" } })
        local tokens = SMODS.merge_lists({ generaiders, plants })
        return (#G.jokers.cards + G.GAME.joker_buffer - card.ability.extra.tributes < G.jokers.config.card_limit and next(tokens)) and
            true or false
    end,
    in_pool = function(self, args)
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- Dovelgus, Generaider Boss of Iron
SMODS.Joker({
    key = "generaider_dovelgus",
    atlas = 'Generaider',
    pos = { x = 3, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tributes, card.ability.extra.xmult } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "EARTH",
                monster_type = "Machine",
                monster_archetypes = { ["Generaider"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            tributes = 2,
            xmult = 4
        },
        active = false
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card then
                if context.joy_activate_effect and context.joy_activated_card == card then
                    local generaiders = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Generaider" } } })
                    local machines = JoyousSpring.get_materials_owned({ { monster_type = "Machine" } })
                    local tokens = SMODS.merge_lists({ generaiders, machines })
                    if next(tokens) then
                        JoyousSpring.create_overlay_effect_selection(card, tokens, card.ability.extra.tributes,
                            card.ability.extra.tributes)
                    end
                end
                if context.joy_exit_effect_selection and context.joy_card == card and
                    #context.joy_selection == card.ability.extra.tributes then
                    for _, selected_card in ipairs(context.joy_selection) do
                        selected_card:start_dissolve()
                    end
                    card.ability.extra.active = true
                end
                if context.end_of_round and context.game_over == false and context.main_eval then
                    card.ability.extra.active = false
                end
            end
            if context.other_joker and (JoyousSpring.is_monster_archetype(context.other_joker, "Generaider") or
                    JoyousSpring.is_monster_type(context.other_joker, "Machine")) then
                if card.ability.extra.active then
                    return {
                        xmult = card.ability.extra.xmult
                    }
                end
            end
        end
    end,
    joy_can_activate = function(card)
        local generaiders = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Generaider" } } })
        local machines = JoyousSpring.get_materials_owned({ { monster_type = "Machine" } })
        local tokens = SMODS.merge_lists({ generaiders, machines })
        return (not card.ability.extra.active and next(tokens)) and
            true or false
    end,
    in_pool = function(self, args)
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- Naglfar, Generaider Boss of Fire
SMODS.Joker({
    key = "generaider_naglfar",
    atlas = 'Generaider',
    pos = { x = 0, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tributes, card.ability.extra.hands, card.ability.extra.discards } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "FIRE",
                monster_type = "BeastWarrior",
                monster_archetypes = { ["Generaider"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            tributes = 2,
            hands = 1,
            discards = 1,
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card then
                if context.joy_activate_effect and context.joy_activated_card == card then
                    local generaiders = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Generaider" } } })
                    local beastwarriors = JoyousSpring.get_materials_owned({ { monster_type = "BeastWarrior" } })
                    local tokens = SMODS.merge_lists({ generaiders, beastwarriors })
                    if next(tokens) then
                        JoyousSpring.create_overlay_effect_selection(card, tokens, card.ability.extra.tributes,
                            card.ability.extra.tributes)
                    end
                end
                if context.joy_exit_effect_selection and context.joy_card == card and
                    #context.joy_selection == card.ability.extra.tributes then
                    for _, selected_card in ipairs(context.joy_selection) do
                        selected_card:start_dissolve()
                    end
                    ease_hands_played(card.ability.extra.hands)
                    ease_discard(card.ability.extra.discards)
                end
            end
        end
    end,
    joy_can_activate = function(card)
        local generaiders = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Generaider" } } })
        local beastwarriors = JoyousSpring.get_materials_owned({ { monster_type = "BeastWarrior" } })
        local tokens = SMODS.merge_lists({ generaiders, beastwarriors })
        return (G.GAME.blind and G.GAME.blind.in_blind and next(tokens)) and true or false
    end,
    in_pool = function(self, args)
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- Hela, Generaider Boss of Doom
SMODS.Joker({
    key = "generaider_hela",
    atlas = 'Generaider',
    pos = { x = 1, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tributes, card.ability.extra.revives } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = true,
                summon_type = "NORMAL",
                is_effect = true,
                attribute = "DARK",
                monster_type = "Zombie",
                monster_archetypes = { ["Generaider"] = true },
                revived = false,
                perma_debuffed = false,
                is_free = false,
            },
            tributes = 3,
            revives = 1,
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card then
                if context.joy_activate_effect and context.joy_activated_card == card then
                    local generaiders = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Generaider" } } })
                    local zombies = JoyousSpring.get_materials_owned({ { monster_type = "Zombie" } })
                    local tokens = SMODS.merge_lists({ generaiders, zombies })
                    if next(tokens) then
                        JoyousSpring.create_overlay_effect_selection(card, tokens, card.ability.extra.tributes,
                            card.ability.extra.tributes)
                    end
                end
                if context.joy_exit_effect_selection and context.joy_card == card and
                    #context.joy_selection == card.ability.extra.tributes then
                    for _, selected_card in ipairs(context.joy_selection) do
                        selected_card:start_dissolve()
                    end
                    for i = 1, card.ability.extra.revives do
                        JoyousSpring.revive_pseudorandom(
                            { { rarity = 3, monster_archetypes = { "Generaider" } } },
                            pseudoseed("j_joy_generaider_hela"),
                            false,
                            { negative = true }
                        )
                    end
                end
            end
        end
    end,
    joy_can_activate = function(card)
        local generaiders = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Generaider" } } })
        local zombies = JoyousSpring.get_materials_owned({ { monster_type = "Zombie" } })
        local tokens = SMODS.merge_lists({ generaiders, zombies })
        return (G.GAME.blind and G.GAME.blind.in_blind and next(tokens)) and true or false
    end,
    in_pool = function(self, args)
        return args.source and args.source == "JoyousSpring" or false
    end,
})

-- Jormungandr, Generaider Boss of Eternity
SMODS.Joker({
    key = "generaider_jormungandr",
    atlas = 'Generaider',
    pos = { x = 3, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.joyous_spring.xyz_materials * card.ability.extra.mult, card.ability.extra.detach, card.ability.extra.hsize } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    update = function(self, card, dt)
        if card.area and card.area == G.jokers then
            if not card.children.xyz_materials and card.ability.extra.joyous_spring.xyz_materials then
                card.children.xyz_materials = JoyousSpring.create_UIBox_xyz_materials(card)
            end
        end
    end,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "XYZ",
                is_effect = true,
                attribute = "EARTH",
                monster_type = "Reptile",
                monster_archetypes = { ["Generaider"] = true },
                summon_conditions = {
                    {
                        type = "XYZ",
                        materials = {
                            { min = 2, rarity = 3, exclude_tokens = true, exclude_summon_types = { "XYZ", "LINK" } },
                        },
                    }
                },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
                xyz_materials = 0
            },
            mult = 100,
            detach = 2,
            hsize = 1,
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.joy_detach and context.joy_detaching_card == card then
                G.hand:change_size(card.ability.extra.hsize)
            end
            if context.joker_main then
                return {
                    mult = card.ability.extra.joyous_spring.xyz_materials * card.ability.extra.mult
                }
            end
        end
    end,
})

-- Laevatein, Generaider Boss of Shadows
SMODS.Joker({
    key = "generaider_laevatein",
    atlas = 'Generaider',
    pos = { x = 0, y = 3 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 12,
    loc_vars = function(self, info_queue, card)
        if not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_joy_generaider_jormungandr
        end
        return { vars = { card.ability.extra.detach } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_main_deck = false,
                summon_type = "XYZ",
                is_effect = true,
                attribute = "FIRE",
                monster_type = "Fairy",
                monster_archetypes = { ["Generaider"] = true },
                summon_conditions = {
                    {
                        type = "XYZ",
                        materials = {
                            { rarity = 3, exclude_tokens = true, exclude_summon_types = { "XYZ", "LINK" } },
                            { rarity = 3, exclude_tokens = true, exclude_summon_types = { "XYZ", "LINK" } },
                            { rarity = 3, exclude_tokens = true, exclude_summon_types = { "XYZ", "LINK" } },
                            { rarity = 3, exclude_tokens = true, exclude_summon_types = { "XYZ", "LINK" } },
                            { rarity = 3, exclude_tokens = true, exclude_summon_types = { "XYZ", "LINK" } },
                        },
                    }
                },
                revived = false,
                perma_debuffed = false,
                is_free = false,
                summoned = false,
                summon_materials = {},
                xyz_materials = 0
            },
            detach = 5
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and not context.retrigger_joker and
                context.joy_detach and context.joy_detaching_card == card then
                for _, joker in ipairs(G.jokers.cards) do
                    if joker ~= card then
                        joker:start_dissolve()
                    end
                end
                local added_card = SMODS.add_card({
                    key = "j_joy_generaider_jormungandr"
                })
                added_card.ability.extra.joyous_spring.xyz_materials = JoyousSpring.get_graveyard_count()
                JoyousSpring.empty_graveyard()
            end
        end
    end,
})

-- Generaider Boss Stage
SMODS.Joker({
    key = "generaider_boss_stage",
    atlas = 'Generaider',
    pos = { x = 2, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 15,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tributes, card.ability.extra.cards_to_create } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    config = {
        extra = {
            joyous_spring = {
                is_field_spell = true,
                monster_archetypes = { ["Generaider"] = true },
            },
            tributes = 2,
            cards_to_create = 1,
        },
    },
    calculate = function(self, card, context)
        if context.setting_blind and context.main_eval then
            while #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit do
                JoyousSpring.summon_token("generaider")
            end
        end
        if context.joy_activate_effect and context.joy_activated_card == card then
            local tokens = JoyousSpring.get_materials_owned({ { key = "j_joy_token", monster_archetypes = { "Generaider" } } })
            if next(tokens) then
                JoyousSpring.create_overlay_effect_selection(card, tokens, card.ability.extra.tributes,
                    card.ability.extra.tributes)
            end
        end
        if context.joy_exit_effect_selection and context.joy_card == card and
            #context.joy_selection == card.ability.extra.tributes then
            for _, selected_card in ipairs(context.joy_selection) do
                selected_card:start_dissolve()
            end
            local choices = {
                "j_joy_generaider_harr",
                "j_joy_generaider_nidhogg",
                "j_joy_generaider_frodi",
                "j_joy_generaider_utgarda",
                "j_joy_generaider_mardel",
                "j_joy_generaider_dovelgus",
                "j_joy_generaider_naglfar",
                "j_joy_generaider_hela",
            }
            for i = 1, card.ability.extra.cards_to_create do
                local not_owned = JoyousSpring.get_not_owned(choices, true)
                if #G.jokers.cards + G.GAME.joker_buffer - card.ability.extra.tributes < G.jokers.config.card_limit then
                    SMODS.add_card({
                        key = pseudorandom_element(not_owned, pseudoseed("j_joy_generaider_boss_stage")) or
                            "j_joy_generaider_utgarda"
                    })
                end
            end
        end
    end,
    joy_can_activate = function(card)
        local tokens = JoyousSpring.get_materials_owned({ { key = "j_joy_token", monster_archetypes = { "Generaider" } } })
        return (#G.jokers.cards + G.GAME.joker_buffer - card.ability.extra.tributes < G.jokers.config.card_limit and next(tokens)) and
            true or false
    end
})

JoyousSpring.token_pool["generaider"] = {
    name = "j_joy_token_generaider",
    atlas = "joy_Generaider",
    sprite_pos = { x = 1, y = 3 },
    attribute = "LIGHT",
    monster_type = "Fairy",
    monster_archetypes = { ["Generaider"] = true }
}

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "generaider" },
    label = "k_joy_archetype_generaider"
}
