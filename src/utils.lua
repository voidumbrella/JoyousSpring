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

---Empties the graveyard
JoyousSpring.empty_graveyard = function()
    for _, t in pairs(JoyousSpring.graveyard) do
        t.count = 0
        t.summonable = 0
    end
end

---Adds a tag that creates a joker with *card_key* to the shop
---@param card_key string
JoyousSpring.add_monster_tag = function(card_key)
    local tag = Tag('tag_joy_monster')
    tag.ability.monster = card_key
    G.GAME.joy_last_monster_tag = card_key
    add_tag(tag)
end

---Flips a random card in *card_list*
---@param card_list table|Card[]
---@param facing? 'front'|'back' If card has to be facing a direction for it to be flipped
---@param seed? string
---@return table|Card|nil
JoyousSpring.flip_random_card = function(source_card, card_list, facing, seed)
    local facing_cards = {}
    for j, card in ipairs(card_list) do
        if not facing or card.facing == facing then
            facing_cards[#facing_cards + 1] = card
        end
    end
    local pick = pseudorandom_element(facing_cards, pseudoseed(seed or "JoyousSpring"))
    if pick then
        pick:flip(source_card)
    end
    return pick
end

---Add random tag. Stolen from Cryptid
JoyousSpring.add_random_tag = function()
    local tag_key = get_next_tag_key("JoyousSpring")
    if tag_key == "tag_boss" then
        i = i - 1 --skip these, as they can cause bugs with pack opening from other tags
    else
        local tag = Tag(tag_key)
        if tag.name == "Orbital Tag" then
            local _poker_hands = {}
            for k, v in pairs(G.GAME.hands) do
                if v.visible then
                    _poker_hands[#_poker_hands + 1] = k
                end
            end
            tag.ability.orbital_hand = pseudorandom_element(_poker_hands, pseudoseed("cry_pickle_orbital"))
        end
        add_tag(tag)
    end
end

---Checks if a card is a playing card
---@param card table|Card
---@return boolean
JoyousSpring.is_playing_card = function(card)
    return card and (card.ability.set == 'Enhanced' or card.ability.set == 'Default') and true or false
end

--- Talisman compat
to_big = to_big or function(num)
    return num
end
