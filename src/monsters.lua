---@diagnostic disable: deprecated
--- MONSTERS

-- Individual checks

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
        card.ability.extra.joyous_spring.is_all_attributes or
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

JoyousSpring.is_tuner_monster = function(card)
    return JoyousSpring.is_monster_card(card) and card.ability.extra.joyous_spring.is_tuner or false
end

JoyousSpring.is_nontuner_monster = function(card)
    return not JoyousSpring.is_tuner_monster(card)
end

JoyousSpring.is_field_spell = function(card)
    return JoyousSpring.is_monster_card(card) and card.ability.extra.joyous_spring.is_field_spell or false
end

JoyousSpring.is_all_materials = function(card, summon_type)
    return JoyousSpring.is_monster_card(card) and card.ability.extra.joyous_spring.is_all_materials and
        card.ability.extra.joyous_spring.is_all_materials[summon_type]
end

JoyousSpring.is_summoned = function(card)
    return JoyousSpring.is_monster_card(card) and card.ability.extra.joyous_spring.summoned or false
end

JoyousSpring.is_revived = function(card)
    return JoyousSpring.is_monster_card(card) and card.ability.extra.joyous_spring.revived or false
end

JoyousSpring.is_perma_debuffed = function(card)
    return JoyousSpring.is_monster_card(card) and card.ability.extra.joyous_spring.perma_debuffed or false
end

JoyousSpring.is_free = function(card)
    return JoyousSpring.is_monster_card(card) and card.ability.extra.joyous_spring.is_free or false
end

JoyousSpring.get_materials = function(card)
    return JoyousSpring.is_monster_card(card) and card.ability.extra.joyous_spring.summon_materials or {}
end

JoyousSpring.get_xyz_materials = function(card)
    return JoyousSpring.is_monster_card(card) and card.ability.extra.joyous_spring.xyz_materials or 0
end

-- General checks

JoyousSpring.is_material = function(card, properties, summon_type)
    if summon_type and card.ability.eternal then
        return false
    end
    if not next(properties) then
        return true
    end
    if card.facing == 'back' then
        return false
    end
    if summon_type and JoyousSpring.is_all_materials(card, summon_type) then
        return true
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
        if card.config.center.rarity ~= properties.rarity then
            return false
        end
    end
    if properties.exclude_rarities then
        for _, rarity in ipairs(properties.exclude_rarities) do
            if card.config.center.rarity == rarity then
                return false
            end
        end
    end
    if properties.is_debuffed then
        if not card.debuff then
            return false
        end
    end
    if properties.exclude_debuffed then
        if card.debuff then
            return false
        end
    end
    if properties.is_joker then
        return not JoyousSpring.is_monster_card(card)
    end
    if not JoyousSpring.is_monster_card(card) then
        return not (properties.is_monster or properties.monster_type or properties.monster_attribute or properties.monster_archetypes or properties.is_pendulum or properties.summon_type or properties.is_effect or properties.is_non_effect or properties.is_normal or properties.is_extra_deck or properties.is_main_deck or properties.is_summoned) or
            false
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
    if properties.is_extra_deck then
        if not JoyousSpring.is_extra_deck_monster(card) then
            return false
        end
    end
    if properties.exclude_extra_deck then
        if JoyousSpring.is_extra_deck_monster(card) then
            return false
        end
    end
    if properties.is_main_deck then
        if not JoyousSpring.is_main_deck_monster(card) then
            return false
        end
    end
    if properties.exclude_main_deck then
        if JoyousSpring.is_main_deck_monster(card) then
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
    if properties.is_summoned then
        if not JoyousSpring.is_summoned(card) then
            return false
        end
    end
    if properties.exclude_summoned then
        if JoyousSpring.is_summoned(card) then
            return false
        end
    end
    if properties.is_tuner then
        if JoyousSpring.is_nontuner_monster(card) then
            return false
        end
    end
    if properties.exclude_tuners then
        if JoyousSpring.is_tuner_monster(card) then
            return false
        end
    end
    return true
