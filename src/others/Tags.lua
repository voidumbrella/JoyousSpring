--- TAGS
SMODS.Atlas({
    key = "joy_Tags",
    path = "tags.png",
    px = 34,
    py = 34
})

-- Booster Tag
SMODS.Tag({
    key = "booster",
    atlas = "joy_Tags",
    pos = { x = 0, y = 0 },
    discovered = true,
    apply = function(self, tag, context)
        if context.type == 'voucher_add' then
            tag:yep('+', G.C.BOOSTER, function()
                local boosters = {}

                for key, center in pairs(G.P_CENTERS) do
                    if key:sub(1, 2) == "p_" then
                        table.insert(boosters, center)
                    end
                end

                local booster_to_add = pseudorandom_element(boosters, pseudoseed("tag_joy_booster"))

                G.shop_booster.config.card_limit = G.shop_booster.config.card_limit + 1
                local card = Card(G.shop_booster.T.x + G.shop_booster.T.w / 2, G.shop_booster.T.y, G.CARD_W * 1.27,
                    G.CARD_H * 1.27, G.P_CARDS.empty, booster_to_add, {
                        bypass_discovery_center = true,
                        bypass_discovery_ui = true
                    })

                create_shop_card_ui(card, 'Booster', G.shop_booster)
                card.ability.booster_pos = G.shop_booster.config.card_limit
                G.shop_booster:emplace(card)
                return true
            end)
            self.triggered = true
        end
    end,
    in_pool = function(self, args)
        return not JoyousSpring.config.disable_booster_tag
    end,
})
