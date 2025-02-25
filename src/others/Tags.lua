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
                SMODS.add_booster_to_shop()
                return true
            end)
            self.triggered = true
        end
    end,
    in_pool = function(self, args)
        return not JoyousSpring.config.disable_booster_tag
    end,
})
