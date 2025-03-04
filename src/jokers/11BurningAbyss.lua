--- RUNICK
SMODS.Atlas({
    key = "BA",
    path = "11BurningAbyss.png",
    px = 71,
    py = 95
})

---Calculates if a BA dies
local ba_die = function()
    if next(SMODS.find_card("j_joy_ba_malacoda")) or next(SMODS.find_card("j_joy_ba_cherubini")) or next(SMODS.find_card("j_joy_ba_pilgrim")) or next(SMODS.find_card("j_joy_ba_virgil")) then
        return false
    end
    if JoyousSpring.count_materials_owned({ { is_monster = true, exclude_monster_types = { "Fiend" } } }) > 0 then
        return true
    end
end

SMODS.Joker({
    key = "ba_alich",
    atlas = 'BA',
    pos = { x = 0, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.percent * 100 } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["BurningAbyss"] = true }
            },
            percent = 0.1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.setting_blind and context.main_eval then
                if ba_die() then
                    card:start_dissolve()
                else
                    G.GAME.blind.chips = math.floor(G.GAME.blind.chips - G.GAME.blind.chips * card.ability.extra.percent)
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    return {
                        message = localize("k_active_ex")
                    }
                end
            end
        end
    end
})
SMODS.Joker({
    key = "ba_barbar",
    atlas = 'BA',
    pos = { x = 1, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.extra_mult, card.ability.extra.mult + (card.ability.extra.extra_mult * JoyousSpring.count_materials_in_graveyard({ { monster_type = "Fiend" } })) } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["BurningAbyss"] = true }
            },
            mult = 50,
            extra_mult = 10
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.setting_blind and context.main_eval and ba_die() then
                card:start_dissolve()
            end
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult +
                        (card.ability.extra.extra_mult * JoyousSpring.count_materials_in_graveyard({ { monster_type = "Fiend" } }))
                }
            end
        end
    end
})
SMODS.Joker({
    key = "ba_cagna",
    atlas = 'BA',
    pos = { x = 2, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mills } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["BurningAbyss"] = true }
            },
            chips = 200,
            mills = 3
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.setting_blind and context.main_eval then
                if ba_die() then
                    card:start_dissolve()
                else
                    local choices = JoyousSpring.get_materials_in_collection({ { monster_type = "Fiend" } })
                    for _ = 1, card.ability.extra.mills do
                        local key_to_send = pseudorandom_element(choices, pseudoseed("j_joy_ba_cagna"))
                        JoyousSpring.send_to_graveyard(key_to_send or "j_joy_ba_cagna")
                    end
                end
            end
            if context.joker_main then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
})
SMODS.Joker({
    key = "ba_calcab",
    atlas = 'BA',
    pos = { x = 3, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.h_size } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["BurningAbyss"] = true }
            },
            h_size = 3
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.setting_blind and context.main_eval and ba_die() then
                card:start_dissolve()
            end
        end
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
})
SMODS.Joker({
    key = "ba_cir",
    atlas = 'BA',
    pos = { x = 4, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.revives } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["BurningAbyss"] = true }
            },
            xmult = 3,
            revives = 2
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.setting_blind and context.main_eval then
                if ba_die() then
                    card:start_dissolve()
                else
                    for _ = 1, card.ability.extra.revives do
                        JoyousSpring.revive_pseudorandom({ { monster_archetypes = { "BurningAbyss" } } },
                            pseudoseed("j_joy_ba_cir"), true)
                    end
                end
            end
            if context.joker_main then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end
})
SMODS.Joker({
    key = "ba_draghig",
    atlas = 'BA',
    pos = { x = 0, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.creates } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["BurningAbyss"] = true }
            },
            chips = 100,
            creates = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.setting_blind and context.main_eval and ba_die() then
                card:start_dissolve()
            end
            if context.other_joker and JoyousSpring.is_monster_type(context.other_joker, "Fiend") then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff and card.facing ~= 'back' then
            local choices = JoyousSpring.get_materials_in_collection({ { monster_archetypes = { "BurningAbyss" }, is_main_deck = true, exclude_summon_types = { "RITUAL" }, exclude_keys = { "j_joy_ba_draghig" } } })
            for _ = 1, card.ability.extra.creates do
                local key_to_add = pseudorandom_element(choices, pseudoseed("j_joy_ba_draghig"))
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit -
                    ((card.edition and card.edition.negative) and 0 or 1) then
                    SMODS.add_card({
                        key = key_to_add or "j_joy_ba_alich"
                    })
                end
            end
        end
    end,
})
SMODS.Joker({
    key = "ba_farfa",
    atlas = 'BA',
    pos = { x = 1, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.banish } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["BurningAbyss"] = true }
            },
            banish = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.setting_blind and context.main_eval and ba_die() then
                card:start_dissolve()
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff and card.facing ~= 'back' then
            local choices = JoyousSpring.get_materials_owned({ { exclude_keys = { "j_joy_ba_farfa" } } })
            local to_banish = pseudorandom_element(choices, pseudoseed("j_joy_ba_farfa"))
            if to_banish then
                JoyousSpring.banish(to_banish, "end_of_round")
            end
        end
    end,
})
SMODS.Joker({
    key = "ba_graff",
    atlas = 'BA',
    pos = { x = 2, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.creates } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["BurningAbyss"] = true }
            },
            mult = 25,
            creates = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.setting_blind and context.main_eval and ba_die() then
                card:start_dissolve()
            end
            if context.other_joker and JoyousSpring.is_monster_type(context.other_joker, "Fiend") then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not card.debuff and not from_debuff and card.facing ~= 'back' then
            local choices = JoyousSpring.get_materials_in_collection({ { monster_archetypes = { "BurningAbyss" }, is_main_deck = true, exclude_summon_types = { "RITUAL" }, exclude_keys = { "j_joy_ba_draghig" } } })
            for _ = 1, card.ability.extra.creates do
                local key_to_add = pseudorandom_element(choices, pseudoseed("j_joy_ba_draghig"))
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit -
                    ((card.edition and card.edition.negative) and 0 or 1) then
                    SMODS.add_card({
                        key = key_to_add or "j_joy_ba_alich"
                    })
                end
            end
        end
    end,
})
SMODS.Joker({
    key = "ba_libic",
    atlas = 'BA',
    pos = { x = 3, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.revives } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["BurningAbyss"] = true }
            },
            revives = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.setting_blind and context.main_eval and ba_die() then
                card:start_dissolve()
                for _ = 1, card.ability.extra.revives do
                    JoyousSpring.revive_pseudorandom({ { monster_type = "Fiend" } },
                        pseudoseed("j_joy_ba_libic"), true)
                end
            end
        end
    end
})
SMODS.Joker({
    key = "ba_rubic",
    atlas = 'BA',
    pos = { x = 4, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.adds } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_tuner = true,
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["BurningAbyss"] = true }
            },
            adds = 1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.setting_blind and context.main_eval and ba_die() then
                card:start_dissolve()

                local choices = JoyousSpring.get_materials_in_collection({ { monster_archetypes = { "BurningAbyss" }, is_extra_deck = true } })
                for _ = 1, card.ability.extra.adds do
                    local key_to_add = pseudorandom_element(choices, pseudoseed("j_joy_ba_draghig"))
                    if #JoyousSpring.extra_deck_area.cards < JoyousSpring.extra_deck_area.config.card_limit then
                        JoyousSpring.add_to_extra_deck(key_to_add or "j_joy_ba_dante")
                    end
                end
            end
        end
    end
})
SMODS.Joker({
    key = "ba_scarm",
    atlas = 'BA',
    pos = { x = 0, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.creates } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["BurningAbyss"] = true }
            },
            creates = 2
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.setting_blind and context.main_eval and ba_die() then
                card:start_dissolve()
                local choices = JoyousSpring.get_materials_in_collection({ { monster_type = "Fiend", is_main_deck = true, exclude_keys = { "j_joy_ba_scarm" } } })
                for _ = 1, card.ability.extra.creates do
                    local key_to_add = pseudorandom_element(choices, pseudoseed("j_joy_ba_draghig"))
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit +
                        ((card.edition and card.edition.negative) and 0 or 1) then
                        SMODS.add_card({
                            key = key_to_add or "j_joy_ba_alich"
                        })
                    end
                end
            end
        end
    end
})
SMODS.Joker({
    key = "ba_malacoda",
    atlas = 'BA',
    pos = { x = 1, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.xmult, 1 +
            (card.ability.extra.xmult * JoyousSpring.count_materials_in_graveyard({ { monster_type = "Fiend" } })) }
        }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                summon_type = "RITUAL",
                attribute = "DARK",
                monster_type = "Fiend",
                monster_archetypes = { ["BurningAbyss"] = true },
                summon_conditions = {
                    {
                        type = "RITUAL",
                        materials = {
                            { monster_type = "Fiend" },
                            {},
                        }
                    }
                }
            },
            xmult = 0.1
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.joker_main then
                return {
                    xmult = 1 +
                        (card.ability.extra.xmult * JoyousSpring.count_materials_in_graveyard({ { monster_type = "Fiend" } }))
                }
            end
        end
    end
})
SMODS.Joker({
    key = "ba_cherubini",
    atlas = 'BA',
    pos = { x = 1, y = 3 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mills } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                summon_type = "LINK",
                attribute = "DARK",
                monster_type = "Fairy",
                monster_archetypes = { ["BurningAbyss"] = true },
                summon_conditions = {
                    {
                        type = "LINK",
                        materials = {
                            { monster_type = "Fiend" },
                            { monster_type = "Fiend" },
                        }
                    }
                }
            },
            mills = 3
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if context.setting_blind and context.main_eval then
                local choices = JoyousSpring.get_materials_in_collection({ { monster_archetypes = { "BurningAbyss" } } })
                for _ = 1, card.ability.extra.mills do
                    local key_to_send = pseudorandom_element(choices, pseudoseed("j_joy_ba_cagna"))
                    JoyousSpring.send_to_graveyard(key_to_send or "j_joy_ba_cagna")
                end
            end
        end
    end
})
SMODS.Joker({
    key = "ba_dante",
    atlas = 'BA',
    pos = { x = 4, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult * JoyousSpring.get_graveyard_count(), card.ability.extra.detach, card.ability.extra.mills } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                summon_type = "XYZ",
                attribute = "LIGHT",
                monster_type = "Warrior",
                monster_archetypes = { ["BurningAbyss"] = true, ["Dante"] = true },
                summon_conditions = {
                    {
                        type = "XYZ",
                        materials = {
                            { rarity = 1, exclude_tokens = true, exclude_summon_types = { "XYZ", "LINK" } },
                            { rarity = 1, exclude_tokens = true, exclude_summon_types = { "XYZ", "LINK" } },
                        }
                    }
                }
            },
            mult = 1,
            detach = 1,
            mills = 20
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and context.joy_detach and context.joy_detaching_card == card then
                local choices = JoyousSpring.get_materials_in_collection({ { is_monster = true } })
                for _ = 1, card.ability.extra.mills do
                    local key_to_send = pseudorandom_element(choices, pseudoseed("j_joy_ba_dante"))
                    JoyousSpring.send_to_graveyard(key_to_send or "j_joy_ba_cir")
                end
            end
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult * JoyousSpring.get_graveyard_count()
                }
            end
        end
    end
})
SMODS.Joker({
    key = "ba_pilgrim",
    atlas = 'BA',
    pos = { x = 2, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hands, card.ability.extra.discards } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                summon_type = "FUSION",
                attribute = "LIGHT",
                monster_type = "Fairy",
                monster_archetypes = { ["BurningAbyss"] = true, ["Dante"] = true },
                summon_conditions = {
                    {
                        type = "FUSION",
                        materials = {
                            { monster_archetypes = { "BurningAbyss" } },
                            { monster_archetypes = { "BurningAbyss" } },
                            { monster_archetypes = { "BurningAbyss" } },
                        },
                        restrictions = {
                            different_names = true
                        }
                    }
                }
            },
            hands = 2,
            discards = 2
        },
    },
    add_to_deck = function(self, card, from_debuff)
        if not JoyousSpring.is_perma_debuffed(card) then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
            ease_discard(card.ability.extra.discards)
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
            ease_hands_played(card.ability.extra.hands)
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if not JoyousSpring.is_perma_debuffed(card) then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discards
            ease_discard(-card.ability.extra.discards)
            G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
            ease_hands_played(-card.ability.extra.hands)
        end
    end,
})
SMODS.Joker({
    key = "ba_virgil",
    atlas = 'BA',
    pos = { x = 3, y = 2 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.h_size } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                summon_type = "SYNCHRO",
                attribute = "LIGHT",
                monster_type = "Spellcaster",
                monster_archetypes = { ["BurningAbyss"] = true },
                summon_conditions = {
                    {
                        type = "SYNCHRO",
                        materials = {
                            { is_tuner = true,        exclude_summon_types = { "XYZ", "LINK" } },
                            { monster_type = "Fiend", exclude_tuners = true,                   exclude_summon_types = { "XYZ", "LINK" } },
                        },
                    }
                }
            },
            h_size = 2
        },
    },
    add_to_deck = function(self, card, from_debuff)
        if not JoyousSpring.is_perma_debuffed(card) then
            G.hand:change_size(card.ability.extra.h_size)
        end
    end
})
SMODS.Joker({
    key = "ba_beatrice",
    atlas = 'BA',
    pos = { x = 0, y = 3 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, 1 + (card.ability.extra.xmult * JoyousSpring.get_graveyard_count()), card.ability.extra.detach, card.ability.extra.revives } }
    end,
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                summon_type = "XYZ",
                attribute = "LIGHT",
                monster_type = "Fairy",
                monster_archetypes = { ["BurningAbyss"] = true },
                summon_conditions = {
                    {
                        type = "XYZ",
                        materials = {
                            { rarity = 3, exclude_tokens = true, exclude_summon_types = { "XYZ", "LINK" } },
                            { rarity = 3, exclude_tokens = true, exclude_summon_types = { "XYZ", "LINK" } },
                        }
                    },
                    {
                        type = "XYZ",
                        materials = {
                            { monster_archetypes = { "Dante" } },
                        },
                        transfer_materials = true
                    },
                }
            },
            xmult = 0.05,
            detach = 1,
            revives = 1,
        },
    },
    calculate = function(self, card, context)
        if card.facing ~= 'back' then
            if not context.blueprint_card and context.joy_detach and context.joy_detaching_card == card then
                for _ = 1, card.ability.extra.revives do
                    local revived = JoyousSpring.revive_pseudorandom({ { monster_archetypes = { "BurningAbyss" } } },
                        pseudoseed("j_joy_ba_beatrice"), true)
                    if not revived then
                        JoyousSpring.revive_pseudorandom({ {} }, pseudoseed("j_joy_ba_beatrice"), true)
                    end
                end
            end
            if context.selling_self then
                if #JoyousSpring.extra_deck_area.cards + 1 < JoyousSpring.extra_deck_area.config.card_limit then
                    JoyousSpring.add_to_extra_deck("j_joy_ba_dante")
                    JoyousSpring.add_to_extra_deck("j_joy_ba_pilgrim")
                end
            end
            if context.joker_main then
                return {
                    xmult = 1 + (card.ability.extra.xmult * JoyousSpring.get_graveyard_count())
                }
            end
        end
    end
})


JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "ba" },
    label = "k_joy_archetype_ba"
}