end

JoyousSpring.is_material_center = function(card_key, properties)
    local card_center = G.P_CENTERS[card_key]

    if not card_center then return false end

    if properties.func_center then
        if not properties.func_center(card_center, properties.func_vars) then
            return false
        end
    end
    if properties.key then
        if card_key ~= properties.key then
            return false
        end
    end
    if properties.exclude_keys then
        for _, key in ipairs(properties.exclude_keys) do
            if card_key == key then
                return false
            end
        end
    end
    if properties.is_token then
        if card_key ~= "j_joy_token" then
            return false
        end
    end
    if properties.exclude_tokens then
        if card_key == "j_joy_token" then
            return false
        end
    end
    if properties.rarity then
        if card_center.rarity ~= properties.rarity then
            return false
        end
    end
    if properties.exclude_rarities then
        for _, rarity in ipairs(properties.exclude_rarities) do
            if card_center.rarity == rarity then
                return false
            end
        end
    end
    if properties.is_debuffed then
        return false
    end

    local monster_card_properties = card_center.config and card_center.config.extra and
        type(card_center.config.extra) == "table" and
        card_center.config.extra.joyous_spring

    if properties.is_joker then
        return not monster_card_properties
    end
    if properties.is_monster or properties.monster_type or properties.monster_attribute or properties.monster_archetypes or properties.is_pendulum or properties.summon_type or properties.is_effect or properties.is_non_effect or properties.is_normal then
        if not monster_card_properties then
            return false
        end
    end
    if properties.exclude_monster_types or properties.exclude_monster_attributes or properties.exclude_monster_archetypes or properties.exclude_pendulum or properties.exclude_summon_types then
        if not monster_card_properties then
            return true
        end
    end
    if not monster_card_properties then
        return false
    end
    if properties.monster_type then
        if monster_card_properties.monster_type ~= properties.monster_type then
            return false
        end
    end
    if properties.exclude_monster_types then
        for _, monster_type in ipairs(properties.exclude_monster_types) do
            if monster_card_properties.monster_type == monster_type then
                return false
            end
        end
    end
    if properties.monster_attribute then
        if monster_card_properties.attribute ~= properties.monster_attribute then
            return false
        end
    end
    if properties.exclude_monster_attributes then
        for _, monster_attribute in ipairs(properties.exclude_monster_attributes) do
            if monster_card_properties.attribute == monster_attribute then
                return false
            end
        end
    end
    if properties.monster_archetypes then
        for _, monster_archetype in ipairs(properties.monster_archetypes) do
            if not monster_card_properties.monster_archetypes[monster_archetype] then
                return false
            end
        end
    end
    if properties.exclude_monster_archetypes then
        for _, monster_archetype in ipairs(properties.exclude_monster_archetypes) do
            if monster_card_properties.monster_archetypes[monster_archetype] then
                return false
            end
        end
    end
    if properties.is_pendulum then
        if not monster_card_properties.is_pendulum then
            return false
        end
    end
    if properties.exclude_pendulum then
        if monster_card_properties.is_pendulum then
            return false
        end
    end
    if properties.is_extra_deck or properties.exclude_main_deck then
        if monster_card_properties.is_main_deck then
            return false
        end
    end
    if properties.exclude_extra_deck or properties.is_main_deck then
        if not monster_card_properties.is_main_deck then
            return false
        end
    end
    if properties.summon_type then
        if monster_card_properties.summon_type ~= properties.summon_type then
            return false
        end
    end
    if properties.exclude_summon_types then
        for _, summon_type in ipairs(properties.exclude_summon_types) do
            if monster_card_properties.summon_type == summon_type then
                return false
            end
        end
    end
    if properties.is_effect then
        if not monster_card_properties.is_effect then
            return false
        end
    end
    if properties.is_non_effect then
        if monster_card_properties.is_effect then
            return false
        end
    end
    if properties.is_normal then
        if monster_card_properties.is_effect or not monster_card_properties.is_main_deck then
            return false
        end
    end
    if properties.is_tuner then
        if not monster_card_properties.is_tuner then
            return false
        end
    end
    if properties.exclude_tuners then
        if monster_card_properties.is_tuner then
            return false
        end
    end
    return true
