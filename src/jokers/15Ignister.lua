--- @IGNISTER
SMODS.Atlas({
    key = "ignis",
    path = "15Ignister.png",
    px = 71,
    py = 95
})

-- Achichi @Ignister
SMODS.Joker({
    key = "ignis_achichi",
    atlas = 'ignis',
    pos = { x = 0, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_main_deck_joker" }
        end
        return { vars = { card.ability.extra.mult, card.ability.extra.creates } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "FIRE",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
            mult = 15,
            creates = 1
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff then
            for i = 1, card.ability.extra.creates do
                JoyousSpring.create_pseudorandom(
                    { { rarity = 1, monster_archetypes = { "Ignister" }, is_main_deck = true } },
                    pseudoseed("j_joy_ignis_achichi"), true)
            end
        end
    end
})

-- Pikari @Ignister
SMODS.Joker({
    key = "ignis_pikari",
    atlas = 'ignis',
    pos = { x = 4, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, card.ability.extra.creates } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "LIGHT",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
            dollars = 3,
            creates = 1
        },
    },
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff then
            for i = 1, card.ability.extra.creates do
                if #G.consumeables.cards < G.consumeables.config.card_limit then
                    SMODS.add_card({
                        set = 'Tarot'
                    })
                end
            end
        end
    end
})

