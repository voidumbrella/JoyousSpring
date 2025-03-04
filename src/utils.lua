JoyousSpring.get_graveyard_count = function()
    if not JoyousSpring.graveyard then return 0 end

    local total = 0
    for _, t in pairs(JoyousSpring.graveyard) do
        total = total + t.count
    end
    return total
end

---Get all materials in G.jokers that fulfill **property_list**
---@param property_list material_properties[]
---@param different_names boolean?
---@return Card[]
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

---Count all materials in G.jokers that fulfill **property_list**
---@param property_list material_properties[]
---@param different_names boolean?
---@return integer
JoyousSpring.count_materials_owned = function(property_list, different_names)
    return #JoyousSpring.get_materials_owned(property_list, different_names)
end

---Get all materials in graveyard that fulfill **property_list**
---@param property_list material_properties[]
---@param to_revive boolean? Checks if it can be revived
---@param different_names boolean?
---@return string[]
JoyousSpring.get_materials_in_graveyard = function(property_list, to_revive, different_names)
    if not JoyousSpring.graveyard then return {} end

    local materials = {}
    for key, t in pairs(JoyousSpring.graveyard) do
        local count = t.count
        local summonable = t.summonable
        if count > 0 then
            if not (to_revive and (G.P_CENTERS[key].config.extra.joyous_spring.cannot_revive or summonable < 1)) then
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
    end
    return materials
end

---Count all materials in graveyard that fulfill **property_list**
---@param property_list material_properties[]
---@param to_revive boolean? Checks if it can be revived
---@param different_names boolean?
---@return integer
JoyousSpring.count_materials_in_graveyard = function(property_list, to_revive, different_names)
    return #JoyousSpring.get_materials_in_graveyard(property_list, to_revive, different_names)
end

---Get the keys to all matrerials in G.jokers and graveyard that fulfill **property_list**
---@param property_list material_properties[]
---@param to_revive boolean? Checks if it can be revived
---@param different_names boolean?
---@return string[]
JoyousSpring.get_all_material_keys = function(property_list, to_revive, different_names)
    local gy = JoyousSpring.get_materials_in_graveyard(property_list, to_revive, different_names)
    local owned = JoyousSpring.get_materials_owned(property_list, different_names)
    for _, card in ipairs(owned) do
        gy[#gy + 1] = card.config.center_key or nil
    end
    return gy
end

---Count all materials in G.jokers and graveyard that fulfill **property_list**
---@param property_list material_properties[]
---@param to_revive boolean? Checks if it can be revived
---@param different_names boolean?
---@return integer
JoyousSpring.count_all_materials = function(property_list, to_revive, different_names)
    return JoyousSpring.count_materials_in_graveyard(property_list, to_revive, different_names) +
        JoyousSpring.count_materials_owned(property_list, different_names)
end

JoyousSpring.get_materials_in_collection = function(property_list)
    local pool = {}
    for k, _ in pairs(G.P_CENTERS) do
        if k:sub(1, 2) == "j_" then
            for _, property in ipairs(property_list) do
                if JoyousSpring.is_material_center(k, property) then
                    table.insert(pool, k)
                end
            end
        end
    end
    return pool
end

---Count all Extra Deck types (Fusion, Synchro, Xyz, Link) are owned
---@return integer
JoyousSpring.extra_deck_types_owned = function()
    local fusion = (JoyousSpring.count_materials_owned({ { summon_type = "FUSION" } }) > 0) and 1 or 0
    local synchro = (JoyousSpring.count_materials_owned({ { summon_type = "SYNCHRO" } }) > 0) and 1 or 0
    local xyz = (JoyousSpring.count_materials_owned({ { summon_type = "XYZ" } }) > 0) and 1 or 0
    local link = (JoyousSpring.count_materials_owned({ { summon_type = "LINK" } }) > 0) and 1 or 0

    return fusion + synchro + xyz + link
end

---Get index of value in array
---@param array table
---@param value any
---@return integer?
JoyousSpring.index_of = function(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end

---Gets column (index) of joker in G.jokers
---@param joker Card
---@return integer?
JoyousSpring.get_joker_column = function(joker)
    return G.jokers and JoyousSpring.index_of(G.jokers.cards or {}, joker) or 0
end

---Get not owned card in **keys** list
---@param keys string[]
---@param count_debuffed boolean?
---@return table
JoyousSpring.get_not_owned = function(keys, count_debuffed)
    local not_owned = {}
    for _, key in ipairs(keys) do
        if not next(SMODS.find_card(key, count_debuffed)) then
            table.insert(not_owned, key)
        end
    end
    return not_owned
end

JoyousSpring.empty_graveyard = function()
    for _, t in pairs(JoyousSpring.graveyard) do
        t.count = 0
        t.summonable = 0
    end
end

--- Talisman compat
to_big = to_big or function(num)
    return num
end
