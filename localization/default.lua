return {
	descriptions = {
		Mod = {
			JoyousSpring = {
                name = "Joyous Spring",
                text = {
                    "Adds modern Yu-Gi-Oh! cards",
                },
            }
		},
		Joker = {
			-- Dragonmaid
			j_joy_dmaid_kitchen = {
				name = "{C:joy_effect}Kitchen Dragonmaid",
				text = {
                    "{C:attention}#1#{} free {C:green}Reroll{} per shop",
					" ",
                    "When {C:attention}Blind{} is selected,",
                    "{C:attention}transforms{} into",
					"{C:joy_effect}\"Dragonmaid Tinkhec\""
                },
			},
			j_joy_dmaid_tinkhec = {
				name = "{C:joy_effect}Dragonmaid Tinkhec",
				text = {
                    "{C:joy_normal}\"Dragonmaid\"{} {C:attention}Jokers{} each",
                    "give {C:mult}+#1#{} Mult",
					" ",
                    "At end of round,",
                    "{C:attention}transforms{} into",
					"{C:joy_effect}\"Kitchen Dragonmaid\""
                },
			},
			j_joy_dmaid_parlor = {
				name = "{C:joy_effect}Parlor Dragonmaid",
				text = {
                    "Gives {C:attention}#1#{} discard in packs",
					"once per shop",
					" ",
                    "When {C:attention}Blind{} is selected,",
                    "{C:attention}transforms{} into",
					"{C:joy_effect}\"Dragonmaid Lorpar\""
                },
			},
			j_joy_dmaid_lorpar = {
				name = "{C:joy_effect}Dragonmaid Lorpar",
				text = {
                    "{C:joy_normal}\"Dragonmaid\"{} {C:attention}Jokers{} each",
                    "give {C:chips}+#1#{} Chips",
					" ",
                    "At end of round,",
                    "{C:attention}transforms{} into",
					"{C:joy_effect}\"Parlor Dragonmaid\""
                },
			},
			j_joy_dmaid_nurse = {
				name = "{C:joy_effect}Nurse Dragonmaid",
				text = {
                    "Immediately {C:attention}revives 1{} random",
					"{C:blue}Common{} {C:joy_normal}\"Dragonmaid\"{} {C:attention}Joker{}",
					"from the {C:attention}GY{}, if any",
					" ",
                    "When {C:attention}Blind{} is selected,",
                    "{C:attention}transforms{} into",
					"{C:joy_effect}\"Dragonmaid Ernus\""
                },
			},
			j_joy_dmaid_ernus = {
				name = "{C:joy_effect}Dragonmaid Ernus",
				text = {
                    "{C:mult}+#1#{} Mult for each {C:joy_normal}\"Dragonmaid\"{}",
					"{C:attention}Joker{} in the {C:attention}GY{}",
					" ",
                    "At end of round,",
                    "{C:attention}transforms{} into",
					"{C:joy_effect}\"Nurse Dragonmaid\""
                },
			},
			j_joy_dmaid_laundry = {
				name = "{C:joy_effect}Laundry Dragonmaid",
				text = {
                    "Immediately adds {C:attention}#1#{} random",
					"{C:joy_normal}Main Deck \"Dragonmaid\"{} {C:attention}Jokers{}",
					"to the {C:attention}GY{}",
					" ",
                    "When {C:attention}Blind{} is selected,",
                    "{C:attention}transforms{} into",
					"{C:joy_effect}\"Dragonmaid Nudyarl\""
                },
			},
			j_joy_dmaid_nudyarl = {
				name = "{C:joy_effect}Dragonmaid Nudyarl",
				text = {
                    "{C:chips}+#1#{} Chips for each {C:joy_normal}\"Dragonmaid\"{}",
					"{C:attention}Joker{} in the {C:attention}GY{}",
					" ",
                    "At end of round,",
                    "{C:attention}transforms{} into",
					"{C:joy_effect}\"Laundry Dragonmaid\""
                },
			},
			j_joy_dmaid_chamber = {
				name = "{C:joy_effect}Chamber Dragonmaid",
				text = {
                    "Adds {C:attention}#1#{} random {C:joy_normal}\"Dragonmaid\"{}",
					"{C:attention}Joker{} to the shop, but",
					"it costs more",
					" ",
                    "When {C:attention}Blind{} is selected,",
                    "{C:attention}transforms{} into",
					"{C:joy_effect}\"Dragonmaid Stern\""
                },
			},
			j_joy_dmaid_stern = {
				name = "{C:joy_effect}Dragonmaid Stern",
				text = {
                    "Immediately {C:attention}revives 1{} random",
					"{C:green}Uncommon{} or {C:red}Rare{}",
					"{C:joy_normal}\"Dragonmaid\"{} {C:attention}Joker{}",
					"from the {C:attention}GY{}, if any",
					" ",
                    "At end of round,",
                    "{C:attention}transforms{} into",
					"{C:joy_effect}\"Chamber Dragonmaid\""
                },
			},
			j_joy_dmaid_lady = {
				name = "{C:joy_effect}Lady's Dragonmaid",
				text = {
                    "Adds {C:joy_fusion}\"House Dragonmaid\" to the",
                    "{C:joy_normal}\"Extra Deck\" {C:inactive,S:0.6}(Must have room){}",
					" ",
                    "When {C:attention}Blind{} is selected,",
                    "has a {C:green}1 in 3{} chance to",
                    "{C:attention}transform{} into a random",
					"{C:green}Uncommon{} {C:joy_normal}\"Dragonmaid\"{} {C:attention}Joker{}"
                },
			},
			j_joy_dmaid_house = {
				name = "{C:joy_fusion}House Dragonmaid",
				text = {
                    "Earn {C:money}$#1#{} at end of round per",
                    "card destroyed this run",
                    "",
                    "Destroy up to {C:attention}#2#{}",
                    "selected cards per shop",
					" ",
                    "After {C:attention}#3# Blinds{} are defeated,",
                    "{C:attention}transforms{} into",
					"{C:joy_fusion}\"Dragonmaid Sheou\" {C:inactive}(#4#/#3#){}"
                },
			},
			j_joy_dmaid_sheou = {
				name = "{C:joy_fusion}Dragonmaid Sheou",
				text = {
                    "When {C:attention}Boss Blind{} is selected,",
                    "disables its effects then",
                    "{C:attention}transforms{} into",
					"{C:joy_fusion}\"House Dragonmaid\"{} and",
					"creates {C:attention}#1#{} {C:blue}Common{}",
					"{C:joy_normal}\"Dragonmaid\"{} {C:attention}Joker{}",
					"{C:inactive}(Must have room){}"
                },
			},
		}
	},

}