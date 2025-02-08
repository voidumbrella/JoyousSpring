JoyousSpring.transform_card = function(card, other_key, keep_edition)
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:set_ability(G.P_CENTERS[other_key])
            play_sound("card1")
            card:juice_up(0.3, 0.3)
            return true
        end,
    }))
end

JoyousSpring.get_graveyard_count = function()
    if not JoyousSpring.graveyard then return 0 end

    local total = 0
    for _, count in pairs(JoyousSpring.graveyard) do
        total = total + count
    end
    return total
end

JoyousSpring.get_materials_owned = function(property_list, different_names)
    if not G.jokers then return {} end

    local materials = {}
    local keys = {}
    for _, joker in ipairs(G.jokers.cards) do
        if not property_list or #property_list == 0 then
            if not keys[joker.config.center_key] or not different_names then
                table.insert(materials, joker)
                keys[joker.config.center_key] = true
            end
        else
            for _, property in ipairs(property_list) do
                if keys[joker.config.center_key] and different_names then
                    break
                end
                if JoyousSpring.is_material(joker, property) then
                    table.insert(materials, joker)
                    keys[joker.config.center_key] = true
                    break
                end
            end
        end
    end
    return materials
end

JoyousSpring.count_materials_owned = function(property_list, different_names)
    return #JoyousSpring.get_materials_owned(property_list, different_names)
end

JoyousSpring.get_materials_in_graveyard = function(property_list, different_names)
    if not JoyousSpring.graveyard then return {} end

    local materials = {}
    for key, count in pairs(JoyousSpring.graveyard) do
        if count > 0 then
            if not property_list or #property_list == 0 then
                for i = 1, (different_names and 1 or count) do
                    table.insert(materials, key)
                end
            else
                for _, property in ipairs(property_list) do
                    if JoyousSpring.is_material_center(key, property) then
                        for i = 1, (different_names and 1 or count) do
                            table.insert(materials, key)
                        end
                        break
                    end
                end
            end
        end
    end
    return materials
end

JoyousSpring.count_materials_in_graveyard = function(property_list, different_names)
    return #JoyousSpring.get_materials_in_graveyard(property_list, different_names)
end

JoyousSpring.revive_pseudorandom = function(property_list, seed, must_have_room)
    if not must_have_room or (#G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit) then
        local choices = JoyousSpring.get_materials_in_graveyard(property_list)
        local key_to_add = pseudorandom_element(choices, seed)
        if key_to_add then
            local added_card = SMODS.add_card({
                key = key_to_add
            })
            added_card.ability.extra.joyous_spring.revived = true
            added_card:set_cost()
            JoyousSpring.graveyard[key_to_add] = JoyousSpring.graveyard[key_to_add] - 1
        end
    end
end

JoyousSpring.count_all_materials = function(property_list, different_names)
    return JoyousSpring.count_materials_in_graveyard(property_list, different_names) +
        JoyousSpring.count_materials_owned(property_list, different_names)
end

if JoyousSpring.debug then
    function calculate_reroll_cost(skip_increment)
        G.GAME.current_round.reroll_cost = 0
    end

    G.FUNCS.joy_debug_print = function(e)
        sendDebugMessage("test")
    end
end
