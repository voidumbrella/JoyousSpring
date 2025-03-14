--- SUBTERROR
SMODS.Atlas({
    key = "sub",
    path = "13Subterror.png",
    px = 71,
    py = 95
})

-- Subterror Fiendess
SMODS.Joker({
    key = "sub_fiendess",
    atlas = 'sub',
    pos = { x = 0, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.revives } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Subterror"] = true }
            },
            flips = 1,
            revives = 1,
            activated = true
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card then
                if not card.ability.extra.activated and context.joy_activate_effect and context.joy_activated_card == card then
                    local targets = JoyousSpring.get_materials_owned({ { exclude_tokens = true, exclude_summon_types = { "LINK" } } })
                    local materials = {}
                    for i, joker in ipairs(targets) do
                        if joker ~= card and joker.facing == 'front' then
                            materials[#materials + 1] = joker
                        end
                    end
                    if next(materials) then
                        JoyousSpring.create_overlay_effect_selection(card, materials, card.ability.extra.flips,
                            card.ability.extra.flips, localize("k_joy_select"))
                    end
                end
                if not card.ability.extra.activated and context.joy_exit_effect_selection and context.joy_card == card and
                    #context.joy_selection == card.ability.extra.flips then
                    for _, selected_card in ipairs(context.joy_selection) do
                        selected_card:flip()
                    end
                    card:flip()
                    for i = 1, card.ability.extra.revives do
                        JoyousSpring.revive_pseudorandom(
                            { { monster_archetypes = { "Subterror" } } },
                            pseudoseed("j_joy_sub_fiendess"),
                            false,
                            { negative = true }
                        )
                    end
                    card.ability.extra.activated = true
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
        local targets = JoyousSpring.get_materials_owned({ { exclude_tokens = true, exclude_summon_types = { "LINK" } } })
        local faceup_joker = false
        for _, joker in ipairs(targets) do
            if joker ~= card and joker.facing == 'front' then
                faceup_joker = true
                break
            end
        end
        return faceup_joker
    end,
})

-- Subterror Nemesis Defender
SMODS.Joker({
    key = "sub_defender",
    atlas = 'sub',
    pos = { x = 1, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chips * (JoyousSpring.count_flipped('back', { G.jokers }) + JoyousSpring.count_materials_owned({ { monster_archetypes = { "Subterror" } } })) } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "BeastWarrior",
                monster_archetypes = { ["Subterror"] = true, ["SubterrorNemesis"] = true }
            },
            chips = 50
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if context.joker_main then
                return {
                    chips = card.ability.extra.chips *
                        (JoyousSpring.count_flipped('back', { G.jokers }) + JoyousSpring.count_materials_owned({ { monster_archetypes = { "Subterror" } } }))
                }
            end
            if context.selling_self and not context.blueprint then
                JoyousSpring.flip_all_cards('front')
            end
        end
    end
})

-- Subterror Nemesis Archer
SMODS.Joker({
    key = "sub_archer",
    atlas = 'sub',
    pos = { x = 2, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.creates } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Fairy",
                monster_archetypes = { ["Subterror"] = true, ["SubterrorNemesis"] = true }
            },
            flips = 1,
            creates = 1,
            activated = false
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card then
                if not card.ability.extra.activated and context.joy_activate_effect and context.joy_activated_card == card then
                    local targets = JoyousSpring.get_materials_owned({ { exclude_tokens = true, exclude_summon_types = { "LINK" } } })
                    local materials = {}
                    for i, joker in ipairs(targets) do
                        if joker ~= card and joker.facing == 'front' then
                            materials[#materials + 1] = joker
                        end
                    end
                    if next(materials) then
                        JoyousSpring.create_overlay_effect_selection(card, materials, card.ability.extra.flips,
                            card.ability.extra.flips, localize("k_joy_select"))
                    end
                end
                if not card.ability.extra.activated and context.joy_exit_effect_selection and context.joy_card == card and
                    #context.joy_selection == card.ability.extra.flips then
                    for _, selected_card in ipairs(context.joy_selection) do
                        selected_card:flip()
                    end
                    card:flip()
                    local choices = JoyousSpring.get_materials_in_collection({ { monster_archetypes = { "Subterror" }, exclude_keys = { "j_joy_sub_archer" }, rarity = 1 }, { monster_archetypes = { "Subterror" }, exclude_keys = { "j_joy_sub_archer" }, rarity = 2 } })
                    for _ = 1, card.ability.extra.creates do
                        local key_to_add = pseudorandom_element(choices, pseudoseed("j_joy_sub_archer"))
                        SMODS.add_card({
                            key = key_to_add or "j_joy_sub_warrior",
                            edition = "e_negative"
                        })
                    end
                    card.ability.extra.activated = true
                end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind.boss then
            card.ability.extra.activated = false
        end
    end,
    joy_can_activate = function(card)
        if card.ability.extra.activated then
            return false
        end
        local targets = JoyousSpring.get_materials_owned({ { exclude_tokens = true, exclude_summon_types = { "LINK" } } })
        local faceup_joker = false
        for _, joker in ipairs(targets) do
            if joker ~= card and joker.facing == 'front' then
                faceup_joker = true
                break
            end
        end
        return faceup_joker
    end,
})