-- Hiyari @Ignister
SMODS.Joker({
    key = "ignis_hiyari",
    atlas = 'ignis',
    pos = { x = 3, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_tribute" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_main_deck_joker" }
        end
        return { vars = { card.ability.extra.h_size, card.ability.extra.tributes, card.ability.extra.creates } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WATER",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
            h_size = 1,
            tributes = 1,
            creates = 1,
            activated = false
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card and not card.ability.extra.activated then
                if context.joy_activate_effect and context.joy_activated_card == card then
                    local targets = JoyousSpring.get_materials_owned({ { monster_type = "Cyberse" } }, false, true)
                    local materials = {}
                    for i, joker in ipairs(targets) do
                        if not joker.ability.eternal then
                            materials[#materials + 1] = joker
                        end
                    end
                    if next(materials) then
                        JoyousSpring.create_overlay_effect_selection(card, materials, card.ability.extra.tributes,
                            card.ability.extra.tributes)
                    end
                end
                if context.joy_exit_effect_selection and context.joy_card == card and
                    #context.joy_selection == card.ability.extra.tributes then
                    card.ability.extra.activated = true
                    JoyousSpring.tribute(card, context.joy_selection)

                    for i = 1, card.ability.extra.creates do
                        JoyousSpring.create_pseudorandom(
                            { { rarity = 2, monster_archetypes = { "Ignister" }, is_main_deck = true } },
                            pseudoseed("j_joy_ignis_hiyari"), true)
                    end
                end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval then
            card.ability.extra.activated = false
        end
    end,
    joy_can_activate = function(card)
        if card.ability.extra.activated then
            return false
        end
        local targets = JoyousSpring.get_materials_owned({ { monster_type = "Cyberse" } }, false, true)
        for i, joker in ipairs(targets) do
            if not joker.ability.eternal then
                return true
            end
        end
        return false
    end,
    add_to_deck = function(self, card, from_debuff)
        if not JoyousSpring.is_perma_debuffed(card) then
            G.hand:change_size(card.ability.extra.h_size)
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if not JoyousSpring.is_perma_debuffed(card) then
            G.hand:change_size(-card.ability.extra.h_size)
        end
    end,
    joy_set_cost = function(card)
        if JoyousSpring.count_materials_owned({ { monster_archetypes = { "Ignister" } } }) > 0 then
            card.cost = 0
        end
    end
})

-- Bururu @Ignister
SMODS.Joker({
    key = "ignis_bururu",
    atlas = 'ignis',
    pos = { x = 1, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_revive" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_main_deck_joker" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
        end
        return { vars = { card.ability.extra.mills, card.ability.extra.revives } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_tuner = true,
                attribute = "WIND",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
            mills = 3,
            revives = 1
        },
    },
    calculate = function(self, card, context)
        if context.joy_summon and context.main_eval and not context.blueprint_card and JoyousSpring.is_monster_type(context.joy_card, "Cyberse") then
            for _, joker in ipairs(context.joy_summon_materials) do
                if joker == card then
                    for i = 1, card.ability.extra.revives do
                        JoyousSpring.revive_pseudorandom(
                            { { monster_archetypes = { "Ignister" }, is_main_deck = true } },
                            pseudoseed("j_joy_ignis_bururu"), false, "e_negative")
                    end
                    break
                end
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff then
            local choices = JoyousSpring.get_materials_in_collection({ { monster_archetypes = { "Ignister" } } })

            for i = 1, card.ability.extra.mills do
                JoyousSpring.send_to_graveyard(pseudorandom_element(choices, pseudoseed("j_joy_ignis_bururu")))
            end
            SMODS.calculate_effect({ message = localize("k_joy_mill") }, card)
        end
    end
})

-- Doshin @Ignister
SMODS.Joker({
    key = "ignis_doshin",
    atlas = 'ignis',
    pos = { x = 4, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 2,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_revive" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_extra_deck_joker" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
        end
        return { vars = { card.ability.extra.chips, card.ability.extra.revives } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
            chips = 50,
            revives = 1
        },
    },
    calculate = function(self, card, context)
        if context.joy_summon and context.main_eval and not context.blueprint_card and JoyousSpring.is_monster_type(context.joy_card, "Cyberse") then
            for _, joker in ipairs(context.joy_summon_materials) do
                if joker == card then
                    for i = 1, card.ability.extra.revives do
                        JoyousSpring.revive_pseudorandom(
                            { { monster_archetypes = { "Ignister" }, is_extra_deck = true } },
                            pseudoseed("j_joy_ignis_doshin"), true)
                    end
                    break
                end
            end
        end
        if JoyousSpring.can_use_abilities(card) and context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
})

-- Gatchiri @Ignister
SMODS.Joker({
    key = "ignis_gatchiri",
    atlas = 'ignis',
    pos = { x = 1, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
        end
        return { vars = { card.ability.extra.xmult } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_all_materials = { LINK = true },
                attribute = "EARTH",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
            xmult = 1.1
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if context.joker_main then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end,
    joy_can_transfer_ability = function(self, other_card)
        return JoyousSpring.is_monster_type(other_card, "Cyberse")
    end,
    joy_transfer_add_to_deck = function(self, other_card, config, card, from_debuff)
        other_card.ability.extra.joyous_spring.cannot_flip = true
        SMODS.debuff_card(other_card, 'prevent_debuff', 'j_joy_ignis_gatchiri')
    end,
    joy_transfer_loc_vars = function(self, info_queue, card, config)
        return { vars = {} }
    end
})

-- Gussari @Ignister
SMODS.Joker({
    key = "ignis_gussari",
    atlas = 'ignis',
    pos = { x = 2, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
        end
        return { vars = { card.ability.extra.mult } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_all_materials = { LINK = true },
                attribute = "EARTH",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
            mult = 30
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end,
    joy_can_transfer_ability = function(self, other_card)
        return JoyousSpring.is_summon_type(other_card, "LINK")
    end,
    joy_transfer_add_to_deck = function(self, other_card, config, card, from_debuff, materials)
        if materials then
            config.current_mult = #materials * config.mult
        end
    end,
    joy_transfer_ability_calculate = function(self, other_card, context, config)
        if JoyousSpring.can_use_abilities(other_card) and context.joker_main then
            return {
                mult = config.current_mult
            }
        end
    end,
    joy_transfer_config = function(self, other_card)
        return { mult = 30, current_mult = 0 }
    end,
    joy_transfer_loc_vars = function(self, info_queue, card, config)
        return { vars = { config.mult, config.current_mult } }
    end
})

-- Danmari @Ignister
SMODS.Joker({
    key = "ignis_danmari",
    atlas = 'ignis',
    pos = { x = 2, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
        end
        return { vars = { card.ability.extra.percent * 100 } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
            percent = 0.05
        },
    },
    joy_can_transfer_ability = function(self, other_card)
        return JoyousSpring.is_summon_type(other_card, "LINK")
    end,
    joy_transfer_ability_calculate = function(self, other_card, context, config)
        if JoyousSpring.can_use_abilities(other_card) then
            if context.setting_blind and context.main_eval then
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips - G.GAME.blind.chips * config.percent)
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                return {
                    message = localize("k_active_ex")
                }
            end
        end
    end,
    joy_transfer_config = function(self, other_card)
        return { percent = 0.05 }
    end,
    joy_transfer_loc_vars = function(self, info_queue, card, config)
        return { vars = { config.percent * 100 } }
    end
})

-- Doyon @Ignister
SMODS.Joker({
    key = "ignis_doyon",
    atlas = 'ignis',
    pos = { x = 0, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_revive" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_main_deck_joker" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
        end
        return { vars = { card.ability.extra.revives, card.ability.extra.adds } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
            revives = 1,
            adds = 1
        },
    },
    calculate = function(self, card, context)
        if context.joy_summon and context.main_eval and not context.blueprint_card and JoyousSpring.is_monster_type(context.joy_card, "Cyberse") then
            for _, joker in ipairs(context.joy_summon_materials) do
                if joker == card then
                    local choices = JoyousSpring.get_materials_in_collection({ { monster_archetypes = { "Ignister" }, is_extra_deck = true } })
                    for i = 1, card.ability.extra.adds do
                        local key_to_add, _ = pseudorandom_element(choices, pseudoseed("j_joy_ignis_doyon"))
                        if key_to_add and #JoyousSpring.extra_deck_area.cards < JoyousSpring.extra_deck_area.config.card_limit then
                            JoyousSpring.add_to_extra_deck(key_to_add)
                        end
                    end
                    break
                end
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff then
            for i = 1, card.ability.extra.revives do
                JoyousSpring.revive_pseudorandom(
                    { { monster_archetypes = { "Ignister" }, is_main_deck = true } },
                    pseudoseed("j_joy_ignis_bururu"), true, nil, (card.edition and card.edition.negative) and 0 or -1)
            end
        end
    end
})

-- Donyoribo @Ignister
SMODS.Joker({
    key = "ignis_donyoribo",
    atlas = 'ignis',
    pos = { x = 3, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_banish" }
        end
        return { vars = { card.ability.extra.money, card.ability.extra.banishes } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
            money = 2,
            banishes = 1
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if context.buying_card and JoyousSpring.is_monster_archetype(context.card, "Ignister") then
                return {
                    dollars = card.ability.extra.money
                }
            end
            if context.selling_self then
                local materials = JoyousSpring.get_materials_owned({ { monster_archetypes = { "Ignister" } } })
                local choices = {}
                for i, joker in ipairs(materials) do
                    if joker ~= card then
                        table.insert(choices, joker)
                    end
                end
                for i = 1, card.ability.extra.banishes do
                    local to_banish = pseudorandom_element(choices, pseudoseed("j_joy_ignis_donyoribo"))
                    if to_banish then
                        JoyousSpring.banish(to_banish, "blind_selected")
                    end
                end
            end
        end
    end
})

-- Backup @Ignister
SMODS.Joker({
    key = "ignis_backup",
    atlas = 'ignis',
    pos = { x = 0, y = 2 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
        end
        return { vars = { card.ability.extra.to_negative } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_tuner = true,
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
            to_negative = 1
        },
    },
    calculate = function(self, card, context)
        if context.joy_summon and context.main_eval and not context.blueprint_card and JoyousSpring.is_monster_type(context.joy_card, "Cyberse") and not context.joy_card.edition then
            for _, joker in ipairs(context.joy_summon_materials) do
                if joker == card then
                    context.joy_card:set_edition({ negative = true })
                    break
                end
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff then
            local materials = JoyousSpring.get_materials_owned({ { monster_type = "Cyberse" } })
            local choices = {}
            for i, joker in ipairs(materials) do
                if joker ~= card and not joker.edition then
                    table.insert(choices, joker)
                end
            end
            for i = 1, card.ability.extra.to_negative do
                local to_negative = pseudorandom_element(choices, pseudoseed("j_joy_ignis_backup"))
                if to_negative then
                    to_negative:set_edition({ negative = true })
                end
            end
        end
    end
})

-- Wizard @Ignister
SMODS.Joker({
    key = "ignis_wizard",
    atlas = 'ignis',
    pos = { x = 2, y = 2 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_tribute" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_revive" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_extra_deck_joker" }
        end
        return { vars = { card.ability.extra.revives } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
            revives = 2,
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card then
                if context.joy_activate_effect and context.joy_activated_card == card and not card.ability.eternal then
                    JoyousSpring.tribute(card, { card })
                    for i = 1, card.ability.extra.revives do
                        JoyousSpring.revive_pseudorandom({ { monster_type = "Cyberse" } },
                            pseudoseed("j_joy_ignis_wizard"), true, nil,
                            (card.edition and card.edition.negative) and 0 or 1, true)
                    end
                    if JoyousSpring.count_materials_owned({ { monster_type = "Cyberse", is_summoned = true, is_extra_deck = true } }) > 0 then
                        JoyousSpring.revive_pseudorandom({ { monster_archetypes = { "Ignister" } } },
                            pseudoseed("j_joy_ignis_wizard"), false, "e_negative")
                    end
                end
            end
        end
    end,
    joy_can_activate = function(card)
        return not card.ability.eternal and JoyousSpring.count_materials_in_graveyard({ { monster_type = "Cyberse" } },
            true) > 0 or false
    end,
})

-- Kurikulink @Ignister
SMODS.Joker({
    key = "ignis_kiruku",
    atlas = 'ignis',
    pos = { x = 1, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 12,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_extra_deck_joker" }
        end
        return { vars = {} }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true }
            },
        },
    },
    calculate = function(self, card, context)
        if not context.blueprint_card and context.selling_self then
            if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind:get_type() == 'Boss')) then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                    { message = localize('ph_boss_disabled') })
                G.GAME.blind:disable()

                if JoyousSpring.count_materials_owned({ { monster_type = "Cyberse", is_summoned = true, is_extra_deck = true } }) > 0 then
                    JoyousSpring.add_monster_tag("j_joy_ignis_kiruku")
                end
            end
        end
    end,
})

-- Water Leviathan @Ignister
SMODS.Joker({
    key = "ignis_leviathan",
    atlas = 'ignis',
    pos = { x = 4, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
        end
        return { vars = { card.ability.extra.adds, card.ability.extra.chips, card.ability.extra.extra_chips, card.ability.extra.current_chips } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WATER",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true },
                summon_type = "RITUAL",
                summon_conditions = {
                    {
                        type = "RITUAL",
                        materials = {
                            { min = 2, monster_type = "Cyberse" },
                        },
                    }
                }
            },
            adds = 1,
            chips = 100,
            extra_chips = 10,
            current_chips = 0
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if context.joy_summon and context.main_eval and not context.blueprint_card and JoyousSpring.is_summon_type(context.joy_card, "LINK") then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.extra_chips
                card.ability.extra.current_chips = card.ability.extra.chips *
                    JoyousSpring.get_attribute_count(JoyousSpring.get_materials(card))
            end
            if context.joker_main then
                return {
                    chips = card.ability.extra.current_chips
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff then
            for i = 1, card.ability.extra.adds do
                local choices = JoyousSpring.get_materials_in_collection({ { monster_archetypes = { "Ignister" }, is_extra_deck = true } })
                for i = 1, card.ability.extra.adds do
                    local key_to_add, _ = pseudorandom_element(choices, pseudoseed("j_joy_ignis_leviathan"))
                    if key_to_add and #JoyousSpring.extra_deck_area.cards < JoyousSpring.extra_deck_area.config.card_limit then
                        JoyousSpring.add_to_extra_deck(key_to_add)
                    end
                end
            end
        end
        card.ability.extra.current_chips = card.ability.extra.chips *
            JoyousSpring.get_attribute_count(JoyousSpring.get_materials(card))
    end,
    joy_can_transfer_ability = function(self, other_card)
        return JoyousSpring.is_summon_type(other_card, "LINK")
    end,
    joy_transfer_add_to_deck = function(self, other_card, config, card, from_debuff, materials)
        config.current_chips = config.chips *
            JoyousSpring.get_attribute_count(JoyousSpring.get_materials(other_card))
    end,
    joy_transfer_ability_calculate = function(self, other_card, context, config)
        if JoyousSpring.can_use_abilities(other_card) then
            if context.joy_summon and context.main_eval and not context.blueprint_card and JoyousSpring.is_summon_type(context.joy_card, "LINK") then
                config.chips = config.chips + config.extra_chips
                config.current_chips = config.chips *
                    JoyousSpring.get_attribute_count(JoyousSpring.get_materials(other_card))
            end
            if context.joker_main then
                return {
                    chips = config.current_chips
                }
            end
        end
    end,
    joy_transfer_config = function(self, other_card)
        return { chips = 100, extra_chips = 10, current_chips = 0 }
    end,
    joy_transfer_loc_vars = function(self, info_queue, card, config)
        return { vars = { config.chips, config.extra_chips, config.current_chips } }
    end
})

-- Earth Golem @Ignister
SMODS.Joker({
    key = "ignis_golem",
    atlas = 'ignis',
    pos = { x = 0, y = 3 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
        end
        return { vars = { card.ability.extra.adds, card.ability.extra.slots, card.ability.extra.slots * JoyousSpring.get_attribute_count(JoyousSpring.get_materials(card)) } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true },
                summon_type = "FUSION",
                summon_conditions = {
                    {
                        type = "FUSION",
                        materials = {
                            { min = 2, monster_type = "Cyberse" },
                        },
                    }
                }
            },
            adds = 1,
            slots = 1
        },
    },
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff then
            for i = 1, card.ability.extra.adds do
                local choices = JoyousSpring.get_materials_in_collection({ { monster_archetypes = { "Ignister" }, is_extra_deck = true } })
                for i = 1, card.ability.extra.adds do
                    local key_to_add, _ = pseudorandom_element(choices, pseudoseed("j_joy_ignis_golem"))
                    if key_to_add and #JoyousSpring.extra_deck_area.cards < JoyousSpring.extra_deck_area.config.card_limit then
                        JoyousSpring.add_to_extra_deck(key_to_add)
                    end
                end
            end
        end
        G.jokers.config.card_limit = G.jokers.config.card_limit +
            (card.ability.extra.slots * JoyousSpring.get_attribute_count(JoyousSpring.get_materials(card)))
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit -
            (card.ability.extra.slots * JoyousSpring.get_attribute_count(JoyousSpring.get_materials(card)))
    end,
    joy_can_transfer_ability = function(self, other_card)
        return JoyousSpring.is_summon_type(other_card, "LINK")
    end,
    joy_transfer_add_to_deck = function(self, other_card, config, card, from_debuff, materials)
        G.jokers.config.card_limit = G.jokers.config.card_limit +
            (config.slots * JoyousSpring.get_attribute_count(JoyousSpring.get_materials(other_card)))
    end,
    joy_transfer_remove_from_deck = function(self, other_card, config, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit -
            (config.slots * JoyousSpring.get_attribute_count(JoyousSpring.get_materials(other_card)))
    end,
    joy_transfer_config = function(self, other_card)
        return { slots = 1 }
    end,
    joy_transfer_loc_vars = function(self, info_queue, card, config)
        return { vars = { config.slots, config.slots * JoyousSpring.get_attribute_count(JoyousSpring.get_materials(card)) } }
    end
})

-- Wind Pegasus @Ignister
SMODS.Joker({
    key = "ignis_pegasus",
    atlas = 'ignis',
    pos = { x = 1, y = 3 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
        end
        return { vars = { card.ability.extra.adds, G.GAME.probabilities.normal, math.max(1, card.ability.extra.odds - JoyousSpring.get_attribute_count(JoyousSpring.get_materials(card))) } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "WIND",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true },
                summon_type = "SYNCHRO",
                summon_conditions = {
                    {
                        type = "SYNCHRO",
                        materials = {
                            { is_tuner = true,       exclude_summon_types = { "XYZ", "LINK" } },
                            { exclude_tuners = true, min = 1,                                 monster_type = "Cyberse", exclude_summon_types = { "XYZ", "LINK" } },
                        },
                    }
                }
            },
            adds = 1,
            odds = 6
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if context.repetition and context.cardarea == G.play then
                if pseudorandom("j_joy_ignis_pegasus") < G.GAME.probabilities.normal / math.max(1, card.ability.extra.odds - JoyousSpring.get_attribute_count(JoyousSpring.get_materials(card))) then
                    return {
                        repetitions = 1
                    }
                end
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff then
            for i = 1, card.ability.extra.adds do
                local choices = JoyousSpring.get_materials_in_collection({ { monster_archetypes = { "Ignister" }, is_extra_deck = true } })
                for i = 1, card.ability.extra.adds do
                    local key_to_add, _ = pseudorandom_element(choices, pseudoseed("j_joy_ignis_pegasus"))
                    if key_to_add and #JoyousSpring.extra_deck_area.cards < JoyousSpring.extra_deck_area.config.card_limit then
                        JoyousSpring.add_to_extra_deck(key_to_add)
                    end
                end
            end
        end
    end,
    joy_can_transfer_ability = function(self, other_card)
        return JoyousSpring.is_summon_type(other_card, "LINK")
    end,
    joy_transfer_ability_calculate = function(self, other_card, context, config)
        if JoyousSpring.can_use_abilities(other_card) then
            if context.repetition and context.cardarea == G.play then
                if pseudorandom("j_joy_ignis_pegasus") < G.GAME.probabilities.normal / math.max(1, config.odds - JoyousSpring.get_attribute_count(JoyousSpring.get_materials(other_card))) then
                    return {
                        repetitions = 1
                    }
                end
            end
        end
    end,
    joy_transfer_config = function(self, other_card)
        return { odds = 6 }
    end,
    joy_transfer_loc_vars = function(self, info_queue, card, config)
        return { vars = { G.GAME.probabilities.normal, math.max(1, config.odds - JoyousSpring.get_attribute_count(JoyousSpring.get_materials(other_card))) } }
    end
})

-- Light Dragon @Ignister
SMODS.Joker({
    key = "ignis_dragon",
    atlas = 'ignis',
    pos = { x = 2, y = 3 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
        end
        return { vars = { card.ability.extra.adds, card.ability.extra.money, card.ability.extra.money * JoyousSpring.get_attribute_count(JoyousSpring.get_materials(card)) } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
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
                attribute = "LIGHT",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true },
                summon_type = "XYZ",
                summon_conditions = {
                    {
                        type = "XYZ",
                        materials = {
                            { min = 2, monster_type = "Cyberse", exclude_tokens = true, exclude_summon_types = { "XYZ", "LINK" } },
                        },
                    }
                }
            },
            adds = 1,
            money = 1
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if context.individual and context.cardarea == G.play then
                context.other_card.ability.perma_h_dollars = (context.other_card.ability.perma_h_dollars or 0) +
                    (card.ability.extra.money * JoyousSpring.get_attribute_count(JoyousSpring.get_materials(card)))
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MONEY },
                    card = card
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff then
            for i = 1, card.ability.extra.adds do
                local choices = JoyousSpring.get_materials_in_collection({ { monster_archetypes = { "Ignister" }, is_extra_deck = true } })
                for i = 1, card.ability.extra.adds do
                    local key_to_add, _ = pseudorandom_element(choices, pseudoseed("j_joy_ignis_dragon"))
                    if key_to_add and #JoyousSpring.extra_deck_area.cards < JoyousSpring.extra_deck_area.config.card_limit then
                        JoyousSpring.add_to_extra_deck(key_to_add)
                    end
                end
            end
        end
    end,
    joy_can_transfer_ability = function(self, other_card)
        return JoyousSpring.is_summon_type(other_card, "LINK")
    end,
    joy_transfer_ability_calculate = function(self, other_card, context, config)
        if JoyousSpring.can_use_abilities(other_card) then
            if context.individual and context.cardarea == G.play then
                context.other_card.ability.perma_h_dollars = (context.other_card.ability.perma_h_dollars or 0) +
                    (config.money * JoyousSpring.get_attribute_count(JoyousSpring.get_materials(other_card)))
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MONEY },
                    card = other_card
                }
            end
        end
    end,
    joy_transfer_config = function(self, other_card)
        return { money = 1 }
    end,
    joy_transfer_loc_vars = function(self, info_queue, card, config)
        return { vars = { config.money, config.money * JoyousSpring.get_attribute_count(JoyousSpring.get_materials(card)) } }
    end
})

-- Fire Phoenix @Ignister
SMODS.Joker({
    key = "ignis_phoenix",
    atlas = 'ignis',
    pos = { x = 3, y = 3 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
        end
        return { vars = { card.ability.extra.adds, card.ability.extra.creates, card.ability.extra.xmult, card.ability.extra.extra_xmult, card.ability.extra.current_xmult } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "FIRE",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true },
                summon_type = "LINK",
                summon_conditions = {
                    {
                        type = "LINK",
                        materials = {
                            { min = 2, monster_type = "Cyberse" },
                        },
                    }
                }
            },
            adds = 1,
            creates = 1,
            xmult = 0.1,
            extra_xmult = 0.05,
            current_xmult = 0
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if context.individual and context.cardarea == G.play then
                context.other_card.ability.perma_x_mult = (context.other_card.ability.perma_x_mult or 1) +
                    card.ability.extra.current_xmult
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT },
                    card = card
                }
            end
            if context.joy_summon and context.main_eval and not context.blueprint_card and JoyousSpring.is_summon_type(context.joy_card, "LINK") then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.extra_xmult
                card.ability.extra.current_xmult = card.ability.extra.xmult *
                    JoyousSpring.get_attribute_count(JoyousSpring.get_materials(card))
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff then
            for i = 1, card.ability.extra.adds do
                local choices = JoyousSpring.get_materials_in_collection({ { monster_archetypes = { "Ignister" }, is_extra_deck = true } })
                for i = 1, card.ability.extra.adds do
                    local key_to_add, _ = pseudorandom_element(choices, pseudoseed("j_joy_ignis_phoenix"))
                    if key_to_add and #JoyousSpring.extra_deck_area.cards < JoyousSpring.extra_deck_area.config.card_limit then
                        JoyousSpring.add_to_extra_deck(key_to_add)
                    end
                end
            end
        end
        card.ability.extra.current_xmult = card.ability.extra.xmult *
            JoyousSpring.get_attribute_count(JoyousSpring.get_materials(card))
    end,
    joy_can_transfer_ability = function(self, other_card)
        return JoyousSpring.is_summon_type(other_card, "LINK")
    end,
    joy_transfer_add_to_deck = function(self, other_card, config, card, from_debuff, materials)
        config.current_xmult = config.xmult *
            JoyousSpring.get_attribute_count(JoyousSpring.get_materials(other_card))
    end,
    joy_transfer_ability_calculate = function(self, other_card, context, config)
        if JoyousSpring.can_use_abilities(other_card) then
            if context.individual and context.cardarea == G.play then
                context.other_card.ability.perma_x_mult = (context.other_card.ability.perma_x_mult or 1) +
                    config.current_xmult
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT },
                    card = other_card
                }
            end
            if context.joy_summon and context.main_eval and not context.blueprint_card then
                if JoyousSpring.is_monster_type(context.joy_card, "Cyberse") then
                    for _, joker in ipairs(context.joy_summon_materials) do
                        if joker == card then
                            JoyousSpring.create_perma_debuffed_card("j_joy_ignis_phoenix", "j_joy_ignis_phoenix",
                                "e_negative")
                            break
                        end
                    end
                end
                if JoyousSpring.is_summon_type(context.joy_card, "LINK") then
                    config.xmult = config.xmult + config.extra_xmult
                    config.current_xmult = config.xmult *
                        JoyousSpring.get_attribute_count(JoyousSpring.get_materials(other_card))
                end
            end
        end
    end,
    joy_transfer_config = function(self, other_card)
        return {
            xmult = 0.1,
            extra_xmult = 0.05,
            current_xmult = 0
        }
    end,
    joy_transfer_loc_vars = function(self, info_queue, card, config)
        return { vars = { config.xmult, config.extra_xmult, config.current_xmult } }
    end
})

