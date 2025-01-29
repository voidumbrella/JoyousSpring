----------------------------------------------
------------MOD CODE -------------------------

---MOD INITIALIZATION

JoyousSpring = {}

JoyousSpring.transform_card = function(card, other_key, keep_edition)
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:flip()
            card:set_ability(G.P_CENTERS[other_key])
            play_sound("card1")
            card:juice_up(0.3, 0.3)
            return true
        end,
    }))
    delay(0.2)
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:flip()
            card:juice_up(0.3, 0.3)
            return true
        end,
    }))
end

--Localization colors
local lc = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        lc()
    end
    G.ARGS.LOC_COLOURS.joy_normal = HEX("FDDD5D")
    G.ARGS.LOC_COLOURS.joy_effect = HEX("FF8B53")
    G.ARGS.LOC_COLOURS.joy_spell = HEX("1D9E74")
    G.ARGS.LOC_COLOURS.joy_trap = HEX("BC5A84")
    G.ARGS.LOC_COLOURS.joy_ritual = HEX("9DB5CC")
    G.ARGS.LOC_COLOURS.joy_fusion = HEX("A086B7")
    G.ARGS.LOC_COLOURS.joy_synchro = HEX("CCCCCC")
    G.ARGS.LOC_COLOURS.joy_xyz = HEX("5E5E5E")
    G.ARGS.LOC_COLOURS.joy_link = HEX("006EAD")
    G.ARGS.LOC_COLOURS.joy_token = HEX("828E85")

    return lc(_c, _default)
end

SMODS.Atlas({
    key = "modicon",
    path = "icon.png",
    px = 32,
    py = 32
})

SMODS.Atlas({
    key = "Dragonmaid",
    path = "Dragonmaid.png",
    px = 71,
    py = 95
})

SMODS.Joker({
    key = "dmaid_kitchen",
    atlas = 'Dragonmaid',
    pos = { x = 0, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.rerolls } }
    end,
    config = {
        extra = {
            monster_archetypes = { ["Dragonmaid"] = true },
            monster_types = { ["Effect"] = true },
            rerolls = 1
        },
    },
	calculate = function(self, card, context)
		if context.setting_blind and not context.repetition and not context.individual then
			JoyousSpring.transform_card(card, "j_joy_dmaid_tinkhec")
		end
	end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + card.ability.extra.rerolls
        calculate_reroll_cost(true)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls - card.ability.extra.rerolls
        calculate_reroll_cost(true)
    end
})

SMODS.Joker({
    key = "dmaid_tinkhec",
    atlas = 'Dragonmaid',
    pos = { x = 1, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    config = {
        extra = {
            monster_archetypes = { ["Dragonmaid"] = true },
            monster_types = { ["Effect"] = true },
            mult = 20
        },
    },
    calculate = function(self, card, context)
        if context.end_of_round and not context.repetition and not context.individual then
			JoyousSpring.transform_card(card, "j_joy_dmaid_kitchen")
		end
		if context.other_joker and context.other_joker.ability.set == "Joker" and context.other_joker.ability.extra.monster_archetypes and context.other_joker.ability.extra.monster_archetypes["Dragonmaid"] then
			G.E_MANAGER:add_event(Event({
                func = function()
                    context.other_joker:juice_up(0.5, 0.5)
                    return true
                end,
            }))
			return {
				message = localize({ type = "variable", key = "a_mult", vars = { card.ability.extra.mult } }),
				mult_mod = card.ability.extra.mult,
			}
		end
	end,
})

SMODS.Joker({
    key = "dmaid_parlor",
    atlas = 'Dragonmaid',
    pos = { x = 2, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.discards } }
    end,
    config = {
        extra = {
            monster_archetypes = { ["Dragonmaid"] = true },
            monster_types = { ["Effect"] = true },
            discards = 1
        },
    },
	calculate = function(self, card, context)
		if context.setting_blind and not context.repetition and not context.individual then
			JoyousSpring.transform_card(card, "j_joy_dmaid_lorpar")
		end
	end,
})