-- Subterror Nemesis Warrior
SMODS.Joker({
    key = "sub_warrior",
    atlas = 'sub',
    pos = { x = 3, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.revives, card.ability.extra.mills } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Warrior",
                monster_archetypes = { ["Subterror"] = true, ["SubterrorNemesis"] = true }
            },
            tributes = 1,
            revives = 1,
            mills = 2
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card then
                if context.joy_activate_effect and context.joy_activated_card == card then
                    local targets = G.jokers.cards
                    local materials = {}
                    for i, joker in ipairs(targets) do
                        if joker ~= card then
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
                    for _, selected_card in ipairs(context.joy_selection) do
                        selected_card:start_dissolve()
                    end
                    card:start_dissolve()
                    for i = 1, card.ability.extra.revives do
                        local revived_card = JoyousSpring.revive_pseudorandom(
                            { { monster_archetypes = { "SubterrorBehemoth" } } },
                            pseudoseed("j_joy_sub_warrior"),
                            true
                        )
                        if not revived_card then
                            JoyousSpring.revive_pseudorandom(
                                { { monster_archetypes = { "Subterror" } } },
                                pseudoseed("j_joy_sub_warrior"),
                                true
                            )
                        end
                    end
                end
            end
            if JoyousSpring.calculate_flip_effect(card, context) then
                local choices = JoyousSpring.get_materials_in_collection({ { monster_archetypes = { "SubterrorBehemoth" } } })

                for i = 1, card.ability.extra.mill do
                    JoyousSpring.send_to_graveyard(pseudorandom_element(choices, pseudoseed("j_joy_sub_warrior")))
                end
            end
        end
    end,
    joy_can_activate = function(card)
        return #G.jokers.cards > 1
    end,
})