-- Accode Talker @Ignister
SMODS.Joker({
    key = "ignis_accode",
    atlas = 'ignis',
    pos = { x = 4, y = 3 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_revive" }
        end
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult * JoyousSpring.count_materials_owned({ { summon_type = "LINK" } }), card.ability.extra.revives } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true },
                summon_type = "LINK",
                summon_conditions = {
                    {
                        type = "LINK",
                        materials = {
                            { summon_type = "LINK" },
                            { summon_type = "LINK" },
                            { summon_type = "LINK" },
                        },
                    }
                }
            },
            xmult = 3,
            revives = 3
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) and context.joker_main and JoyousSpring.count_materials_owned({ { summon_type = "LINK" } }) > 0 then
            return {
                xmult = card.ability.extra.xmult * JoyousSpring.count_materials_owned({ { summon_type = "LINK" } })
            }
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff then
            for i = 1, card.ability.extra.revives do
                JoyousSpring.revive_pseudorandom(
                    { { summon_type = "LINK" } },
                    pseudoseed("j_joy_ignis_accode"), true, nil, (card.edition and card.edition.negative) and 0 or -1)
            end
        end
    end
})

-- Dark Infant @Ignister
SMODS.Joker({
    key = "ignis_infant",
    atlas = 'ignis',
    pos = { x = 0, y = 4 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
        end
        return { vars = { card.ability.extra.creates } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", name = "Creates" },
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_all_attributes = true,
                is_all_materials = { LINK = true },
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true },
                summon_type = "LINK",
                summon_conditions = {
                    {
                        type = "LINK",
                        materials = {
                            { monster_type = "Cyberse" },
                        },
                    }
                }
            },
            creates = 1
        },
    },
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff then
            if #JoyousSpring.field_spell_area.cards < JoyousSpring.field_spell_area.config.card_limit then
                JoyousSpring.add_to_extra_deck("j_joy_ignis_ailand")
            end
        end
    end
})