SMODS.Joker({
    key = "dmaid_lorpar",
    atlas = 'Dragonmaid',
    pos = { x = 3, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    config = {
        extra = {
            monster_archetypes = { ["Dragonmaid"] = true },
            monster_types = { ["Effect"] = true },
            chips = 20
        },
    },
    calculate = function(self, card, context)
        if context.end_of_round and not context.repetition and not context.individual then
			JoyousSpring.transform_card(card, "j_joy_dmaid_parlor")
		end
		if context.other_joker and context.other_joker.ability.set == "Joker" and context.other_joker.ability.extra.monster_archetypes and context.other_joker.ability.extra.monster_archetypes["Dragonmaid"] then
			G.E_MANAGER:add_event(Event({
                func = function()
                    context.other_joker:juice_up(0.5, 0.5)
                    return true
                end,
            }))
			return {
				message = localize({ type = "variable", key = "a_chips", vars = { card.ability.extra.chips } }),
				chips_mod = card.ability.extra.chips,
			}
		end
	end,
})

SMODS.Joker({
    key = "dmaid_nurse",
    atlas = 'Dragonmaid',
    pos = { x = 4, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    cost = 3,
    config = {
        extra = {
            monster_archetypes = { ["Dragonmaid"] = true },
            monster_types = { ["Effect"] = true },
        },
    },
	calculate = function(self, card, context)
		if context.setting_blind and not context.repetition and not context.individual then
			JoyousSpring.transform_card(card, "j_joy_dmaid_ernus")
		end
	end,
})

SMODS.Joker({
    key = "dmaid_ernus",
    atlas = 'Dragonmaid',
    pos = { x = 5, y = 0 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    config = {
        extra = {
            monster_archetypes = { ["Dragonmaid"] = true },
            monster_types = { ["Effect"] = true },
            mult = 5
        },
    },
    calculate = function(self, card, context)
        if context.end_of_round and not context.repetition and not context.individual then
			JoyousSpring.transform_card(card, "j_joy_dmaid_nurse")
		end
	end,
})

SMODS.Joker({
    key = "dmaid_laundry",
    atlas = 'Dragonmaid',
    pos = { x = 0, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mill } }
    end,
    config = {
        extra = {
            monster_archetypes = { ["Dragonmaid"] = true },
            monster_types = { ["Effect"] = true },
            mill = 3
        },
    },
	calculate = function(self, card, context)
		if context.setting_blind and not context.repetition and not context.individual then
			JoyousSpring.transform_card(card, "j_joy_dmaid_nudyarl")
		end
	end,
})

SMODS.Joker({
    key = "dmaid_nudyarl",
    atlas = 'Dragonmaid',
    pos = { x = 1, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    config = {
        extra = {
            monster_archetypes = { ["Dragonmaid"] = true },
            monster_types = { ["Effect"] = true },
            chips = 10
        },
    },
    calculate = function(self, card, context)
        if context.end_of_round and not context.repetition and not context.individual then
			JoyousSpring.transform_card(card, "j_joy_dmaid_laundry")
		end
	end,
})

SMODS.Joker({
    key = "dmaid_chamber",
    atlas = 'Dragonmaid',
    pos = { x = 2, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_add } }
    end,
    config = {
        extra = {
            monster_archetypes = { ["Dragonmaid"] = true },
            monster_types = { ["Effect"] = true },
            cards_to_add = 1
        },
    },
	calculate = function(self, card, context)
		if context.setting_blind and not context.repetition and not context.individual then
			JoyousSpring.transform_card(card, "j_joy_dmaid_stern")
		end
	end,
})

SMODS.Joker({
    key = "dmaid_stern",
    atlas = 'Dragonmaid',
    pos = { x = 3, y = 1 },
    rarity = 2,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    config = {
        extra = {
            monster_archetypes = { ["Dragonmaid"] = true },
            monster_types = { ["Effect"] = true },
        },
    },
    calculate = function(self, card, context)
        if context.end_of_round and not context.repetition and not context.individual then
			JoyousSpring.transform_card(card, "j_joy_dmaid_chamber")
		end
	end,
})

SMODS.Joker({
    key = "dmaid_house",
    atlas = 'Dragonmaid',
    pos = { x = 4, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money, card.ability.extra.cards_to_destroy, card.ability.extra.blinds, 0 } }
    end,
    config = {
        extra = {
            monster_archetypes = { ["Dragonmaid"] = true },
            monster_types = { ["Effect"] = true, ["Fusion"] = true },
            money = 1,
            cards_to_destroy = 2,
            blinds = 3
        },
    },
	calculate = function(self, card, context)
		if context.setting_blind and not context.repetition and not context.individual then
			JoyousSpring.transform_card(card, "j_joy_dmaid_sheou")
		end
	end,
})

SMODS.Joker({
    key = "dmaid_sheou",
    atlas = 'Dragonmaid',
    pos = { x = 5, y = 1 },
    rarity = 3,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_to_create } }
    end,
    config = {
        extra = {
            monster_archetypes = { ["Dragonmaid"] = true },
            monster_types = { ["Effect"] = true },
            cards_to_create = 1
        },
    },
    calculate = function(self, card, context)
        if context.end_of_round and not context.repetition and not context.individual then
			JoyousSpring.transform_card(card, "j_joy_dmaid_house")
		end
	end,
})

----------------------------------------------
------------MOD CODE END----------------------
