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

JoyousSpring.get_graveyard_count = function()
    if not JoyousSpring.graveyard then return 0 end

    local total = 0
    for _, t in pairs(JoyousSpring.graveyard) do
        total = total + t.count
    end
    return total
end

---Get all matrerials in G.jokers that fulfill **property_list**
---@param property_list table
---@param different_names boolean?
---@return table
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

---Count all matrerials in G.jokers that fulfill **property_list**
---@param property_list table
---@param different_names boolean?
---@return integer
JoyousSpring.count_materials_owned = function(property_list, different_names)
    return #JoyousSpring.get_materials_owned(property_list, different_names)
end

---Get all matrerials in graveyard that fulfill **property_list**
---@param property_list table
---@param to_revive boolean? Checks if it can be revived
---@param different_names boolean?
---@return table
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

---Count all matrerials in graveyard that fulfill **property_list**
---@param property_list table
---@param to_revive boolean? Checks if it can be revived
---@param different_names boolean?
---@return integer
JoyousSpring.count_materials_in_graveyard = function(property_list, to_revive, different_names)
    return #JoyousSpring.get_materials_in_graveyard(property_list, to_revive, different_names)
end

---Get the keys to all matrerials in G.jokers and graveyard that fulfill **property_list**
---@param property_list table
---@param to_revive boolean? Checks if it can be revived
---@param different_names boolean?
---@return table
JoyousSpring.get_all_material_keys = function(property_list, to_revive, different_names)
    local gy = JoyousSpring.get_materials_in_graveyard(property_list, to_revive, different_names)
    local owned = JoyousSpring.get_materials_owned(property_list, different_names)
    for _, card in ipairs(owned) do
        gy[#gy + 1] = card.config.center_key or nil
    end
    return gy
end

---Count all matrerials in G.jokers and graveyard that fulfill **property_list**
---@param property_list table
---@param to_revive boolean? Checks if it can be revived
---@param different_names boolean?
---@return integer
JoyousSpring.count_all_materials = function(property_list, to_revive, different_names)
    return JoyousSpring.count_materials_in_graveyard(property_list, to_revive, different_names) +
        JoyousSpring.count_materials_owned(property_list, different_names)
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
            local enhanced = enhanced_prob >= 1 and (pseudorandom(seed or pseudoseed('JoyousSpring')) < 1 / enhanced_prob and true) or false
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

---Get not owned card in **keys** list
---@param keys string[]
---@param count_debuffed boolean?
---@return table
JoyousSpring.get_not_owned = function (keys, count_debuffed)
    local not_owned = {}
    for _, key in ipairs(keys) do
        if not next(SMODS.find_card(key, count_debuffed)) then
            table.insert(not_owned, key)
        end
    end
    return not_owned
end

JoyousSpring.empty_graveyard = function ()
    for _, t in pairs(JoyousSpring.graveyard) do
        t.count = 0
        t.summonable = 0
    end
end

--- Talisman compat
to_big = to_big or function(num)
    return num
end

if JoyousSpring.debug then
    --- Makes shop rerolls free
    function calculate_reroll_cost(skip_increment)
        G.GAME.current_round.reroll_cost = 0
    end

    G.FUNCS.joy_debug_print = function(e)
        sendDebugMessage("test")
    end
end
