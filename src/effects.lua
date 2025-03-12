---EFFECTS

--#region Effect utils

local SMODS_calculate_context_ref = SMODS.calculate_context
function SMODS.calculate_context(context, return_table)
    JoyousSpring.calculate_context(context)
    return SMODS_calculate_context_ref(context, return_table)
end

---Does global effects when a context is being calculated
---@param context table
JoyousSpring.calculate_context = function(context)
    -- Global counter for destroyed cards
    if context.remove_playing_cards then
        G.GAME.joy_cards_destroyed = G.GAME.joy_cards_destroyed and
            (G.GAME.joy_cards_destroyed + #context.removed) or #context.removed
    end

    -- Return from Banishment
    if context.setting_blind then
        if G.GAME.blind and G.GAME.blind.boss then
            while #JoyousSpring.banish_boss_selected_area.cards > 0 do
                JoyousSpring.return_from_banish(JoyousSpring.banish_boss_selected_area.cards[1])
            end
        end
        while #JoyousSpring.banish_blind_selected_area.cards > 0 do
            JoyousSpring.return_from_banish(JoyousSpring.banish_blind_selected_area.cards[1])
        end
    end
    if context.end_of_round and context.game_over == false then
        if G.GAME.blind and G.GAME.blind.boss then
            while #JoyousSpring.banish_end_of_ante_area.cards > 0 do
                JoyousSpring.return_from_banish(JoyousSpring.banish_end_of_ante_area.cards[1])
            end
        end
        while #JoyousSpring.banish_end_of_round_area.cards > 0 do
            JoyousSpring.return_from_banish(JoyousSpring.banish_end_of_round_area.cards[1])
        end
    end

    -- Add extra pack for Extra YGO Booster config
    if context.starting_shop and JoyousSpring.config.extra_ygo_booster then
        local choices = {
            "p_joy_monster_pack",
            "p_joy_jumbo_monster_pack",
            "p_joy_mega_monster_pack",
            "p_joy_extra_pack",
            "p_joy_jumbo_extra_pack",
            "p_joy_mega_extra_pack",
        }
        SMODS.add_booster_to_shop(pseudorandom_element(choices, pseudoseed("JoyousSpring")) or "p_joy_monster_pack")
    end
end

---Changes a card's ability with a little animation
---@param card Card
---@param other_key string
---@param keep_edition boolean? Not implemented, keeps it by default
JoyousSpring.transform_card = function(card, other_key, keep_edition)
    local joyous_spring_table = card.ability.extra.joyous_spring
    local revived = joyous_spring_table.revived
    local is_free = joyous_spring_table.is_free
    local summoned = joyous_spring_table.summoned
    local summon_materials = joyous_spring_table.summon_materials
    local xyz_materials = joyous_spring_table.xyz_materials
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:set_ability(G.P_CENTERS[other_key])
            play_sound("card1")
            card:juice_up(0.3, 0.3)
            local joyous_spring_table = card.ability.extra.joyous_spring
            joyous_spring_table.revived = revived
            joyous_spring_table.is_free = is_free
            joyous_spring_table.summoned = summoned
            joyous_spring_table.summon_materials = summon_materials
            joyous_spring_table.xyz_materials = xyz_materials
            return true
        end,
    }))
end

---Creates cards with "permanent" debuffs
---@param card Card
---@param source string?
---@param edition any
---@return Card
JoyousSpring.create_perma_debuffed_card = function(card, source, edition)
    if type(card) == "string" then
        local added_card = SMODS.create_card({
            key = card,
            edition = edition or {}
        })
        SMODS.debuff_card(added_card, true, source)
        if JoyousSpring.is_monster_card(added_card) then
            added_card.ability.extra.joyous_spring.perma_debuffed = true
        end
        added_card:set_cost()
        added_card:add_to_deck()
        G.jokers:emplace(added_card)
        return added_card
    else
        SMODS.debuff_card(card, true, source)
        if JoyousSpring.is_monster_card(card) then
            card.ability.extra.joyous_spring.perma_debuffed = true
        end
        card:set_cost()
        return card
    end
end