end

-- Summon and material calculations

local function get_combinations(list)
    local result = {}

    local function generate_combination(start, current_combo)
        if #current_combo > 5 then return end
        table.insert(result, { unpack(current_combo) })

        for i = start, #list do
            table.insert(current_combo, list[i])
            generate_combination(i + 1, current_combo)
            table.remove(current_combo)
        end
    end

    generate_combination(1, {})

    return result
end

local function get_condition_min_max(condition)
    local min_materials = 0
    local max_materials = 0
    if condition and condition.materials then
        for _, property in ipairs(condition.materials) do
            if property.min then
                min_materials = min_materials + (property.optional and 0 or property.min)
                max_materials = max_materials + (property.max or 10)
            else
                min_materials = min_materials + (property.optional and 0 or 1)
                max_materials = max_materials + 1
            end
        end
    end
    return min_materials, max_materials
end

JoyousSpring.is_valid_material_combo = function(combo_list, condition)
    local all_materials_count = 0
    local restrictions = condition.restrictions
    local summon_type = condition.type

    local min_materials, max_materials = get_condition_min_max(condition)

    if (min_materials == 0) or (#combo_list < min_materials) or (#combo_list > max_materials) then
        return false
    end

    for _, card in ipairs(combo_list) do
        if summon_type and JoyousSpring.is_all_materials(card, summon_type) then
            all_materials_count = all_materials_count + 1
        end
        if all_materials_count > 1 then
            return false
        end
    end

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
            if restrictions.different_names and card_1.config.center.key == card_2.config.center.key then
                return false
            end
            if restrictions.same_name and card_1.config.center.key ~= card_2.config.center.key then
                return false
            end
            if restrictions.different_rarities and card_1.config.center.rarity == card_2.config.center.rarity then
                return false
            end
            if restrictions.same_rarity and card_1.config.center.rarity ~= card_2.config.center.rarity then
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

local function separate_properties(condition)
    local mandatory = {}
    local optional = {}

    for i, property in ipairs(condition.materials) do
        if property.optional then
            local amount = property.max or 1
            for i = 1, amount do
                table.insert(optional, property)
            end
        elseif property.min then
            local amount = (property.max and
                    property.max - property.min) or
                (10 - property.min)
            for i = 1, property.min do
                table.insert(mandatory, property)
            end
            for i = 1, amount do
                table.insert(optional, property)
            end
        else
            table.insert(mandatory, property)
        end
    end

    return mandatory, optional
end

JoyousSpring.fulfills_conditions = function(combo_list, condition)
    if not JoyousSpring.is_valid_material_combo(combo_list, condition) then
        return false
    end

    local mandatory_properties, optional_properties = separate_properties(condition)

    local visited = {}

    for i = 1, #combo_list do
        visited[i] = false
    end

    local function check_properties(combo, properties, index, visited_check)
        if index > #properties then
            return true
        end

        for i = 1, #combo do
            if not visited_check[i] and JoyousSpring.is_material(combo[i], properties[index], condition.type) then
                visited_check[i] = true
                if check_properties(combo, properties, index + 1, visited_check) then
                    return true
                end
                visited_check[i] = false
            end
        end

        return false
    end

    if not check_properties(combo_list, mandatory_properties, 1, visited) then
        return false
    end

    local remaining_cards = {}
    local visited_optional = {}

    for i = 1, #combo_list do
        if not visited[i] then
            table.insert(remaining_cards, combo_list[i])
        end
    end

    for i = 1, #remaining_cards do
        visited_optional[i] = false
    end

    local function check_optional_properties(combo, optional_props, index, visited_check)
        if index > #combo then
            return true
        end

        for i = 1, #optional_props do
            if not visited_check[i] and JoyousSpring.is_material(combo[index], optional_props[i], condition.type) then
                visited_check[i] = true
                if check_optional_properties(combo, optional_props, index + 1, visited_check) then
                    return true
                end
                visited_check[i] = false
            end
        end

        return false
    end

    return check_optional_properties(remaining_cards, optional_properties, 1, visited_optional)
end

JoyousSpring.get_summon_material_combo_by_condition = function(condition, card_list)
    local card_list = card_list or G.jokers.cards
    local material_combos = {}

    local current_combos = get_combinations(card_list)

    for _, combination in ipairs(current_combos) do
        if JoyousSpring.fulfills_conditions(combination, condition) then
            table.insert(material_combos, combination)
        end
    end

    return material_combos
end

JoyousSpring.get_all_summon_material_combos = function(card, card_list)
    if not JoyousSpring.is_monster_card(card) or 
    (not card.ability.extra.joyous_spring.summon_conditions and not card.ability.extra.joyous_spring.summon_consumeable_conditions) then
        return nil
    end

    local material_combos = {}
    if card.ability.extra.joyous_spring.summon_consumeable_conditions then
        local card_table = card_list or G.consumeables.cards
        table.insert(material_combos, JoyousSpring.get_summon_materials_consumables(card.ability.extra.joyous_spring.summon_consumeable_conditions, card_table))
    else
        local card_table = card_list or G.jokers.cards
        local conditions = card.ability.extra.joyous_spring.summon_conditions

        for _, condition in ipairs(conditions) do
            local combos_by_condition = JoyousSpring.get_summon_material_combo_by_condition(condition, card_table)
            for _, combo in ipairs(combos_by_condition) do
                table.insert(material_combos, combo)
            end
        end
    end

    return material_combos
end

JoyousSpring.can_summon_by_condition = function(condition, card_list)
    local card_list = card_list or G.jokers.cards

    local current_combos = get_combinations(card_list)

    for _, combination in ipairs(current_combos) do
        if JoyousSpring.fulfills_conditions(combination, condition) then
            return true
        end
    end

    return false
end

JoyousSpring.can_summon = function(card, card_list)
    if not JoyousSpring.is_monster_card(card) then
        return false
    end
    if not card.ability.extra.joyous_spring.summon_conditions and not card.ability.extra.joyous_spring.summon_consumeable_conditions then
        return true
    end

    if card.ability.extra.joyous_spring.summon_consumeable_conditions then
        local card_table = card_list or G.consumeables.cards
        return JoyousSpring.can_summon_consumeables(card.ability.extra.joyous_spring.summon_consumeable_conditions, card_table)
    else
        local card_table = card_list or G.jokers.cards
        local conditions = card.ability.extra.joyous_spring.summon_conditions

        for _, condition in ipairs(conditions) do
            if JoyousSpring.can_summon_by_condition(condition, card_table) then
                return true
            end
        end
    end

    return false
end

JoyousSpring.can_summon_with_combo = function(card, combo)
    if not JoyousSpring.is_monster_card(card) or not combo or #combo == 0 or 
    (not card.ability.extra.joyous_spring.summon_conditions and not card.ability.extra.joyous_spring.summon_consumeable_conditions) then
        return false
    end

    if card.ability.extra.joyous_spring.summon_consumeable_conditions then
        return JoyousSpring.fulfills_condition_consumeables(card.ability.extra.joyous_spring.summon_consumeable_conditions, combo)
    else
        local conditions = card.ability.extra.joyous_spring.summon_conditions

        for _, condition in ipairs(conditions) do
            if JoyousSpring.fulfills_conditions(combo, condition) then
                return true
            end
        end
    end

    return false
end

local function get_consumeable_counts(combo)
    local counts = {
        any = #combo,
        tarot = 0,
        planet = 0,
        spectral = 0,
        other = 0
    }

    for _, card in ipairs(combo) do
        if card.ability.set == 'Tarot' then
            counts.tarot = counts.tarot + 1
        elseif card.ability.set == 'Planet' then
            counts.planet = counts.planet + 1
        elseif card.ability.set == 'Spectral' then
            counts.spectral = counts.spectral + 1
        else
            counts.other = counts.other + 1
        end
    end

    return counts
end

local function get_consumeables(combo, args)
    local materials = {}

    for _, card in ipairs(combo) do
        if args.any or (args.tarot and card.ability.set == 'Tarot') or 
        (args.planet and card.ability.set == 'Planet') or (args.spectral and card.ability.set == 'Spectral') then
            table.insert(materials, card)
        end
    end

    return materials
end

JoyousSpring.get_summon_materials_consumables = function (condition, card_table)
    local card_table = card_table or G.consumeables.cards
    local any_min = condition.any and (type(condition.any) == "table" and condition.any.min or condition.any) or 0
    local tarot_min = condition.tarot and (type(condition.tarot) == "table" and condition.tarot.min or condition.tarot) or 0
    local planet_min = condition.planet and (type(condition.planet) == "table" and condition.planet.min or condition.planet) or 0
    local spectral_min = condition.spectral and (type(condition.spectral) == "table" and condition.spectral.min or condition.spectral) or 0

    return get_consumeables(card_table, {
        any = (any_min > 0) or nil,
        tarot = (tarot_min > 0) or nil,
        planet = (planet_min > 0) or nil,
        spectral = (spectral_min > 0) or nil,
    })
end

JoyousSpring.can_summon_consumeables = function (condition, combo)
    local any_min = condition.any and (type(condition.any) == "table" and condition.any.min or condition.any) or 0
    local tarot_min = condition.tarot and (type(condition.tarot) == "table" and condition.tarot.min or condition.tarot) or 0
    local planet_min = condition.planet and (type(condition.planet) == "table" and condition.planet.min or condition.planet) or 0
    local spectral_min = condition.spectral and (type(condition.spectral) == "table" and condition.spectral.min or condition.spectral) or 0

    local counts = get_consumeable_counts(combo)

    if counts.any < any_min or counts.tarot < tarot_min or counts.planet < planet_min or counts.spectral < spectral_min then
        return false
    end
    return true
end

JoyousSpring.fulfills_condition_consumeables = function (condition, combo)
    local any_min = condition.any and (type(condition.any) == "table" and condition.any.min or condition.any) or nil
    local any_max = condition.any and (type(condition.any) == "table" and condition.any.max or condition.any) or nil
    local tarot_min = condition.tarot and (type(condition.tarot) == "table" and condition.tarot.min or condition.tarot) or nil
    local tarot_max = condition.tarot and (type(condition.tarot) == "table" and condition.tarot.max or condition.tarot) or nil
    local planet_min = condition.planet and (type(condition.planet) == "table" and condition.planet.min or condition.planet) or nil
    local planet_max = condition.planet and (type(condition.planet) == "table" and condition.planet.max or condition.planet) or nil
    local spectral_min = condition.spectral and (type(condition.spectral) == "table" and condition.spectral.min or condition.spectral) or nil
    local spectral_max = condition.spectral and (type(condition.spectral) == "table" and condition.spectral.max or condition.spectral) or nil

    local counts = get_consumeable_counts(combo)

    if (any_min and (counts.any < any_min)) or
    (any_max and (counts.any > any_max)) or
    (tarot_min and (counts.tarot < tarot_min)) or
    (tarot_max and (counts.tarot > tarot_max)) or
    (planet_min and (counts.planet < planet_min)) or
    (planet_max and (counts.planet > planet_max)) or
    (spectral_min and (counts.spectral < spectral_min)) or
    (spectral_max and (counts.spectral > spectral_max)) then
        return false
    end

    return true
end

local function summon_from_booster(card)
    local prev_state = G.STATE
    local delay_fac = 1

    G.TAROT_INTERRUPT = G.STATE
    G.STATE = (G.STATE == G.STATES.TAROT_PACK and G.STATES.TAROT_PACK) or
        (G.STATE == G.STATES.PLANET_PACK and G.STATES.PLANET_PACK) or
        (G.STATE == G.STATES.SPECTRAL_PACK and G.STATES.SPECTRAL_PACK) or
        (G.STATE == G.STATES.STANDARD_PACK and G.STATES.STANDARD_PACK) or
        (G.STATE == G.STATES.SMODS_BOOSTER_OPENED and G.STATES.SMODS_BOOSTER_OPENED) or
        (G.STATE == G.STATES.BUFFOON_PACK and G.STATES.BUFFOON_PACK) or
        G.STATES.PLAY_TAROT

    G.CONTROLLER.locks.use = true
    if G.booster_pack and not G.booster_pack.alignment.offset.py and (card.ability.consumeable or not (G.GAME.pack_choices and G.GAME.pack_choices > 1)) then
        G.booster_pack.alignment.offset.py = G.booster_pack.alignment.offset.y
        G.booster_pack.alignment.offset.y = G.ROOM.T.y + 29
    end
    if G.shop and not G.shop.alignment.offset.py then
        G.shop.alignment.offset.py = G.shop.alignment.offset.y
        G.shop.alignment.offset.y = G.ROOM.T.y + 29
    end
    if G.blind_select and not G.blind_select.alignment.offset.py then
        G.blind_select.alignment.offset.py = G.blind_select.alignment.offset.y
        G.blind_select.alignment.offset.y = G.ROOM.T.y + 39
    end
    if G.round_eval and not G.round_eval.alignment.offset.py then
        G.round_eval.alignment.offset.py = G.round_eval.alignment.offset.y
        G.round_eval.alignment.offset.y = G.ROOM.T.y + 29
    end

    if card.children.use_button then
        card.children.use_button:remove(); card.children.use_button = nil
    end
    if card.children.sell_button then
        card.children.sell_button:remove(); card.children.sell_button = nil
    end
    if card.children.price then
        card.children.price:remove(); card.children.price = nil
    end

    if not card.from_area then card.from_area = card.area end
    if card.area and (not nc or card.area == G.pack_cards) then card.area:remove_card(card) end

    card:add_to_deck()
    G.jokers:emplace(card)
    play_sound('card1', 0.8, 0.6)
    play_sound('generic1')
    delay_fac = 0.2

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    G.STATE = prev_state
                    G.TAROT_INTERRUPT = nil
                    G.CONTROLLER.locks.use = false

                    if (prev_state == G.STATES.TAROT_PACK or prev_state == G.STATES.PLANET_PACK or
                            prev_state == G.STATES.SPECTRAL_PACK or prev_state == G.STATES.STANDARD_PACK or
                            prev_state == G.STATES.SMODS_BOOSTER_OPENED or
                            prev_state == G.STATES.BUFFOON_PACK) and G.booster_pack then
                        if G.GAME.pack_choices and G.GAME.pack_choices > 1 then
                            if G.booster_pack.alignment.offset.py then
                                G.booster_pack.alignment.offset.y = G.booster_pack.alignment.offset.py
                                G.booster_pack.alignment.offset.py = nil
                            end
                            G.GAME.pack_choices = G.GAME.pack_choices - 1
                        else
                            G.CONTROLLER.interrupt.focus = true
                            G.FUNCS.end_consumeable(nil, delay_fac)
                        end
                    end
                    return true
                end
            }))
            return true
        end
    }))
