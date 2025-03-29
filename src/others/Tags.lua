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

-- Card Tag
SMODS.Tag({
    key = "monster",
    atlas = "joy_Tags",
    loc_vars = function(self, info_queue, tag)
        if tag.ability.monster then
            info_queue[#info_queue + 1] = G.P_CENTERS[tag.ability.monster]
        end
        local name = tag.ability.monster and localize({ type = 'name_text', set = 'Joker', key = tag.ability.monster }) or
            localize("k_joy_monster_tag_default")
        local name_for_color = tag.ability.monster and G.localization.descriptions["Joker"][tag.ability.monster].name or
            ""
        local name_color = "joy_normal"
        if string.len(name_for_color) > 2 and string.sub(name_for_color, string.len(name_for_color) - 1, string.len(name_for_color)) == "{}" then
            name = string.sub(name_for_color, 1, string.len(name_for_color) - 2)
        end
        if string.sub(name_for_color, 1, 3) == "{C:" then
            local _, _, color, real_name = string.find(name_for_color, "{C:(.*)}(.*)")
            name = real_name
            name_color = color or name_color
        end
        return { vars = { name, colours = { G.ARGS.LOC_COLOURS[name_color] } } }
    end,
    pos = { x = 1, y = 0 },
    discovered = true,
    set_ability = function(self, tag)
        tag.ability.monster = G.GAME.joy_last_monster_tag
    end,
    apply = function(self, tag, context)
        if context.type == 'store_joker_create' then
            local joy_forced_card = SMODS.create_card({
                key = tag.ability.monster or "j_joy_token",
                area = G.shop_jokers
            })
            create_shop_card_ui(joy_forced_card, 'Joker', G.shop_jokers)
            joy_forced_card.states.visible = false
            tag:yep('+', JoyousSpring.is_monster_card(joy_forced_card) and
                joy_forced_card.ability.extra.joyous_spring.summon_type and
                G.C.JOY[joy_forced_card.ability.extra.joyous_spring.summon_type] or G.C.JOY.EFFECT, function()
                    joy_forced_card:start_materialize()
                    return true
                end)
            tag.triggered = true
            joy_forced_card:set_cost()
            return joy_forced_card
        end
    end,
    in_pool = function(self, args)
        return false
    end,
})
