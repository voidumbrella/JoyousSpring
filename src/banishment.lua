---BANISHMENT

---@alias banish_time
---| '"blind_selected"'
---| '"boss_selected"'
---| '"end_of_round"'
---| '"end_of_ante"'

---Banish a card until specified time
---@param card Card
---@param banish_until banish_time?
---@param func function?
---@param immediate boolean?
JoyousSpring.banish = function(card, banish_until, func, immediate)
    if not card or not card.area then return end
    card:juice_up()
    if immediate then
        local time_to_banish = banish_until == "blind_selected" and JoyousSpring.banish_blind_selected_area or
            banish_until == "boss_selected" and JoyousSpring.banish_boss_selected_area or
            banish_until == "end_of_ante" and JoyousSpring.banish_end_of_ante_area or
            JoyousSpring.banish_end_of_round_area
        local area = card.area
        card.area.config.card_limit = card.area.config.card_limit - ((card.edition and card.edition.negative) and 1 or 0)
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
                if card and card.area then
                    local time_to_banish = banish_until == "blind_selected" and JoyousSpring.banish_blind_selected_area or
                        banish_until == "boss_selected" and JoyousSpring.banish_boss_selected_area or
                        banish_until == "end_of_ante" and JoyousSpring.banish_end_of_ante_area or
                        JoyousSpring.banish_end_of_round_area
                    local area = card.area
                    card.area.config.card_limit = card.area.config.card_limit -
                        ((card.edition and card.edition.negative) and 1 or 0)
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
                end
                return true
            end,
        }))
    end
end

---Returns a card from banishment (doesn't need room)
---@param card Card
JoyousSpring.return_from_banish = function(card)
    local area = card.area
    area:remove_card(card)
    if card.ability.set == 'Joker' then
        G.jokers:emplace(card)
        G.jokers.config.card_limit = G.jokers.config.card_limit + ((card.edition and card.edition.negative) and 1 or 0)
    else
        G.consumeables:emplace(card)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit +
            ((card.edition and card.edition.negative) and 1 or 0)
    end

    SMODS.calculate_context({ joy_returned = true, joy_returned_card = card, joy_returned_area = area })
end

local game_start_run_ref = Game.start_run
function Game:start_run(args)
    self.joy_banish_blind_selected_area = CardArea(
        0,
        0,
        self.CARD_W * 4.95,
        self.CARD_H * 0.95,
        {
            card_limit = 999,
            type = 'title',
            highlight_limit = 1,
        }
    )
    self.joy_banish_blind_selected_area.states.visible = false
    JoyousSpring.banish_blind_selected_area = G.joy_banish_blind_selected_area
    self.joy_banish_end_of_round_area = CardArea(
        0,
        0,
        self.CARD_W * 4.95,
        self.CARD_H * 0.95,
        {
            card_limit = 999,
            type = 'title',
            highlight_limit = 1,
        }
    )
    self.joy_banish_end_of_round_area.states.visible = false
    JoyousSpring.banish_end_of_round_area = G.joy_banish_end_of_round_area
    self.joy_banish_boss_selected_area = CardArea(
        0,
        0,
        self.CARD_W * 4.95,
        self.CARD_H * 0.95,
        {
            card_limit = 999,
            type = 'title',
            highlight_limit = 1,
        }
    )
    self.joy_banish_boss_selected_area.states.visible = false
    JoyousSpring.banish_boss_selected_area = G.joy_banish_boss_selected_area
    self.joy_banish_end_of_ante_area = CardArea(
        0,
        0,
        self.CARD_W * 4.95,
        self.CARD_H * 0.95,
        {
            card_limit = 999,
            type = 'title',
            highlight_limit = 1,
        }
    )
    self.joy_banish_end_of_ante_area.states.visible = false
    JoyousSpring.banish_end_of_ante_area = G.joy_banish_end_of_ante_area

    game_start_run_ref(self, args)
end