---Creates a random playing card and adds it to hand
---@param enhanced_prob number? Probability of enhancements
---@param silent boolean?
---@param colours table?
---@param seed number?
JoyousSpring.create_random_playing_card = function(enhanced_prob, silent, colours, seed)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.3,
        func = function()
            local _rank = pseudorandom_element({ 'A', '2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K' },
                seed or pseudoseed('JoyousSpring')) or 'A'
            local _suit = pseudorandom_element({ 'S', 'H', 'D', 'C' }, seed or pseudoseed('JoyousSpring')) or 'S'
            local cen_pool = {}
            for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                if v.key ~= 'm_stone' then
                    cen_pool[#cen_pool + 1] = v
                end
            end
            local enhanced = enhanced_prob >= 1 and
                (pseudorandom(seed or pseudoseed('JoyousSpring')) < 1 / enhanced_prob and true) or false
            create_playing_card(
                {
                    front = G.P_CARDS[_suit .. '_' .. _rank],
                    center = enhanced and pseudorandom_element(cen_pool,
                        seed or pseudoseed('JoyousSpring')) or nil
                },
                G.hand,
                nil,
                silent,
                colours or { G.C.JOY.EFFECT }
            )
            return true
        end
    }))
end

---Sets cost of a card after Card:set_cost, if necessary
---Use joy_set_cost in the center to modify that card's cost and sell_cost
---@param card Card
JoyousSpring.set_cost = function(card)
    if JoyousSpring.is_monster_card(card) then
        if JoyousSpring.is_perma_debuffed(card) then
            card.sell_cost = 1
        elseif JoyousSpring.is_summoned(card) then
            card.sell_cost = card.cost + (card.ability.extra_value or 0)
        elseif JoyousSpring.is_revived(card) then
            card.sell_cost = 1 + (card.ability.extra_value or 0)
        end
        if card.config.center.joy_set_cost then
            card.config.center.joy_set_cost(card)
        end
        if JoyousSpring.is_free(card) then
            card.cost = 0
        end
    end
    if card.joy_modify_cost then
        if card.joy_modify_cost.cost then
            card.cost = card.joy_modify_cost.cost
        end
        if card.joy_modify_cost.sell_cost then
            card.sell_cost = card.joy_modify_cost.sell_cost
        end
    end
end

---Debuffs a hand similar to a blind
---Use joy_debuff_hand in the center to check if a hand should be debuffed by that card's effect
---@param cards Card[]
---@param hand Card[]
---@param handname string
---@return boolean
JoyousSpring.debuff_hand = function(cards, hand, handname)
    for _, joker in ipairs(G.jokers.cards) do
        if joker.config.center.joy_debuff_hand and joker.config.center.joy_debuff_hand(joker, cards, hand, handname) then
            return true
        end
    end
    for _, joker in ipairs(JoyousSpring.field_spell_area.cards) do
        if joker.config.center.joy_debuff_hand and joker.config.center.joy_debuff_hand(joker, cards, hand, handname) then
            return true
        end
    end
    return false
end

G.FUNCS.joy_detach_material = function(e)
    local card = e.config.ref_table
    local detach = card.ability.extra.detach or 1
    if JoyousSpring.get_xyz_materials(card) >= detach then
        card.ability.extra.joyous_spring.xyz_materials = card.ability.extra.joyous_spring.xyz_materials - detach
        SMODS.calculate_context({ joy_detach = true, joy_detaching_card = card })
    end
end

local create_card_for_shop_ref = create_card_for_shop
function create_card_for_shop(area)
    local card = create_card_for_shop_ref(area)
    if card and G.jokers then
        for _, joker in ipairs(G.jokers.cards) do
            if joker.config.center.joy_create_card_for_shop then
                joker.config.center.joy_create_card_for_shop(card, area)
            end
        end
        if JoyousSpring.field_spell_area then
            for _, joker in ipairs(JoyousSpring.field_spell_area.cards) do
                if joker.config.center.joy_create_card_for_shop then
                    joker.config.center.joy_create_card_for_shop(card, area)
                end
            end
        end
    end
    return card
end

local cardarea_emplace_ref = CardArea.emplace
function CardArea:emplace(card, location, stay_flipped)
    if self == G.jokers then
        for _, joker in ipairs(G.jokers.cards) do
            if joker.config.center.joy_apply_to_jokers_added then
                joker.config.center.joy_apply_to_jokers_added(joker, card)
            end
        end
        for _, joker in ipairs(JoyousSpring.field_spell_area.cards) do
            if joker.config.center.joy_apply_to_jokers_added then
                joker.config.center.joy_apply_to_jokers_added(joker, card)
            end
        end
    end
    cardarea_emplace_ref(self, card, location, stay_flipped)
end