end

local function summon_from_shop(card)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function()
            card.area:remove_card(card)
            card:add_to_deck()
            if card.children.price then card.children.price:remove() end
            card.children.price = nil
            if card.children.buy_button then card.children.buy_button:remove() end
            card.children.buy_button = nil
            remove_nils(card.children)
            G.jokers:emplace(card)
            G.GAME.round_scores.cards_purchased.amt = G.GAME.round_scores.cards_purchased.amt + 1
            G.GAME.current_round.jokers_purchased = G.GAME.current_round.jokers_purchased + 1

            for i = 1, #G.jokers.cards do
                G.jokers.cards[i]:calculate_joker({ buying_card = true, card = card })
            end

            play_sound('card1')
            G.CONTROLLER:save_cardarea_focus('jokers')
            G.CONTROLLER:recall_cardarea_focus('jokers')
            return true
        end
    }))
end

JoyousSpring.perform_summon = function(card, card_list, summon_type)
    SMODS.calculate_context({
        joy_summon = true,
        joy_card = card,
        joy_summon_materials = card_list,
        joy_summon_type =
            summon_type
    })
    card.ability.extra.joyous_spring.summon_materials = {}
    card.ability.extra.joyous_spring.xyz_materials = 0
    for _, joker in ipairs(card_list) do
        table.insert(card.ability.extra.joyous_spring.summon_materials, joker.config.center.key)

        joker:start_dissolve()
    end
    card.ability.extra.joyous_spring.xyz_materials = #card.ability.extra.joyous_spring.summon_materials
    if card.area == JoyousSpring.extra_deck_area then
        JoyousSpring.extra_deck_area:remove_card(card)
        card:add_to_deck()
        G.jokers:emplace(card)
    elseif card.area == G.pack_cards then
        summon_from_booster(card)
    else
        summon_from_shop(card)
    end
    card.ability.extra.joyous_spring.summoned = true
    card:set_cost()

    if summon_type == "XYZ" then
        card.children.xyz_materials = JoyousSpring.create_UIBox_xyz_materials(card)
    end