-- Dark Templar @Ignister
SMODS.Joker({
    key = "ignis_templar",
    atlas = 'ignis',
    pos = { x = 1, y = 4 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 15,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_revive" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
        end
        return { vars = { card.ability.extra.revives } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true },
                summon_type = "LINK",
                summon_conditions = {
                    {
                        type = "LINK",
                        materials = {
                            { monster_archetypes = { "Ignister" } },
                            { monster_archetypes = { "Ignister" } },
                            { monster_archetypes = { "Ignister" } },
                        },
                    }
                }
            },
            revives = 1
        },
    },
    calculate = function(self, card, context)
        if context.joy_summon and context.main_eval and not context.blueprint_card and JoyousSpring.is_monster_type(context.joy_card, "Cyberse") then
            for _, joker in ipairs(context.joy_summon_materials) do
                if joker == card then
                    for i = 1, card.ability.extra.revives do
                        JoyousSpring.revive_pseudorandom(
                            { { monster_type = "Cyberse", is_main_deck = true } },
                            pseudoseed("j_joy_ignis_templar"), true)
                    end
                    break
                end
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff then
            for i = 1, card.ability.extra.revives do
                local choices = JoyousSpring.get_materials_in_graveyard({ { monster_archetypes = { "Ignister" } } }, true,
                    true)

                for _, joker_key in ipairs(choices) do
                    JoyousSpring.revive(joker_key, false, "e_negative", "j_joy_ignis_templar")
                end
            end
        end
    end
})

