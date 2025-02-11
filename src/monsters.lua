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
    if card.ability.eternal then
        return false
    end
    if not next(properties) == 0 then
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
    return true
end

-- Summon and material calculations

JoyousSpring.filter_materials_on_properties = function(properties, card_list, summon_type)
    local card_table = card_list or G.jokers.cards
    local filtered_table = {}

    for _, card in ipairs(card_table) do
        if JoyousSpring.is_material(card, properties, summon_type) then
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
        local filtered_by_property = JoyousSpring.filter_materials_on_properties(properties, card_table, condition.type)

        if #filtered_by_property == 0 and not properties.optional then return {} end
        table.insert(filtered_table, filtered_by_property)
    end

    return filtered_table
end

JoyousSpring.is_valid_material_combo = function(combo_list, restrictions, summon_type)
    local all_materials_count = 0
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
            if JoyousSpring.is_valid_material_combo(combo, condition.restrictions, condition.type) then
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

JoyousSpring.perform_summon = function(card, card_list, summon_type)
    card.ability.extra.joyous_spring.summon_materials = {}
    card.ability.extra.joyous_spring.xyz_materials = 0
    for _, joker in ipairs(card_list) do
        table.insert(card.ability.extra.joyous_spring.summon_materials, joker.config.center.key)
        card.ability.extra.joyous_spring.xyz_materials = #card.ability.extra.joyous_spring.summon_materials

        joker:start_dissolve()
    end
    JoyousSpring.extra_deck_area:remove_card(card)
    card:add_to_deck()
    card.ability.extra.joyous_spring.summoned = true
    card:set_cost()
    G.jokers:emplace(card)

    if summon_type == "XYZ" then
        card.children.xyz_materials = JoyousSpring.create_UIBox_xyz_materials(card)
    end
end

-- Revive

JoyousSpring.revive = function(key, must_have_room)
    if JoyousSpring.graveyard[key] and JoyousSpring.graveyard[key] > 0 and
        (not must_have_room or (#G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit)) then
        JoyousSpring.graveyard[key] = JoyousSpring.graveyard[key] - 1
        local added_card = SMODS.add_card({
            key = key
        })
        added_card.ability.extra.joyous_spring.revived = true
        added_card:set_cost()
        SMODS.calculate_context({ joy_revived = true, joy_revived_card = added_card })
        return added_card
    end
end

JoyousSpring.revive_pseudorandom = function(property_list, seed, must_have_room)
    if not must_have_room or (#G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit) then
        local choices = JoyousSpring.get_materials_in_graveyard(property_list, true)
        local key_to_add = pseudorandom_element(choices, seed)
        if key_to_add then
            return JoyousSpring.revive(key_to_add, must_have_room)
        end
    end
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

-- UI

JoyousSpring.create_UIBox_xyz_materials = function (card)
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
