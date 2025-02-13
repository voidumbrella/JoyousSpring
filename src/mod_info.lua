--- MOD CONFIG
SMODS.current_mod.description_loc_vars = function()
    return { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.2 }
end

SMODS.current_mod.custom_ui = function(modNodes)
    G.joy_desc_area = CardArea(
        G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
        4.25 * G.CARD_W,
        0.95 * G.CARD_H,
        { card_limit = 5, type = 'title', highlight_limit = 0, collection = true }
    )
    G.joy_desc_area.joy_demo_area = true
    for i, key in ipairs({ "j_joy_yokai_ogre", "j_joy_yokai_reaper", "j_joy_yokai_belle", "j_joy_yokai_sister", "j_joy_yokai_mourner", "j_joy_yokai_ash" }) do
        local card = Card(G.joy_desc_area.T.x + G.joy_desc_area.T.w / 2, G.joy_desc_area.T.y,
            G.CARD_W, G.CARD_H, G.P_CARDS.empty,
            G.P_CENTERS[key])
        card.children.back = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["joy_Back"], { x = 0, y = 0 })
        card.children.back.states.hover = card.states.hover
        card.children.back.states.click = card.states.click
        card.children.back.states.drag = card.states.drag
        card.children.back.states.collide.can = false
        card.children.back:set_role({ major = card, role_type = 'Glued', draw_major = card })
        G.joy_desc_area:emplace(card)
        card:flip()
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("card1")
                card:flip()
                return true
            end,
        }))
    end

    table.insert(modNodes, {
        n = G.UIT.R,
        config = { align = "cm", padding = 0.07, no_fill = true },
        nodes = {
            { n = G.UIT.O, config = { object = G.joy_desc_area } }
        }
    })
end

SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = { r = 0.1, minw = 8, align = "tm", padding = 0.2, colour = G.C.BLACK },
        nodes = {
            {
                n = G.UIT.R,
                config = { padding = 0.2 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "cm" },
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = { align = "cm", padding = 0.01 },
                                nodes = {
                                    create_toggle({
                                        label = localize('b_joy_disable_booster_tag'),
                                        ref_table = JoyousSpring.config,
                                        ref_value = 'disable_booster_tag'
                                    })
                                }
                            },
                        }
                    },
                }
            },
        }
    }
end

JoyousSpring.collection_pool = {}

JoyousSpring.get_archetype_pool = function(pool)
    local archetype_pool = {}
    for i = 1, #JoyousSpring.collection_pool do
        archetype_pool[i] = {}
    end
    for _, center in ipairs(pool) do
        local found = false
        for archetype_index, archetype in ipairs(JoyousSpring.collection_pool) do
            for _, key in ipairs(archetype.keys) do
                if (center.original_key:sub(1, #key) == key) or (key == "misc" and not found) then
                    table.insert(archetype_pool[archetype_index], center)
                    found = true
                    break
                end
            end
        end
    end
    return archetype_pool
end

local create_UIBox_your_collection_jokers_ref = create_UIBox_your_collection_jokers
create_UIBox_your_collection_jokers = function()
    if G.ACTIVE_MOD_UI and G.ACTIVE_MOD_UI.id and G.ACTIVE_MOD_UI.id == "JoyousSpring" and #JoyousSpring.collection_pool > 0 then
        return JoyousSpring.card_collection_UIBox(G.P_CENTER_POOLS.Joker, { 5, 5, 5 }, {
            no_materialize = true,
            modify_card = function(card, center) card.sticker = get_joker_win_sticker(center) end,
            h_mod = 0.95,
        })
    end
    return create_UIBox_your_collection_jokers_ref()
end

-- Modified from SMODS
JoyousSpring.card_collection_UIBox = function(_pool, rows, args)
    args = args or {}
    args.w_mod = 1
    args.h_mod = 1
    args.card_scale = 1
    local deck_tables = {}
    local pool = SMODS.collection_pool(_pool)
    local archetype_pool = JoyousSpring.get_archetype_pool(pool)

    G.your_collection = {}
    local cards_per_page = 0
    local row_totals = {}
    for j = 1, #rows do
        row_totals[j] = cards_per_page
        cards_per_page = cards_per_page + rows[j]
        G.your_collection[j] = CardArea(
            G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
            (args.w_mod * rows[j] + 0.25) * G.CARD_W,
            args.h_mod * G.CARD_H,
            { card_limit = rows[j], type = 'title', highlight_limit = 0, collection = true }
        )
        table.insert(deck_tables,
            {
                n = G.UIT.R,
                config = { align = "cm", padding = 0.07, no_fill = true },
                nodes = {
                    { n = G.UIT.O, config = { object = G.your_collection[j] } }
                }
            })
    end

    local options = {}

    for i = 1, #archetype_pool do
        table.insert(options,
            (JoyousSpring.collection_pool[i].label and localize(JoyousSpring.collection_pool[i].label) or localize("b_joy_archetype_misc")) ..
            ' (' .. tostring(i) .. '/' .. #archetype_pool .. ")")
    end

    G.FUNCS.SMODS_card_collection_page = function(e)
        if not e or not e.cycle_config then return end
        for j = 1, #G.your_collection do
            for i = #G.your_collection[j].cards, 1, -1 do
                local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
                c:remove()
                c = nil
            end
        end
        for j = 1, #rows do
            for i = 1, rows[j] do
                local center = archetype_pool[e.cycle_config.current_option][i + row_totals[j]]
                if not center then break end
                local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w / 2, G.your_collection[j].T.y,
                    G.CARD_W * args.card_scale, G.CARD_H * args.card_scale, G.P_CARDS.empty,
                    (args.center and G.P_CENTERS[args.center]) or center)
                if args.modify_card then args.modify_card(card, center, i, j) end
                if not args.no_materialize then card:start_materialize(nil, i > 1 or j > 1) end
                G.your_collection[j]:emplace(card)
            end
        end
        INIT_COLLECTION_CARD_ALERTS()
    end

    G.FUNCS.SMODS_card_collection_page { cycle_config = { current_option = 1 } }

    local t = create_UIBox_generic_options({
        back_func = (args and args.back_func) or G.ACTIVE_MOD_UI and "openModUI_" .. G.ACTIVE_MOD_UI.id or
            'your_collection',
        snap_back = args.snap_back,
        infotip = args.infotip,
        contents = {
            { n = G.UIT.R, config = { align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05 }, nodes = deck_tables },
            {
                n = G.UIT.R,
                config = { align = "cm" },
                nodes = {
                    create_option_cycle({
                        options = options,
                        w = 4.5,
                        cycle_shoulders = true,
                        opt_callback =
                        'SMODS_card_collection_page',
                        current_option = 1,
                        colour = G.C.RED,
                        no_pips = true,
                        focus_args = { snap_to = true, nav = 'wide' }
                    })
                }
            },
        }
    })
    return t
end
