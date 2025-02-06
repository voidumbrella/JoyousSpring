JoyousSpring.is_monster_card = function(card)
    return card.ability and card.ability.extra and type(card.ability.extra) == "table" and
        card.ability.extra.joyous_spring or false
end

JoyousSpring.is_monster_archetype = function(card, archetype)
    return JoyousSpring.is_monster_card(card) and
        card.ability.extra.joyous_spring.monster_archetypes[archetype] or false
end

JoyousSpring.is_monster_type = function(card, monster_type)
    return JoyousSpring.is_monster_card(card) and
        card.ability.extra.joyous_spring.monster_type == monster_type
end

JoyousSpring.is_attribute = function(card, attribute)
    return JoyousSpring.is_monster_card(card) and
        card.ability.extra.joyous_spring.attribute == attribute
end

JoyousSpring.is_effect_monster = function(card)
    return JoyousSpring.is_monster_card(card) and
        card.ability.extra.joyous_spring.is_effect
end

JoyousSpring.is_main_deck_monster = function(card)
    return JoyousSpring.is_monster_card(card) and
        card.ability.extra.joyous_spring.is_main_deck
end

JoyousSpring.is_extra_deck_monster = function(card)
    return JoyousSpring.is_monster_card(card) and
        not card.ability.extra.joyous_spring.is_main_deck
end

JoyousSpring.is_summon_type = function(card, summon_type)
    return JoyousSpring.is_monster_card(card) and
        card.ability.extra.joyous_spring.summon_type == summon_type
end

JoyousSpring.is_pendulum_monster = function(card)
    return JoyousSpring.is_monster_card(card) and card.ability.extra.joyous_spring.is_pendulum or false
end

JoyousSpring.is_material = function(card, properties)

    if card.ability.eternal or card.facing == 'back' then
        return false
    end
    if properties.func then
        if not properties.func(card, properties.func_vars) then
            return false
        end
    end
    if properties.key then
        if card.config.center_key ~= properties.key then
            return false
        end
    end
    if properties.exclude_keys then
        for _, key in ipairs(properties.exclude_keys) do
            if card.config.center_key == key then
                return false
            end
        end
    end
    if properties.is_token then
        if card.config.center_key ~= "j_joy_token" then
            return false
        end
    end
    if properties.exclude_tokens then
        if card.config.center_key == "j_joy_token" then
            return false
        end
    end
    if properties.rarity then
        if card.rarity ~= properties.rarity then
            return false
        end
    end
    if properties.exclude_rarities then
        for _, rarity in ipairs(properties.exclude_rarities) do
            if card.rarity == rarity then
                return false
            end
        end
    end
    if properties.is_joker then
        return not JoyousSpring.is_monster_card(card)
    end
    if properties.is_monster or properties.monster_type or properties.monster_attribute or properties.monster_archetypes or properties.is_pendulum or properties.summon_type or properties.is_effect or properties.is_non_effect or properties.is_normal then
        if not JoyousSpring.is_monster_card(card) then
            return false
        end
    end
    if properties.exclude_monster_types or properties.exclude_monster_attributes or properties.exclude_monster_archetypes or properties.exclude_pendulum or properties.exclude_summon_types then
        if not JoyousSpring.is_monster_card(card) then
            return true
        end
    end
    if properties.monster_type then
        if not JoyousSpring.is_monster_type(card, properties.monster_type) then
            return false
        end
    end
    if properties.exclude_monster_types then
        for _, monster_type in ipairs(properties.exclude_monster_types) do
            if JoyousSpring.is_monster_type(card, monster_type) then
                return false
            end
        end
    end
    if properties.monster_attribute then
        if not JoyousSpring.is_attribute(card, properties.monster_attribute) then
            return false
        end
    end
    if properties.exclude_monster_attributes then
        for _, monster_attribute in ipairs(properties.exclude_monster_attributes) do
            if JoyousSpring.is_attribute(card, monster_attribute) then
                return false
            end
        end
    end
    if properties.monster_archetypes then
        for _, monster_archetype in ipairs(properties.monster_archetypes) do
            if not JoyousSpring.is_monster_archetype(card, monster_archetype) then
                return false
            end
        end
    end
    if properties.exclude_monster_archetypes then
        for _, monster_archetype in ipairs(properties.exclude_monster_archetypes) do
            if JoyousSpring.is_monster_archetype(card, monster_archetype) then
                return false
            end
        end
    end
    if properties.is_pendulum then
        if not JoyousSpring.is_pendulum_monster(card) then
            return false
        end
    end
    if properties.exclude_pendulum then
        if JoyousSpring.is_pendulum_monster(card) then
            return false
        end
    end
    if properties.summon_type then
        if not JoyousSpring.is_summon_type(card, properties.summon_type) then
            return false
        end
    end
    if properties.exclude_summon_types then
        for _, summon_type in ipairs(properties.exclude_summon_types) do
            if JoyousSpring.is_summon_type(card, summon_type) then
                return false
            end
        end
    end
    if properties.is_effect then
        if not JoyousSpring.is_effect_monster(card) then
            return false
        end
    end
    if properties.is_non_effect then
        if JoyousSpring.is_effect_monster(card) then
            return false
        end
    end
    if properties.is_normal then
        if JoyousSpring.is_effect_monster(card) or JoyousSpring.is_extra_deck_monster(card) then
            return false
        end
    end
    return true
end