JoyousSpring.stay_flipped = function(card, stay_flipped)
    local keep_flipped = stay_flipped or false
    if G.jokers then
        for _, joker in ipairs(G.jokers.cards) do
            if joker.config.center.joy_stay_flipped then
                keep_flipped = joker.config.center.joy_stay_flipped(card)
            end
        end
    end
    if JoyousSpring.field_spell_area then
        for _, joker in ipairs(JoyousSpring.field_spell_area.cards) do
            if joker.config.center.joy_stay_flipped then
                keep_flipped = joker.config.center.joy_stay_flipped(card)
            end
        end
    end
    if keep_flipped then
        SMODS.calculate_context({ joy_card_flipped = card })
    end
    return keep_flipped
end

--#endregion

--#region UI

JoyousSpring.create_UIBox_effect_selection = function(card, text, select_text)
    local colour = G.C.JOY.EFFECT
    return {
        n = G.UIT.ROOT,
        config = {
            align = "cm",
            minw = G.ROOM.T.w * 5,
            minh = G.ROOM.T.h * 5,
            padding = 0.1,
            r = 0.1,
            colour = { colour[1], colour[2], colour[3], 0.7 }
        },
        nodes = {
            {
                n = G.UIT.R,
                config = {
                    align = "cm",
                    minh = 1,
                    r = 0.3,
                    padding = 0.07,
                    minw = 1,
                    colour = lighten(colour, 0.4),
                    emboss = 0.1
                },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = {
                            align = "cm",
                            minh = 1,
                            r = 0.2,
                            padding = 0.05,
                            minw = 1,
                            colour = G.C.L_BLACK
                        },
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = {
                                    align = "cm",
                                    padding = 0.05,
                                    minw = 7
                                },
                                nodes = {
                                    {
                                        n = G.UIT.O,
                                        config = {
                                            object = DynaText({
                                                string = { text or localize("k_joy_select_tributes") },
                                                colours = { G.C.UI.TEXT_LIGHT },
                                                bump = true,
                                                silent = true,
                                                pop_in = 0,
                                                pop_in_rate = 4,
                                                minw = 10,
                                                shadow = true,
                                                y_offset = -0.6,
                                                scale = 0.8
                                            })
                                        }
                                    }
                                }

                            },
                            {
                                n = G.UIT.R,
                                config = {
                                    align = "cm",
                                    padding = 0.2,
                                    minw = 7
                                },
                                nodes = {
                                    {
                                        n = G.UIT.R,
                                        config = {
                                            r = 0.1,
                                            minw = 7,
                                            minh = 5,
                                            align = "cm",
                                            padding = 1,
                                            colour = G.C.BLACK
                                        },
                                        nodes = {
                                            {
                                                n = G.UIT.R,
                                                config = {
                                                    align = "cm",
                                                    padding = 0.07,
                                                    no_fill = true,
                                                    scale = 1
                                                },
                                                nodes = {
                                                    {
                                                        n = G.UIT.O,
                                                        config = {
                                                            object = JoyousSpring.summon_effect_area
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = {
                                    align = "cm",
                                    padding = 0.1,
                                    minw = 7,
                                    colour = G.C.CLEAR,
                                },
                                nodes = {
                                    {
                                        n = G.UIT.C,
                                        config = {
                                            ref_table = card,
                                            align = "cm",
                                            minh = 0.7,
                                            minw = 10,
                                            padding = 0.1,
                                            r = 0.1,
                                            hover = true,
                                            colour = G.C.UI.BACKGROUND_INACTIVE,
                                            button = 'joy_exit_select_effect',
                                            shadow = true,
                                            func = 'joy_can_select_effect',
                                            focus_args = {
                                                nav = 'wide',
                                                button = 'rightshoulder'
                                            }
                                        },
                                        nodes = {
                                            {
                                                n = G.UIT.R,
                                                config = { align = "cm", padding = 0, no_fill = true },
                                                nodes = {
                                                    {
                                                        n = G.UIT.T,
                                                        config = {
                                                            text = select_text or localize('k_joy_summon'),
                                                            scale = 0.5,
                                                            colour = G.C.UI.TEXT_LIGHT,
                                                            shadow = true,
                                                            func = 'set_button_pip',
                                                            focus_args = {
                                                                button = 'rightshoulder'
                                                            }
                                                        }
                                                    }
                                                }
                                            },
                                        }
                                    },
                                    {
                                        n = G.UIT.C,
                                        config = {
                                            align = "cm",
                                            minh = 0.7,
                                            minw = 3,
                                            padding = 0.1,
                                            r = 0.1,
                                            hover = true,
                                            colour = colour,
                                            button = "exit_overlay_menu",
                                            shadow = true,
                                            focus_args = {
                                                nav = 'wide',
                                                button = 'b'
                                            }
                                        },
                                        nodes = {
                                            {
                                                n = G.UIT.R,
                                                config = { align = "cm", padding = 0, no_fill = true },
                                                nodes = {
                                                    {
                                                        n = G.UIT.T,
                                                        config = {
                                                            text = localize('b_back'),
                                                            scale = 0.5,
                                                            colour = G.C.UI.TEXT_LIGHT,
                                                            shadow = true,
                                                            func = 'set_button_pip',
                                                            focus_args = {
                                                                button = 'b'
                                                            }
                                                        }
                                                    }
                                                }
                                            },
                                        }
                                    },
                                }
                            },
                        }
                    },
                }
            },
        }
    }
end

JoyousSpring.create_overlay_effect_selection = function(card, card_list, min, max, text, select_text)
    local highlight_limit = max or min or 1

    JoyousSpring.summon_effect_area = CardArea(
        0,
        0,
        G.CARD_W * 4.95,
        G.CARD_H,
        {
            type = 'summon_materials',
            highlight_limit = highlight_limit,
        }
    )

    for _, joker in ipairs(card_list) do
        local added_joker = copy_card(joker)
        if JoyousSpring.is_monster_card(joker) then
            for k, v in pairs(joker.ability.extra.joyous_spring) do
                added_joker.ability.extra.joyous_spring[k] = v
            end
            if joker.config.center.key == "j_joy_token" then
                added_joker.children.center.atlas.name = joker.ability.extra.joyous_spring.token_atlas
                added_joker.children.center.sprite_pos = joker.ability.extra.joyous_spring.token_sprite_pos
                added_joker.children.center:reset()
            end
        end
        JoyousSpring.summon_effect_area:emplace(added_joker)
        if joker.ability.set == 'Joker' then
            for i, og_joker in ipairs(G.jokers.cards) do
                if og_joker == joker then
                    added_joker.joy_g_jokers_pos = i
                end
            end
        else
            for i, og_consumeable in ipairs(G.consumeables.cards) do
                if og_consumeable == joker then
                    added_joker.joy_g_consumeables_pos = i
                end
            end
        end
    end

    card.joy_min_selection = min
    card.joy_max_selection = max

    G.FUNCS.overlay_menu({
        definition = JoyousSpring.create_UIBox_effect_selection(card, text, select_text)
    })
end

G.FUNCS.joy_activate_effect = function(e)
    local card = e.config.ref_table

    SMODS.calculate_context({ joy_activate_effect = true, joy_activated_card = card })
    card:highlight(false)
end

G.FUNCS.joy_can_activate = function(e)
    local card = e.config.ref_table

    if card and JoyousSpring.can_activate(card) then
        e.config.colour = G.C.JOY.EFFECT
        e.config.button = 'joy_activate_effect'
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.joy_can_select_effect = function(e)
    local card = e.config.ref_table

    if card and JoyousSpring.summon_effect_area and next(JoyousSpring.summon_effect_area.highlighted) then
        local count = #JoyousSpring.summon_effect_area.highlighted
        if (card.joy_min_selection and count < card.joy_min_selection) or (card.joy_max_selection and count > card.joy_max_selection) then
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
        else
            e.config.colour = G.C.JOY.EFFECT
            e.config.button = 'joy_exit_select_effect'
        end
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.joy_exit_select_effect = function(e)
    if not G.OVERLAY_MENU then return end

    local card = e.config.ref_table

    if card and JoyousSpring.summon_effect_area and next(JoyousSpring.summon_effect_area.highlighted) then
        local material_list = {}
        for _, material in ipairs(JoyousSpring.summon_effect_area.highlighted) do
            if material.joy_g_jokers_pos then
                table.insert(material_list, G.jokers.cards[material.joy_g_jokers_pos])
            end
            if material.joy_g_consumeables_pos then
                table.insert(material_list, G.consumeables.cards[material.joy_g_consumeables_pos])
            end
        end
        JoyousSpring.open_extra_deck(true, false)
        SMODS.calculate_context({ joy_exit_effect_selection = true, joy_card = card, joy_selection = material_list })
    end
    G.FUNCS.exit_overlay_menu()
end

--#endregion