end

JoyousSpring.summon_token = function(key, atlas_key, sprite_pos, joyous_spring_table)
    local card = SMODS.add_card({
        key = "j_joy_token"
    })
    local pool_info = JoyousSpring.token_pool[key] or {}
    local og_table = card.ability.extra.joyous_spring
    og_table.token_name = joyous_spring_table and joyous_spring_table.token_name or pool_info.name or og_table
        .token_name or "Token"
    og_table.is_tuner = joyous_spring_table and joyous_spring_table.is_tuner or pool_info.is_tuner or og_table.is_tuner or
        false
    og_table.attribute = joyous_spring_table and joyous_spring_table.attribute or pool_info.attribute or
        og_table.attribute or "EARTH"
    og_table.monster_type = joyous_spring_table and joyous_spring_table.monster_type or pool_info.monster_type or
        og_table.monster_type or "Beast"
    og_table.monster_archetypes = joyous_spring_table and joyous_spring_table.monster_archetypes or
        pool_info.monster_archetypes or og_table.monster_archetypes or {}
    og_table.token_atlas = atlas_key or pool_info.atlas or "joy_Token"
    og_table.token_sprite_pos = sprite_pos or pool_info.sprite_pos or
        { x = pseudorandom("Token", 0, 1), y = pseudorandom("Token", 0, 1) }
    card.children.center.atlas.name = og_table.token_atlas
    card.children.center.sprite_pos = og_table.token_sprite_pos
    card.children.center:reset()