JoyousSpring.filter_materials_on_properties = function(properties, card_list)
    local card_table = card_list or G.jokers.cards
    local filtered_table = {}

    for _, card in ipairs(card_table) do
        if JoyousSpring.is_material(card, properties) then
            table.insert(filtered_table, card)
        end
    end

    return filtered_table
end

JoyousSpring.filter_materials_on_conditions = function(condition, card_list)
    if not condition.materials then return {} end

    local card_table = card_list or G.jokers.cards
    local filtered_table = {}

    for _, properties in ipairs(condition.materials) do
        local filtered_by_property = JoyousSpring.filter_materials_on_properties(properties, card_table)

        if #filtered_by_property == 0 and not properties.optional then return {} end
        table.insert(filtered_table,filtered_by_property)
    end

    return filtered_table
end

JoyousSpring.is_valid_material_combo = function(combo_list, restrictions)
    for i = 1, #combo_list do
        for j = i + 1, #combo_list do
            local card_1 = combo_list[i]
            local card_2 = combo_list[j]
            if card_1 == card_2 then
                return false
            end
            if not restrictions then
                break
            end
            if restrictions.different_names and card_1.config.center_key == card_2.config.center_key then
                return false
            end
            if restrictions.same_name and card_1.config.center_key ~= card_2.config.center_key then
                return false
            end
            if restrictions.different_rarities and card_1.rarity == card_2.rarity then
                return false
            end
            if restrictions.same_rarity and card_1.rarity ~= card_2.rarity then
                return false
            end
            if restrictions.different_attributes or restrictions.same_attribute or restrictions.different_types or restrictions.same_type then
                if not JoyousSpring.is_monster_card(card_1) or not JoyousSpring.is_monster_card(card_2) then
                    return false
                end
                local card_1_properties = card_1.ability.extra.joyous_spring
                local card_2_properties = card_2.ability.extra.joyous_spring
                if restrictions.different_attributes and card_1_properties.attribute == card_2_properties.attribute then
                    return false
                end
                if restrictions.same_attribute and card_1_properties.attribute ~= card_2_properties.attribute then
                    return false
                end
                if restrictions.different_types and card_1_properties.monster_type == card_2_properties.monster_type then
                    return false
                end
                if restrictions.same_type and card_1_properties.monster_type ~= card_2_properties.monster_type then
                    return false
                end
            end
        end
    end
    return true
end

JoyousSpring.get_summon_material_combo_by_condition = function(condition, card_list)
    local card_table = card_list or G.jokers.cards
    local material_combos = {}

    local filtered_materials = JoyousSpring.filter_materials_on_conditions(condition, card_table)
    if not filtered_materials or #filtered_materials == 0 or #filtered_materials ~= #condition.materials then return {} end

    local function backtrack(combo, remaining_material_sets)
        if #remaining_material_sets == 0 then
            if JoyousSpring.is_valid_material_combo(combo, condition.restrictions) then
                table.insert(material_combos, combo)
            end
            return
        end
        local filtered = remaining_material_sets[1]
        for i = 1, #filtered do
            local card = filtered[i]
            local new_combo = { unpack(combo) }
            table.insert(new_combo, card)
            backtrack(new_combo, { unpack(remaining_material_sets, 2) })
        end
    end
    backtrack({}, filtered_materials)

    return material_combos
end

JoyousSpring.get_all_summon_material_combos = function(card, card_list)
    local card_table = card_list or G.jokers.cards

    if not JoyousSpring.is_monster_card(card) or not card.ability.extra.joyous_spring.summon_conditions then
        return nil
    end

    local conditions = card.ability.extra.joyous_spring.summon_conditions
    local material_combos = {}

    for _, condition in ipairs(conditions) do
        local combos_by_condition = JoyousSpring.get_summon_material_combo_by_condition(condition, card_table)
        for _, combo in ipairs(combos_by_condition) do
            table.insert(material_combos, combo)
        end
    end

    return material_combos
end

JoyousSpring.can_summon_by_condition = function(condition, card_list)
    local card_table = card_list or G.jokers.cards

    local filtered_materials = JoyousSpring.filter_materials_on_conditions(condition, card_table)

    if not filtered_materials or #filtered_materials == 0 or #filtered_materials ~= #condition.materials then return false end
    
    local function backtrack(combo, remaining_material_sets)
        if #remaining_material_sets == 0 then
            if JoyousSpring.is_valid_material_combo(combo, condition.restrictions) then
                return true
            end
            return false
        end
        local filtered = remaining_material_sets[1]
        for i = 1, #filtered do
            local card = filtered[i]
            local new_combo = { unpack(combo) }
            table.insert(new_combo, card)

            if backtrack(new_combo, { unpack(remaining_material_sets, 2) }) then
                return true
            end
        end
        return false
    end

    return backtrack({}, filtered_materials)
end

JoyousSpring.can_summon = function(card, card_list)
    local card_table = card_list or G.jokers.cards

    if not JoyousSpring.is_monster_card(card) then
        return false
    end
    if not card.ability.extra.joyous_spring.summon_conditions then
        return true
    end

    local conditions = card.ability.extra.joyous_spring.summon_conditions

    for _, condition in ipairs(conditions) do
        local combos_by_condition = JoyousSpring.can_summon_by_condition(condition, card_table)
        if combos_by_condition then
            return true
        end
    end

    return false
end

JoyousSpring.perform_summon = function (card, card_list)
    for _, joker in ipairs(card_list) do
        JoyousSpring.remove_material(joker)
    end
    JoyousSpring.extra_deck_area:remove_card(card)
    G.jokers:emplace(card)
end