-- The Arrival Cyberse @Ignister
SMODS.Joker({
    key = "ignis_arrival",
    atlas = 'ignis',
    pos = { x = 2, y = 4 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 20,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
        end
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.current_xmult,
                card.ability.extra.money,
                card.ability.extra.creates,
                card.ability.extra.chips,
                card.ability.extra.mult,
                G.GAME.probabilities.normal,
                card.ability.extra.odds,
                card.ability.extra.h_size,
                colours = {
                    card.ability.extra.attributes["LIGHT"] and G.C.JOY.LIGHT or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["LIGHT"] and G.C.MONEY or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["LIGHT"] and G.C.UI.TEXT_DARK or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["DARK"] and G.C.JOY.DARK or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["DARK"] and G.C.FILTER or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["DARK"] and G.C.SECONDARY_SET.Spectral or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["DARK"] and G.C.UI.TEXT_DARK or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["WATER"] and G.C.JOY.WATER or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["WATER"] and G.C.CHIPS or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["WATER"] and G.C.UI.TEXT_DARK or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["FIRE"] and G.C.JOY.FIRE or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["FIRE"] and G.C.MULT or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["FIRE"] and G.C.UI.TEXT_DARK or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["WIND"] and G.C.JOY.WIND or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["WIND"] and G.C.GREEN or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["WIND"] and G.C.DARK_EDITION or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["WIND"] and G.C.UI.TEXT_DARK or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["EARTH"] and G.C.JOY.EARTH or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["EARTH"] and G.C.FILTER or G.C.UI.TEXT_INACTIVE,
                    card.ability.extra.attributes["EARTH"] and G.C.UI.TEXT_DARK or G.C.UI.TEXT_INACTIVE,
                }
            },
            main_end = card.ability.extra.attributes["DIVINE"] and {
                {
                    n = G.UIT.C,
                    config = { align = "bm", minh = 0.3 },
                    nodes = {
                        {
                            n = G.UIT.T,
                            config = {
                                text = localize("k_joy_DIVINE"),
                                colour = G.C.JOY.DIVINE,
                                scale = 0.32,
                            }
                        },
                        {
                            n = G.UIT.T,
                            config = {
                                text = localize("k_joy_arrival_text1"),
                                colour = G.C.UI.TEXT_DARK,
                                scale = 0.32,
                            }
                        },
                        {
                            n = G.UIT.T,
                            config = {
                                text = localize("k_joy_arrival_text2"),
                                colour = G.C.FILTER,
                                scale = 0.32,
                            }
                        },
                        {
                            n = G.UIT.T,
                            config = {
                                text = localize("k_joy_arrival_text3"),
                                colour = G.C.UI.TEXT_DARK,
                                scale = 0.32,
                            }
                        },
                        {
                            n = G.UIT.T,
                            config = {
                                text = localize("k_joy_arrival_text4"),
                                colour = G.C.RED,
                                scale = 0.32,
                            }
                        },
                    }
                }
            } or nil
        }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                summon_type = "LINK",
                attribute = "DARK",
                monster_type = "Cyberse",
                monster_archetypes = { ["Ignister"] = true },
                summon_conditions = {
                    {
                        type = "LINK",
                        materials = {
                            { min = 5, monster_type = "Cyberse" },
                        },
                    }
                }
            },
            attributes = {},
            xmult = 6,
            current_xmult = 0,
            money = 25,
            creates = 1,
            chips = 1000,
            mult = 250,
            odds = 6,
            h_size = 5,
            percent = 0.5
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if context.setting_blind and context.main_eval and card.ability.extra.attributes["DIVINE"] then
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips - G.GAME.blind.chips * card.ability.extra.percent)
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                return {
                    message = localize("k_active_ex")
                }
            end
            if context.joker_main then
                print(card.ability.extra.attributes)
                return {
                    chips = card.ability.extra.attributes["WATER"] and card.ability.extra.chips or nil,
                    mult = card.ability.extra.attributes["FIRE"] and card.ability.extra.mult or nil,
                    xmult = card.ability.extra.current_xmult > 0 and card.ability.extra.current_xmult or nil
                }
            end
            if context.using_consumeable and context.main_eval and card.ability.extra.attributes["WIND"] then
                if pseudorandom("j_joy_ignis_arrival") < G.GAME.probabilities.normal / card.ability.extra.odds then
                    SMODS.add_card({
                        key = context.consumeable.config.center.key,
                        edition = "e_negative"
                    })
                end
            end
            if context.end_of_round and context.main_eval and context.game_over == false then
                for i = 1, card.ability.extra.creates do
                    if #G.consumeables.cards < G.consumeables.config.card_limit then
                        SMODS.add_card({
                            set = 'Spectral'
                        })
                    end
                end
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        if card.ability.extra.attributes["LIGHT"] then
            return card.ability.extra.money
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.attributes = JoyousSpring.get_material_attributes(JoyousSpring.get_materials(card))

        if card.ability.extra.attributes["EARTH"] then
            G.hand:change_size(card.ability.extra.h_size)
        end
        card.ability.extra.current_xmult = card.ability.extra.xmult *
            JoyousSpring.get_attribute_count(JoyousSpring.get_materials(card))
    end,
    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.attributes["EARTH"] then
            G.hand:change_size(-card.ability.extra.h_size)
        end
    end
})