end


-- Revive

JoyousSpring.revive = function(key, must_have_room, edition)
    if JoyousSpring.graveyard[key] and JoyousSpring.graveyard[key].summonable > 0 and
        (not must_have_room or (#G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit)) then
        JoyousSpring.graveyard[key].count = JoyousSpring.graveyard[key].count - 1
        JoyousSpring.graveyard[key].summonable = JoyousSpring.graveyard[key].summonable - 1
        local added_card = SMODS.add_card({
            key = key,
            edition = edition
        })
        added_card.ability.extra.joyous_spring.summoned = JoyousSpring.is_extra_deck_monster(added_card) or nil
        added_card.ability.extra.joyous_spring.revived = true
        added_card:set_cost()
        SMODS.calculate_context({ joy_revived = true, joy_revived_card = added_card })
        return added_card
    end
    return nil
end

JoyousSpring.revive_pseudorandom = function(property_list, seed, must_have_room, edition)
    if not must_have_room or (#G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit) then
        local choices = JoyousSpring.get_materials_in_graveyard(property_list, true)
        local key_to_add = pseudorandom_element(choices, seed)
        if key_to_add then
            return JoyousSpring.revive(key_to_add, must_have_room, edition)
        end
    end
end

-- Banish

JoyousSpring.banish = function(card, banish_until, func, immediate)
    if not card or not card.area then return end
    card:juice_up()
    if immediate then
        local time_to_banish = banish_until == "blind_selected" and JoyousSpring.banish_blind_selected_area or
            banish_until == "boss_selected" and JoyousSpring.banish_boss_selected_area or
            banish_until == "end_of_ante" and JoyousSpring.banish_end_of_ante_area or
            JoyousSpring.banish_end_of_round_area
        local area = card.area
        card.area:remove_card(card)
        time_to_banish:emplace(card)
        G.GAME.joy_cards_banished = G.GAME.joy_cards_banished and
            (G.GAME.joy_cards_banished + 1) or 1
        if func then
            func(card)
        end
        SMODS.calculate_context({
            joy_banished = true,
            joy_banished_card = card,
            joy_banished_area = area,
            joy_banish_until =
                banish_until
        })
    else
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.3,
            func = function()
                local time_to_banish = banish_until == "blind_selected" and JoyousSpring.banish_blind_selected_area or
                    banish_until == "boss_selected" and JoyousSpring.banish_boss_selected_area or
                    banish_until == "end_of_ante" and JoyousSpring.banish_end_of_ante_area or
                    JoyousSpring.banish_end_of_round_area
                local area = card.area
                card.area:remove_card(card)
                time_to_banish:emplace(card)
                G.GAME.joy_cards_banished = G.GAME.joy_cards_banished and
                    (G.GAME.joy_cards_banished + 1) or 1
                if func then
                    func(card)
                end
                SMODS.calculate_context({
                    joy_banished = true,
                    joy_banished_card = card,
                    joy_banished_area = area,
                    joy_banish_until =
                        banish_until
                })
                return true
            end,
        }))
    end
