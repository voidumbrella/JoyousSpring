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

JoyousSpring.remove_material = function(card)
    card.area:remove_card(card)
    card:remove_from_deck()
    card:start_dissolve()
end

if JoyousSpring.debug then
    function calculate_reroll_cost(skip_increment)
        G.GAME.current_round.reroll_cost = 0
    end

    G.FUNCS.joy_debug_print = function(e)
        sendDebugMessage("test")
    end
end
