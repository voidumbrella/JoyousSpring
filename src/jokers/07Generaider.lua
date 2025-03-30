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
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    joy_desc_cards = {
        { "j_joy_generaider_boss_stage",                              name = localize("k_joy_creates") },
        { properties = { { monster_archetypes = { "Generaider" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "FIRE",
                monster_type = "Fairy",
                monster_archetypes = { ["Generaider"] = true }
            },
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card and not context.retrigger_joker and
                context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind.boss then
                if #JoyousSpring.field_spell_area.cards < JoyousSpring.field_spell_area.config.card_limit then
                    JoyousSpring.add_to_extra_deck("j_joy_generaider_boss_stage")
                    card.getting_sliced = true
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
    eternal_compat = false,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_revive" }
        end
        return { vars = { card.ability.extra.revives } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Generaider" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "FIRE",
                monster_type = "Fairy",
                monster_archetypes = { ["Generaider"] = true }
            },
            revives = 1
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
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
                    card.getting_sliced = true
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
    cost = 10,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_tribute" }
        end
        return { vars = { card.ability.extra.tributes } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Generaider" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Generaider"] = true }
            },
            tributes = 2
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) and not context.blueprint_card then
            if context.joy_activate_effect and context.joy_activated_card == card then
                local materials = JoyousSpring.get_materials_owned(
                    { { monster_archetypes = { "Generaider" } }, { monster_type = "Spellcaster" } }, false, true)
                if #materials >= card.ability.extra.tributes then
                    JoyousSpring.create_overlay_effect_selection(card, materials, card.ability.extra.tributes,
                        card.ability.extra.tributes)
                end
            end
            if context.joy_exit_effect_selection and context.joy_card == card and
                #context.joy_selection == card.ability.extra.tributes then
                JoyousSpring.tribute(card, context.joy_selection)
                G.GAME.blind:disable()
            end
        end
    end,
    joy_can_activate = function(card)
        if not G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.boss)) then
            return false
        end
        local materials = JoyousSpring.get_materials_owned(
            { { monster_archetypes = { "Generaider" } }, { monster_type = "Spellcaster" } }, false, true)
        return #materials >= card.ability.extra.tributes
    end,
    in_pool = function(self, args)
        return args and args.source and args.source == "JoyousSpring" or false
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
    cost = 10,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_tribute" }
        end
        return { vars = { card.ability.extra.tributes } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Generaider" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WATER",
                monster_type = "Wyrm",
                monster_archetypes = { ["Generaider"] = true }
            },
            tributes = 2,
            active = false
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card then
                if context.joy_activate_effect and context.joy_activated_card == card then
                    local materials = JoyousSpring.get_materials_owned(
                        { { monster_archetypes = { "Generaider" } }, { monster_type = "Wyrm" } }, false, true)
                    if #materials >= card.ability.extra.tributes then
                        JoyousSpring.create_overlay_effect_selection(card, materials, card.ability.extra.tributes,
                            card.ability.extra.tributes)
                    end
                end
                if context.joy_exit_effect_selection and context.joy_card == card and
                    #context.joy_selection == card.ability.extra.tributes then
                    JoyousSpring.tribute(card, context.joy_selection)
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
        if card.ability.extra.active then
            return false
        end
        local materials = JoyousSpring.get_materials_owned(
            { { monster_archetypes = { "Generaider" } }, { monster_type = "Wyrm" } }, false, true)
        return #materials >= card.ability.extra.tributes
    end,
    in_pool = function(self, args)
        return args and args.source and args.source == "JoyousSpring" or false
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
    cost = 10,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_tribute" }
        end
        return {}
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Generaider" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WIND",
                monster_type = "Warrior",
                monster_archetypes = { ["Generaider"] = true }
            },
            hand_gain = 0
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card then
                if context.joy_activate_effect and context.joy_activated_card == card then
                    local materials = JoyousSpring.get_materials_owned(
                        { { monster_archetypes = { "Generaider" } }, { monster_type = "Spellcaster" } }, false, true)
                    if next(materials) then
                        JoyousSpring.create_overlay_effect_selection(card, materials, 1, 52)
                    end
                end
                if context.joy_exit_effect_selection and context.joy_card == card and
                    #context.joy_selection > 0 then
                    local count = #context.joy_selection
                    JoyousSpring.tribute(card, context.joy_selection)
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
        local materials = JoyousSpring.get_materials_owned(
            { { monster_archetypes = { "Generaider" } }, { monster_type = "Warrior" } }, false, true)
        return next(materials) and true or false
    end,
    in_pool = function(self, args)
        return args and args.source and args.source == "JoyousSpring" or false
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
    cost = 10,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_tribute" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_banish" }
        end
        return { vars = { card.ability.extra.tributes } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Generaider" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Rock",
                monster_archetypes = { ["Generaider"] = true }
            },
            tributes = 1
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) and not context.blueprint_card then
            if context.joy_activate_effect and context.joy_activated_card == card then
                local materials = JoyousSpring.get_materials_owned(
                    { { monster_archetypes = { "Generaider" } }, { monster_type = "Rock" } }, false, true)
                if #materials >= card.ability.extra.tributes then
                    JoyousSpring.create_overlay_effect_selection(card, materials, card.ability.extra.tributes,
                        card.ability.extra.tributes)
                end
            end
            if context.joy_exit_effect_selection and context.joy_card == card and
                #context.joy_selection == card.ability.extra.tributes then
                JoyousSpring.tribute(card, context.joy_selection)
                local choices = G.consumeables.cards
                local to_banish = pseudorandom_element(choices, pseudoseed("j_joy_generaider_utgarda"))
                if to_banish then
                    JoyousSpring.banish(to_banish, "blind_selected")
                end
            end
        end
    end,
    joy_can_activate = function(card)
        if not (#G.consumeables.cards > 0) then
            return false
        end
        local materials = JoyousSpring.get_materials_owned(
            { { monster_archetypes = { "Generaider" } }, { monster_type = "Rock" } }, false, true)
        return #materials >= card.ability.extra.tributes
    end,
    in_pool = function(self, args)
        return args and args.source and args.source == "JoyousSpring" or false
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
    cost = 10,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_tribute" }
        end
        return { vars = { card.ability.extra.tributes, card.ability.extra.cards_to_create } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Generaider" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Plant",
                monster_archetypes = { ["Generaider"] = true }
            },
            tributes = 1,
            cards_to_create = 1,
            activated = false
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) and not context.blueprint_card then
            if not card.ability.extra.activated and context.joy_activate_effect and context.joy_activated_card == card then
                local materials = JoyousSpring.get_materials_owned(
                    { { monster_archetypes = { "Generaider" } }, { monster_type = "Plant" } }, false, true)
                if #materials >= card.ability.extra.tributes then
                    JoyousSpring.create_overlay_effect_selection(card, materials, card.ability.extra.tributes,
                        card.ability.extra.tributes)
                end
            end
            if not card.ability.extra.activated and context.joy_exit_effect_selection and context.joy_card == card and
                #context.joy_selection == card.ability.extra.tributes then
                card.ability.extra.activated = true
                JoyousSpring.tribute(card, context.joy_selection)
                for i = 1, card.ability.extra.cards_to_create do
                    JoyousSpring.create_pseudorandom(
                        { { monster_archetypes = { "Generaider" }, rarity = 1 }, { monster_archetypes = { "Generaider" }, rarity = 2 } },
                        pseudoseed("j_joy_generaider_mardel"), true)
                end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval then
            card.ability.extra.activated = false
        end
    end,
    joy_can_activate = function(card)
        if card.ability.extra.activated or not (#G.jokers.cards + G.GAME.joker_buffer - card.ability.extra.tributes < G.jokers.config.card_limit) then
            return false
        end
        local materials = JoyousSpring.get_materials_owned(
            { { monster_archetypes = { "Generaider" } }, { monster_type = "Plant" } }, false, true)
        return #materials >= card.ability.extra.tributes
    end,
    in_pool = function(self, args)
        return args and args.source and args.source == "JoyousSpring" or false
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
    cost = 10,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_tribute" }
        end
        return { vars = { card.ability.extra.tributes, card.ability.extra.xmult } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Generaider" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Machine",
                monster_archetypes = { ["Generaider"] = true }
            },
            tributes = 2,
            xmult = 4
        },
        active = false
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card then
                if context.joy_activate_effect and context.joy_activated_card == card then
                    local materials = JoyousSpring.get_materials_owned(
                        { { monster_archetypes = { "Generaider" } }, { monster_type = "Machine" } }, false, true)
                    if #materials >= card.ability.extra.tributes then
                        JoyousSpring.create_overlay_effect_selection(card, materials, card.ability.extra.tributes,
                            card.ability.extra.tributes)
                    end
                end
                if context.joy_exit_effect_selection and context.joy_card == card and
                    #context.joy_selection == card.ability.extra.tributes then
                    JoyousSpring.tribute(card, context.joy_selection)
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
        if card.ability.extra.active then
            return false
        end
        local materials = JoyousSpring.get_materials_owned(
            { { monster_archetypes = { "Generaider" } }, { monster_type = "Machine" } }, false, true)
        return #materials >= card.ability.extra.tributes
    end,
    in_pool = function(self, args)
        return args and args.source and args.source == "JoyousSpring" or false
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
    cost = 10,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_tribute" }
        end
        return { vars = { card.ability.extra.tributes, card.ability.extra.hands, card.ability.extra.discards } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Generaider" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "FIRE",
                monster_type = "BeastWarrior",
                monster_archetypes = { ["Generaider"] = true }
            },
            tributes = 2,
            hands = 1,
            discards = 1,
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card then
                if context.joy_activate_effect and context.joy_activated_card == card then
                    local materials = JoyousSpring.get_materials_owned(
                        { { monster_archetypes = { "Generaider" } }, { monster_type = "BeastWarrior" } }, false, true)
                    if #materials >= card.ability.extra.tributes then
                        JoyousSpring.create_overlay_effect_selection(card, materials, card.ability.extra.tributes,
                            card.ability.extra.tributes)
                    end
                end
                if context.joy_exit_effect_selection and context.joy_card == card and
                    #context.joy_selection == card.ability.extra.tributes then
                    JoyousSpring.tribute(card, context.joy_selection)
                    ease_hands_played(card.ability.extra.hands)
                    ease_discard(card.ability.extra.discards)
                end
            end
        end
    end,
    joy_can_activate = function(card)
        if not (G.GAME.blind and G.GAME.blind.in_blind) then
            return false
        end
        local materials = JoyousSpring.get_materials_owned(
            { { monster_archetypes = { "Generaider" } }, { monster_type = "BeastWarrior" } }, false, true)
        return #materials >= card.ability.extra.tributes
    end,
    in_pool = function(self, args)
        return args and args.source and args.source == "JoyousSpring" or false
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
    cost = 10,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_tribute" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_revive" }
        end
        return { vars = { card.ability.extra.tributes, card.ability.extra.revives } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Generaider" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Zombie",
                monster_archetypes = { ["Generaider"] = true }
            },
            tributes = 3,
            revives = 1,
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card then
                if context.joy_activate_effect and context.joy_activated_card == card then
                    local materials = JoyousSpring.get_materials_owned(
                        { { monster_archetypes = { "Generaider" } }, { monster_type = "Zombie" } }, false, true)
                    if #materials >= card.ability.extra.tributes then
                        JoyousSpring.create_overlay_effect_selection(card, materials, card.ability.extra.tributes,
                            card.ability.extra.tributes)
                    end
                end
                if context.joy_exit_effect_selection and context.joy_card == card and
                    #context.joy_selection == card.ability.extra.tributes then
                    JoyousSpring.tribute(card, context.joy_selection)
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
        if not (G.GAME.blind and G.GAME.blind.in_blind) then
            return false
        end
        local materials = JoyousSpring.get_materials_owned(
            { { monster_archetypes = { "Generaider" } }, { monster_type = "Zombie" } }, false, true)
        return #materials >= card.ability.extra.tributes
    end,
    in_pool = function(self, args)
        return args and args.source and args.source == "JoyousSpring" or false
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
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_detach" }
        end
        return { vars = { card.ability.extra.mult, card.ability.extra.joyous_spring.xyz_materials * card.ability.extra.mult, card.ability.extra.detach, card.ability.extra.hsize } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Generaider" } } }, name = "k_joy_archetype" },
    },
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
                }
            },
            mult = 100,
            detach = 2,
            hsize = 1,
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card and not context.retrigger_joker and
                context.joy_detach and context.joy_detaching_card == card then
                JoyousSpring.ease_detach(card)
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
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_detach" }
        end
        return { vars = { card.ability.extra.detach } }
    end,
    joy_desc_cards = {
        { "j_joy_generaider_jormungandr",                             name = localize("k_joy_creates") },
        { properties = { { monster_archetypes = { "Generaider" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                summon_type = "XYZ",
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
                }
            },
            detach = 5
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card and not context.retrigger_joker and
                context.joy_detach and context.joy_detaching_card == card then
                for _, joker in ipairs(G.jokers.cards) do
                    if joker ~= card then
                        joker.getting_sliced = true
                        joker:start_dissolve()
                    end
                end
                local added_card = JoyousSpring.create_summon({
                    key = "j_joy_generaider_jormungandr"
                }, true)
                added_card.ability.extra.joyous_spring.xyz_materials = JoyousSpring.get_graveyard_count()
                JoyousSpring.empty_graveyard()
                JoyousSpring.ease_detach(card)
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
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_token" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_tribute" }
        end
        return { vars = { card.ability.extra.tributes, card.ability.extra.cards_to_create } }
    end,
    joy_desc_cards = {
        { properties = { { monster_archetypes = { "Generaider" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_field_spell = true,
                monster_archetypes = { ["Generaider"] = true },
            },
            tributes = 2,
            cards_to_create = 1,
            used = false,
        },
    },
    calculate = function(self, card, context)
        if context.setting_blind and context.main_eval then
            local generaiders = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Generaider" }, exclude_tokens = true } })
            local count = 0
            for _, joker in ipairs(generaiders) do
                if not joker.edition or not joker.edition.negative then
                    count = count + 1
                end
            end
            local i = 0
            while (#G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit - i + count) and (i < 20) do
                JoyousSpring.summon_token("generaider")
                i = i + 1
            end
        end
        if context.joy_activate_effect and context.joy_activated_card == card then
            local tokens = JoyousSpring.get_materials_owned({ { key = "j_joy_token", monster_archetypes = { "Generaider" } } })
            if #tokens >= card.ability.extra.tributes then
                JoyousSpring.create_overlay_effect_selection(card, tokens, card.ability.extra.tributes,
                    card.ability.extra.tributes)
            end
        end
        if context.joy_exit_effect_selection and context.joy_card == card and
            #context.joy_selection == card.ability.extra.tributes then
            JoyousSpring.tribute(card, context.joy_selection)
            card.ability.extra.used = true

            for i = 1, card.ability.extra.cards_to_create do
                JoyousSpring.create_pseudorandom(
                    { { monster_archetypes = { "Generaider" }, rarity = 3, is_main_deck = true } },
                    pseudoseed("j_joy_generaider_boss_stage"), true, true)
            end
        end
        if context.end_of_round and context.main_eval then
            card.ability.extra.used = false
        end
    end,
    joy_can_activate = function(card)
        local tokens = JoyousSpring.get_materials_owned({ { key = "j_joy_token", monster_archetypes = { "Generaider" } } })
        return not card.debuff and
            (not card.ability.extra.used and #G.jokers.cards + G.GAME.joker_buffer - card.ability.extra.tributes < G.jokers.config.card_limit and next(tokens)) and
            true or false
    end,
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