-- Subterror Guru
SMODS.Joker({
    key = "sub_guru",
    atlas = 'sub',
    pos = { x = 0, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 2, 2, 1, 1 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Dragon",
                monster_archetypes = { ["Subterror"] = true, ["SubterrorBehemoth"] = true }
            },
            flips = 2,
            xmult = 2,
            h_size = 1,
            creates = 1,
            activated = false,
            current_xmult = 0,
            current_h_size = 0,
        },
    },
    calculate = function(self, card, context)
        if context.setting_blind and context.main_eval and card.facing == 'back' then
            card:flip()
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.current_xmult
            }
        end
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card then
                if not card.ability.extra.activated and context.joy_activate_effect and context.joy_activated_card == card then
                    local targets = JoyousSpring.get_materials_owned({ { facedown = true }, { exclude_tokens = true, exclude_summon_types = { "LINK" } } })
                    local materials = {}
                    for i, joker in ipairs(targets) do
                        if joker ~= card then
                            materials[#materials + 1] = joker
                        end
                    end
                    if next(materials) then
                        JoyousSpring.create_overlay_effect_selection(card, materials, card.ability.extra.flips,
                            card.ability.extra.flips, localize("k_joy_select"))
                    end
                end
                if not card.ability.extra.activated and context.joy_exit_effect_selection and context.joy_card == card and
                    #context.joy_selection == card.ability.extra.flips then
                    local flips = { front = 0, back = 0 }
                    for _, selected_card in ipairs(context.joy_selection) do
                        selected_card:flip()
                        flips[selected_card.facing] = flips[selected_card.facing] + 1
                    end
                    card:flip()
                    flips[card.facing] = flips[card.facing] + 1

                    card.ability.extra.current_xmult = card.ability.extra.xmult * flips.back
                    card.ability.extra.current_h_size = card.ability.extra.h_size * flips.front
                    G.hand:change_size(card.ability.extra.current_h_size)

                    card.ability.extra.activated = true
                end
                if JoyousSpring.calculate_flip_effect(card, context) then
                    local choices = JoyousSpring.get_materials_in_collection({ { monster_archetypes = { "Subterror" }, exclude_keys = { "j_joy_sub_guru" }, rarity = 1 }, { monster_archetypes = { "Subterror" }, exclude_keys = { "j_joy_sub_guru" }, rarity = 2 } })
                    for _ = 1, card.ability.extra.creates do
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            local key_to_add = pseudorandom_element(choices, pseudoseed("j_joy_sub_guru"))
                            SMODS.add_card({
                                key = key_to_add or "j_joy_sub_warrior"
                            })
                        end
                    end
                end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval then
            G.hand:change_size(-card.ability.extra.current_h_size)
            card.ability.extra.current_xmult = 0
            card.ability.extra.current_h_size = 0
            card.ability.extra.activated = false
        end
    end,
    joy_can_activate = function(card)
        if card.ability.extra.activated or not G.GAME.blind.in_blind then
            return false
        end
        local targets = JoyousSpring.get_materials_owned({ { facedown = true }, { exclude_tokens = true, exclude_summon_types = { "LINK" } } })
        local faceup_joker = 0
        for _, joker in ipairs(targets) do
            if joker ~= card then
                faceup_joker = faceup_joker + 1
            end
        end
        return faceup_joker >= 2
    end,
    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.current_h_size > 0 then
            G.hand:change_size(-card.ability.extra.h_size)
        end
    end
})
SMODS.Joker({
    key = "sub_stygo",
    atlas = 'sub',
    pos = { x = 1, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1.5 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "SeaSerpent",
                monster_archetypes = { ["Subterror"] = true, ["SubterrorBehemoth"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_drago",
    atlas = 'sub',
    pos = { x = 2, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Zombie",
                monster_archetypes = { ["Subterror"] = true, ["SubterrorBehemoth"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_uma",
    atlas = 'sub',
    pos = { x = 3, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 2 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Reptile",
                monster_archetypes = { ["Subterror"] = true, ["SubterrorBehemoth"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_phos",
    atlas = 'sub',
    pos = { x = 0, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 30, 0, 5 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Aqua",
                monster_archetypes = { ["Subterror"] = true, ["SubterrorBehemoth"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_volt",
    atlas = 'sub',
    pos = { x = 1, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 50, 0 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Thunder",
                monster_archetypes = { ["Subterror"] = true, ["SubterrorBehemoth"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_stala",
    atlas = 'sub',
    pos = { x = 2, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 5 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Rock",
                monster_archetypes = { ["Subterror"] = true, ["SubterrorBehemoth"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_speleo",
    atlas = 'sub',
    pos = { x = 3, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 0.1, 1 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Fiend",
                monster_archetypes = { ["Subterror"] = true, ["SubterrorBehemoth"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_ultra",
    atlas = 'sub',
    pos = { x = 0, y = 3 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 200, 0 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Pyro",
                monster_archetypes = { ["Subterror"] = true, ["SubterrorBehemoth"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_befiendess",
    atlas = 'sub',
    pos = { x = 2, y = 3 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 100, 50, 0, 0, 2, 1 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Wyrm",
                monster_archetypes = { ["Subterror"] = true, ["SubterrorBehemoth"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_city",
    atlas = 'sub',
    pos = { x = 1, y = 3 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_field_spell = true,
            },
        },
    },
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "sub" },
    label = "k_joy_archetype_sub"
}