-- Ignister A.I.Land
SMODS.Joker({
    key = "ignis_ailand",
    atlas = 'ignis',
    pos = { x = 3, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 12,
    loc_vars = function(self, info_queue, card)
        if not JoyousSpring.config.disable_tooltips and not card.fake_card and not card.debuff then
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_main_deck_joker" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_material" }
            info_queue[#info_queue + 1] = { set = "Other", key = "joy_tooltip_banish" }
        end
        return { vars = { card.ability.extra.creates, card.ability.extra.attributes } }
    end,
    joy_desc_cards = {
        { "j_joy_ignis_ailand", properties = { { monster_archetypes = { "Ignister" } } }, name = "k_joy_archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_field_spell = true,
                monster_archetypes = {}
            },
            creates = 1,
            attributes = 6
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if context.joy_summon and context.main_eval and not context.blueprint_card then
                for _, joker in ipairs(context.joy_summon_materials) do
                    if JoyousSpring.is_monster_archetype(joker, "Ignister") then
                        local choices = JoyousSpring.get_materials_in_collection({ { monster_archetypes = { "Ignister" }, is_main_deck = true } })
                        for i = 1, card.ability.extra.creates do
                            key_to_add = pseudorandom_element(choices, pseudoseed("j_joy_ignis_ailand"))
                            JoyousSpring.add_monster_tag(key_to_add or "j_joy_ignis_achichi")
                        end
                        break
                    end
                end
            end
            if context.end_of_round and context.main_eval and context.game_over == false then
                local count = JoyousSpring.get_attribute_count(G.jokers.cards)
                if count >= card.ability.extra.attributes then
                    for i, joker in ipairs(G.jokers.cards) do
                        if JoyousSpring.is_monster_type(joker, "Cyberse") then
                            JoyousSpring.banish(joker, "blind_selected")
                        else
                            SMODS.debuff_card(joker, true, "j_joy_ignis_ailand")
                        end
                    end
                end
            end
        end
    end
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "ignis" },
    label = "k_joy_archetype_ignis"
}
