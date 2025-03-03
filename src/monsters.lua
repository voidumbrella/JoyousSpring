--- MONSTERS

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

JoyousSpring.has_activated_effect = function(card)
    return JoyousSpring.is_monster_card(card) and card.config.center.joy_can_activate and true or false
end

JoyousSpring.can_activate = function(card)
    return JoyousSpring.has_activated_effect(card) and card.config.center.joy_can_activate(card) or false
end

---Checks if **card** fulfills **properties**
---@param card Card
---@param properties table
---@param summon_type string? Optional to check if the card is a wildcard for that type of summon
---@return boolean
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
        return not (properties.is_monster or properties.monster_type or properties.monster_attribute or properties.monster_archetypes or properties.is_pendulum or properties.summon_type or properties.is_effect or properties.is_non_effect or properties.is_normal or properties.is_extra_deck or properties.is_main_deck or properties.is_summoned or properties.is_tuner) or
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

---Checks if the center for **card_key** fulfills **properties**
---@param card_key string
---@param properties table
---@return boolean
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

-- Hooks

local card_flip_ref = Card.flip
function Card:flip()
    if not JoyousSpring.is_summon_type(self, "LINK") and self.config.center_key ~= "j_joy_token" then
        card_flip_ref(self)
    end
end