end

JoyousSpring.return_from_banish = function(card)
    local area = card.area
    area:remove_card(card)
    if card.ability.set == 'Joker' then
        G.jokers:emplace(card)
    else
        G.consumeables:emplace(card)
    end

    SMODS.calculate_context({ joy_returned = true, joy_returned_card = card, joy_returned_area = area })
end

-- Modifiers

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

JoyousSpring.debuff_hand = function(cards, hand, handname)
    for _, joker in ipairs(G.jokers.cards) do
        if joker.config.center.joy_debuff_hand and joker.config.center.joy_debuff_hand(joker, cards, hand, handname) then
            return true
        end
    end
    return false
end

-- UI

JoyousSpring.create_UIBox_xyz_materials = function(card)
    return UIBox {
        definition = {
            n = G.UIT.ROOT,
            config = {
                minh = 0.6,
                maxh = 1.2,
                minw = 0.6,
                maxw = 2,
                r = 0.001,
                padding = 0.1,
                align = 'cm',
                colour = adjust_alpha(darken(G.C.BLACK, 0.2), 0.8),
                shadow = false,
                ref_table = card
            },
            nodes = {
                {
                    n = G.UIT.R, -- node type
                    config = {
                        align = 'cm',
                        colour = G.C.CLEAR
                    },
                    nodes = {
                        {
                            n = G.UIT.T, -- node type
                            config = {
                                text = 'X',
                                scale = 0.45,
                                colour = G.C.JOY.TRAP
                            },
                        },
                        {
                            n = G.UIT.T, -- node type
                            config = {
                                ref_table = card.ability.extra.joyous_spring,
                                ref_value = "xyz_materials",
                                scale = 0.45,
                                colour = G.C.UI.TEXT_LIGHT
                            }
                        }
                    }
                },
            }
        },
        config = {
            align = "tri",
            bond = 'Strong',
            parent = card,
        },
        states = {
            collide = { can = false },
            drag = { can = true }
        }
    }
end

-- Hooks

local card_flip_ref = Card.flip
function Card:flip()
    if not JoyousSpring.is_summon_type(self, "Link") and self.config.center_key ~= "j_joy_token" then
        card_flip_ref(self)
    end
end
