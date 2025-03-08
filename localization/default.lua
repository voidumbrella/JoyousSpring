return {
	descriptions = {
		Mod = {
			JoyousSpring = {
				name = "JoyousSpring",
				text = {
					"Adds modern {C:joy_effect}Yu-Gi-Oh!{} cards and mechanics",
				},
			}
		},
		Joker = {
			j_joy_token = {
				name = "{C:joy_token}Token",
				text = {
					"This card can be used as any {C:joy_token}Token{}",
				},
			},
			--#region Dragonmaid
			j_joy_dmaid_kitchen = {
				name = "{C:joy_effect}Kitchen Dragonmaid",
				text = {
					"{C:attention}#1#{} free {C:green}Reroll{} for each",
					"{C:joy_normal}\"Dragonmaid\"{} when obtained",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Dragonmaid Tinkhec\"",
					"when {C:attention}Blind{} is selected",
				},
			},
			j_joy_dmaid_tinkhec = {
				name = "{C:joy_effect}Dragonmaid Tinkhec",
				text = {
					"{C:joy_normal}\"Dragonmaids\"{} each",
					"give {C:mult}+#1#{} Mult",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Kitchen Dragonmaid\"",
					"at end of round",
				},
			},
			j_joy_dmaid_parlor = {
				name = "{C:joy_effect}Parlor Dragonmaid",
				text = {
					"{C:attention}#1# Booster Tag{} when obtained",
					"if you have {C:attention}#2#{} {C:joy_normal}\"Dragonmaids\"{},",
					"gaining an extra for every {C:attention}#3#{} more",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Dragonmaid Lorpar\"",
					"when {C:attention}Blind{} is selected",
				},
			},
			j_joy_dmaid_lorpar = {
				name = "{C:joy_effect}Dragonmaid Lorpar",
				text = {
					"{C:joy_normal}\"Dragonmaids\"{} each",
					"give {X:mult,C:white}X#1#{} Mult",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Parlor Dragonmaid\"",
					"at end of round",
				},
			},
			j_joy_dmaid_nurse = {
				name = "{C:joy_effect}Nurse Dragonmaid",
				text = {
					"{C:green}#1# in #2#{} chance to {C:attention}revive #3#{}",
					"{C:blue}Common{} {C:joy_normal}\"Dragonmaid\"{} when obtained",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Dragonmaid Ernus\"",
					"when {C:attention}Blind{} is selected",
				},
			},
			j_joy_dmaid_ernus = {
				name = "{C:joy_effect}Dragonmaid Ernus",
				text = {
					"{C:mult}+#1#{} Mult for each",
					"{C:joy_normal}\"Dragonmaid\"{} in the {C:attention}GY{}",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Nurse Dragonmaid\"",
					"at end of round",
				},
			},
			j_joy_dmaid_laundry = {
				name = "{C:joy_effect}Laundry Dragonmaid",
				text = {
					"Sends {C:attention}#1#{} random {C:joy_normal}Main Deck{}",
					"{C:joy_normal}\"Dragonmaids\"{} to the {C:attention}GY{}",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Dragonmaid Nudyarl\"",
					"when {C:attention}Blind{} is selected",
				},
			},
			j_joy_dmaid_nudyarl = {
				name = "{C:joy_effect}Dragonmaid Nudyarl",
				text = {
					"{C:chips}+#1#{} Chips for each",
					"{C:joy_normal}\"Dragonmaid\"{} in the {C:attention}GY{}",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Laundry Dragonmaid\"",
					"at end of round",
				},
			},
			j_joy_dmaid_chamber = {
				name = "{C:joy_effect}Chamber Dragonmaid",
				text = {
					"{C:attention}#1# Voucher Tag{} when obtained if you have",
					"{C:attention}#2#{} {C:joy_normal}\"Dragonmaids\"{},",
					"gaining an extra for every {C:attention}#3#{} more",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Dragonmaid Stern\"",
					"when {C:attention}Blind{} is selected",
				},
			},
			j_joy_dmaid_stern = {
				name = "{C:joy_effect}Dragonmaid Stern",
				text = {
					"{C:green}#1# in #2#{} chance to {C:attention}revive #3#{}",
					"{C:green}Uncommon{} or {C:red}Rare{} {C:joy_normal}\"Dragonmaid\"{}",
					"when obtained",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Chamber Dragonmaid\"",
					"at end of round",
				},
			},
			j_joy_dmaid_lady = {
				name = "{C:joy_fusion}Lady's Dragonmaid",
				text = {
					"Adds {C:joy_fusion}\"House Dragonmaid\"{} to the",
					"{C:joy_spell}Extra Deck{} when obtained",
					"{C:inactive}(Must have room){}",
					" ",
					"{C:green}#1# in #2#{} chance to {C:attention}transform{} into an",
					"{C:green}Uncommon{} {C:joy_normal}\"Dragonmaid\"{}",
					"when {C:attention}Blind{} is selected",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:attention}Jokers{}, including a {C:joy_normal}\"Dragonmaid\"{}"
				}
			},
			j_joy_dmaid_house = {
				name = "{C:joy_fusion}House Dragonmaid",
				text = {
					"{X:mult,C:white}X#1#{} Mult for each {C:joy_normal}\"Dragonmaid\"{}",
					"{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
					" ",
					"{C:attention}Jokers{} in the {C:attention}GY{} count for",
					"{C:joy_normal}\"Dragonmaid\"{} abilities",
					" ",
					"{C:attention}Transforms{} into {C:joy_fusion}\"Dragonmaid Sheou\"",
					"after {C:attention}#3#{} rounds {C:inactive}(#4#/#3#){}",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:joy_normal}\"Dragonmaids\"{}"
				}
			},
			j_joy_dmaid_sheou = {
				name = "{C:joy_fusion}Dragonmaid Sheou",
				text = {
					"{C:attention}Jokers{} in the {C:attention}GY{} count for",
					"{C:joy_normal}\"Dragonmaid\"{} abilities",
					" ",
					"When {C:attention}Boss Blind{} is selected,",
					"disables its effects then {C:attention}transforms{} into",
					"{C:joy_fusion}\"House Dragonmaid\"{} and creates {C:attention}#1#{}",
					"{C:blue}Common{} {C:joy_normal}\"Dragonmaid\"{}",
					"{C:inactive}(Must have room){}"
				},
			},
			--#endregion
			--#region Live Twin
			j_joy_ltwin_lilla = {
				name = "{C:joy_effect}Live☆Twin Lil-la",
				text = {
					"{C:chips}+#1#{} Chips",
					" ",
					"Create {C:attention}#2#{} {C:joy_effect}\"Live☆Twin Ki-sikil\"{}",
					"when obtained, if not owned",
					"{C:inactive}(Must have room){}",
				},
			},
			j_joy_ltwin_kisikil = {
				name = "{C:joy_effect}Live☆Twin Ki-sikil",
				text = {
					"{C:mult}+#1#{} Mult",
					" ",
					"Create {C:attention}#2#{} {C:joy_effect}\"Live☆Twin Lil-la\"{}",
					"when obtained, if not owned",
					"{C:inactive}(Must have room){}",
				},
			},
			j_joy_ltwin_lilla_treat = {
				name = "{C:joy_effect}Live☆Twin Lil-la Treat",
				text = {
					"{C:red}+#1#{} discard each round",
					" ",
					"Free if you own a {C:joy_normal}\"Ki-sikil\"{}"
				},
			},
			j_joy_ltwin_lilla_sweet = {
				name = "{C:joy_effect}Live☆Twin Lil-la Sweet",
				text = {
					"{C:blue}+#1#{} hand each round",
					" ",
					"Free if you own a {C:joy_normal}\"Ki-sikil\"{}"
				},
			},
			j_joy_ltwin_kisikil_frost = {
				name = "{C:joy_effect}Live☆Twin Ki-sikil Frost",
				text = {
					"{C:attention}+#1#{} hand size",
					" ",
					"Free if you own a {C:joy_normal}\"Lil-la\"{}"
				},
			},
			j_joy_etwin_kisikil_deal = {
				name = "{C:joy_link}Evil★Twin Ki-sikil Deal",
				text = {
					"{C:mult}+#1#{} Mult",
					"{C:attention}+#2#{} hand size",
					" ",
					"Sends {C:attention}#3#{} {C:joy_normal}Main Deck \"Lil-la\"{} to the {C:attention}GY{}",
					"when {C:attention}Blind{} is selected",
				},
				joy_summon_conditions = {
					"{C:attention}1{} {C:joy_normal}\"Ki-sikil\"{}"
				}
			},
			j_joy_etwin_kisikil = {
				name = "{C:joy_link}Evil★Twin Ki-sikil",
				text = {
					"{C:mult}+#1#{} Mult",
					" ",
					"Permanently gain {C:attention}+#2#{} hand size if you",
					"own a {C:joy_normal}\"Lil-la\"{} when obtained",
					" ",
					"{C:attention}Revives #3#{} {C:joy_link}Evil★Twin Lil-la{} or {C:attention}#3#{}",
					"{C:joy_normal}\"Lil-la\"{} when {C:attention}Blind{} is selected",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:attention}Jokers{}, including a {C:joy_normal}\"Ki-sikil\"{}"
				}
			},
			j_joy_etwin_lilla = {
				name = "{C:joy_link}Evil★Twin Lil-la",
				text = {
					"{C:chips}+#1#{} Chips",
					" ",
					"{C:money}+$#2#{} if you own a {C:joy_normal}\"Ki-sikil\"{} when obtained",
					" ",
					"{C:attention}Revives #3#{} {C:joy_link}Evil★Twin Ki-sikil{} or {C:attention}#3#{}",
					"{C:joy_normal}\"Ki-sikil\"{} when {C:attention}Blind{} is selected",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:attention}Jokers{}, including a {C:joy_normal}\"Lil-la\"{}"
				}
			},
			j_joy_etwin_kisikil_lilla = {
				name = "{C:joy_effect}Evil★Twins Ki-sikil & Lil-la",
				text = {
					"{C:chips}+#1#{} Chips for each {C:joy_normal}\"Lil-la\"{} in the {C:attention}GY{}",
					"{C:mult}+#2#{} Mult for each {C:joy_normal}\"Ki-sikil\"{} in the {C:attention}GY{}",
					"{C:inactive}(Currently{} {C:chips}+#4#{} {C:inactive}Chips{} {C:mult}+#5#{} {C:inactive}Mult){}",
					"{C:red}-#3#{} discards for each {C:joy_link}Link{} when {C:attention}Blind{} is selected",
					" ",
					"Cannot be {C:attention}revived{}",
				},
			},
			j_joy_etwin_sunny = {
				name = "{C:joy_link}Evil★Twin's Trouble Sunny",
				text = {
					"{C:chips}+#1#{} Chips",
					"{C:mult}+#2#{} Mult",
					" ",
					"{C:attention}Returns{} to the {C:joy_spell}Extra Deck{} and {C:attention}revives{}",
					"{C:attention}#3#{} {C:joy_link}Evil★Twin Ki-sikil{} and {C:attention}#3#{} {C:joy_link}Evil★Twin Lil-la{}",
					"at end of round",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:joy_normal}\"Evil★Twin\"{}"
				}
			},
			j_joy_ltwin_channel = {
				name = "{C:joy_spell}Live☆Twin Channel",
				text = {
					"During a {C:attention}Blind{}, you can {C:attention}tribute #1#{}",
					"{C:joy_normal}\"Ki-sikil\"{} or {C:joy_normal}\"Lil-la\"{} {C:joy_link}Link{} to",
					"{C:attention}double{} current chips scored",
					" ",
					"{C:attention}Revives #2#{} {C:joy_normal}\"Ki-sikil\"{} or {C:joy_normal}\"Lil-la\"{}",
					"at the end of the shop"
				}
			},
			--#endregion
			--#region Dogmatika
			j_joy_dogma_ecclesia = {
				name = "{C:joy_effect}Dogmatika Ecclesia, the Virtuous",
				text = {
					"Gains {X:mult,C:white}X#1#{} Mult for each {C:joy_spell}Extra Deck{} {C:attention}Joker{} sold,",
					"resets when {C:attention}Boss Blind{} is defeated",
					"{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}"
				},
			},
			j_joy_dogma_fleur = {
				name = "{C:joy_effect}Dogmatika Fleurdelis, the Knighted",
				text = {
					"{C:joy_normal}\"Dogmatika\"{} each give {C:mult}+#1#{} Mult",
				},
			},
			j_joy_dogma_maximus = {
				name = "{C:joy_effect}Dogmatika Maximus",
				text = {
					"Create {C:attention}#1#{} debuffed {C:dark_edition}Negative{} {C:joy_spell}Extra Deck{} {C:attention}Joker{}",
					"when {C:attention}Blind{} is selected",
				},
			},
			j_joy_dogma_adin = {
				name = "{C:joy_effect}Dogmatika Adin, the Enlightened",
				text = {
					"Create {C:attention}#1#{} non-{C:joy_ritual}Ritual{} {C:joy_normal}\"Dogmatika\"{}",
					"when {C:attention}Boss Blind{} is defeated",
					"{C:inactive}(Must have room){}",
					" ",
					"Free if you own a debuffed {C:joy_spell}Extra Deck{} {C:attention}Joker{}"
				},
			},
			j_joy_dogma_theo = {
				name = "{C:joy_effect}Dogmatika Theo, the Iron Punch",
				text = {
					"{C:chips}+#1#{} Chips for each debuffed {C:joy_spell}Extra Deck{} {C:attention}Joker{}",
					"{C:inactive}(Currently{} {C:chips}+#2# {C:inactive}Chips){}",
					" ",
					"Free if you own a debuffed {C:joy_spell}Extra Deck{} {C:attention}Joker{}"
				},
			},
			j_joy_dogma_ashiyan = {
				name = "{C:joy_effect}Dogmatika Ashiyan",
				text = {
					"{C:attention}Revives #1#{} {C:joy_normal}\"Dogmatika\"{} when obtained",
					" ",
					"Free if you own a debuffed {C:joy_spell}Extra Deck{} {C:attention}Joker{}"
				},
			},
			j_joy_dogma_nexus = {
				name = "{C:joy_effect}Dogmatika Nexus",
				text = {
					"{C:attention}Duplicate #1#{} random {{C:joy_spell}Extra Deck{} {C:attention}Jokers{}",
					"at end of round",
					"{C:inactive}(The copy will be debuffed and{} {C:dark_edition}Negative{}{C:inactive}){}"
				},
			},
			j_joy_dogma_relic = {
				name = "{C:joy_ritual}White Relic of Dogmatika",
				text = {
					"{C:attention}+#1#{} hand size for every {C:attention}#2#{} debuffed",
					"{C:joy_spell}Extra Deck{} {C:attention}Jokers{}",
					"{C:inactive}(Currently{} {C:attention}+#3# {C:inactive}hand size){}",
					" ",
					"{C:joy_spell}Extra Deck{} {C:attention}Jokers{} in the {C:attention}GY{}",
					"count for {C:joy_normal}\"Dogmatika\"{} abilities {C:inactive}(as debuffed){}"
				},
				joy_summon_conditions = {
					"{C:attention}2 Jokers{}, including a {C:joy_normal}\"Dogmatika\"{}"
				}
			},
			j_joy_dogma_knight = {
				name = "{C:joy_ritual}White Knight of Dogmatika",
				text = {
					"{C:mult}+#1#{} Mult for each debuffed",
					"{C:joy_spell}Extra Deck{} {C:attention}Joker{}",
					"{C:inactive}(Currently{} {C:mult}+#2# {C:inactive}Mult){}",
					" ",
					"All {C:joy_spell}Extra Deck{} {C:attention}Jokers{} in the shop are debuffed and free",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:joy_normal}\"Dogmatika\"{}"
				}
			},
			j_joy_dogma_nation = {
				name = "{C:joy_spell}Dogmatika Nation",
				text = {
					"{C:money}+$#1#{} for each debuffed {C:joy_spell}Extra Deck{} {C:attention}Joker{}",
					"at end of round",
					"{C:inactive}(Currently{} {C:money}+$#2#{C:inactive}){}",
					" ",
					"You can {C:attention}tribute #3#{} {C:joy_spell}Extra Deck{} {C:attention}Jokers{}",
					"to create {C:attention}#4#{} {C:joy_normal}\"Dogmatika\"{}",
					"{C:inactive}(Must have room){}",
				}
			},
			--#endregion
			--#region Ghost Girls
			j_joy_yokai_ogre = {
				name = "{C:joy_effect}Ghost Ogre & Snow Rabbit",
				text = {
					"Destroy every scored card",
					"Gains {X:mult,C:white}X#1#{} Mult for each",
					"{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}"
				},
			},
			j_joy_yokai_reaper = {
				name = "{C:joy_effect}Ghost Reaper & Winter Cherries",
				text = {
					"{X:mult,C:white}X#1#{} Mult for each",
					"{C:joy_spell}Extra Deck{} {C:attention}Joker{} in the {C:attention}GY{}",
					"{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}"
				},
			},
			j_joy_yokai_ash = {
				name = "{C:joy_effect}Ash Blossom & Joyous Spring",
				text = {
					"{C:green}#1# in #2#{} chance to not draw cards",
					"after playing/discarding",
					"Gains {X:mult,C:white}X#3#{} Mult each time",
					"this effect is triggered",
					"{C:inactive}(Currently{} {X:mult,C:white}X#4#{} {C:inactive}Mult){}"
				},
			},
			j_joy_yokai_belle = {
				name = "{C:joy_effect}Ghost Belle & Haunted Mansion",
				text = {
					"Gains {X:mult,C:white}X#1#{} Mult when a {C:attention}Joker{}",
					"is {C:attention}revived{}",
					"{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}"
				},
			},
			j_joy_yokai_sister = {
				name = "{C:joy_effect}Ghost Sister & Spooky Dogwood",
				text = {
					"Gains {X:mult,C:white}X#1#{} Mult per consumable used",
					"during a {C:attention}Blind{}",
					"{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
					" ",
					"If none are used this round, {C:red}you lose{}",
				},
			},
			j_joy_yokai_mourner = {
				name = "{C:joy_effect}Ghost Mourner & Moonlit Chill",
				text = {
					"Permanently debuffs every",
					"{C:blue}Common{} and {C:green}Uncommon{} {C:attention}Joker{}",
					"Gains {X:mult,C:white}X#1#{} Mult for each debuffed card sold",
					"{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
				},
			},
			--#endregion
			--#region Spright
			j_joy_spright_blue = {
				name = "{C:joy_effect}Spright Blue",
				text = {
					"Create {C:attention}#1#{} {C:joy_normal}Main Deck{}",
					"{C:joy_normal}\"Spright\"{} at end of round",
					"{C:inactive}(Must have room){}",
					" ",
					"Free if you own an {C:green}Uncommon{} {C:attention}Joker{}"
				},
			},
			j_joy_spright_jet = {
				name = "{C:joy_effect}Spright Jet",
				text = {
					"Add {C:attention}#1#{} {C:green}Uncommon{} {C:attention}Jokers{}",
					"to the {C:attention}GY{} when {C:attention}Blind{} is selected",
					" ",
					"Free if you own an {C:green}Uncommon{} {C:attention}Joker{}"
				},
			},
			j_joy_spright_carrot = {
				name = "{C:joy_effect}Spright Carrot",
				text = {
					"Gains {X:mult,C:white}X#1#{} Mult for each",
					"{C:green}Uncommon{} {C:attention}Joker{}",
					"{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
					" ",
					"Free if you own an {C:green}Uncommon{} {C:attention}Joker{}"
				},
			},
			j_joy_spright_red = {
				name = "{C:joy_effect}Spright Red",
				text = {
					"{C:mult}+#1#{} Mult for each",
					"{C:green}Uncommon{} {C:attention}Joker{}",
					"{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult){}",
					" ",
					"Free if you own an {C:green}Uncommon{} {C:attention}Joker{}"
				},
			},
			j_joy_spright_pixies = {
				name = "{C:joy_effect}Spright Pixies",
				text = {
					"{C:chips}+#1#{} Chips for each",
					"{C:green}Uncommon{} {C:attention}Joker{}",
					"{C:inactive}(Currently{} {C:chips}+#2#{} {C:inactive}Chips){}",
					" ",
					"Free if you own an {C:green}Uncommon{} {C:attention}Joker{}"
				},
			},
			j_joy_spright_elf = {
				name = "{C:joy_link}Spright Elf",
				text = {
					"{C:attention}Revives #1#{} {C:green}Uncommon{} {C:attention}Joker{}",
					"when {C:attention}Blind{} is selected",
					" ",
					"{C:green}Uncommon{} {C:attention}Jokers{} in the {C:attention}GY{}",
					"count for {C:joy_normal}\"Spright\"{} abilities"
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:green}Uncommon{} {C:attention}Jokers{}"
				}
			},
			j_joy_spright_sprind = {
				name = "{C:joy_link}Spright Sprind",
				text = {
					"Other {C:green}Uncommon{} {C:attention}Jokers{} become {C:dark_edition}Negative{},",
					"the rest are debuffed",
					" ",
					"Adds {C:joy_xyz}\"Gigantic Spright\"{} to the",
					"{C:joy_spell}Extra Deck{} after {C:attention}#1# materials{} are {C:joy_xyz}detached{}",
					"{C:inactive}(Must have room){}",
					"{C:inactive}(#2#/#1#){}",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:green}Uncommon{} {C:attention}Jokers{},",
					"including an {C:joy_xyz}Xyz{}"
				}
			},
			j_joy_spright_gigantic = {
				name = "{C:joy_xyz}Gigantic Spright",
				text = {
					"{C:joy_xyz}Detach{} {C:attention}1{}: Create",
					"{C:attention}#1#{} {C:green}Uncommon{} {C:attention}Joker{}",
					"{C:inactive}(Must have room){}",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:green}Uncommon{} {C:attention}Jokers{}",
					"({C:joy_link}Links{} allowed)"
				}
			},
			--#endregion
			--#region Mekk-Knight
			j_joy_mekk_avram = {
				name = "{C:joy_normal}Mekk-Knight Avram",
				text = {
					"{E:1}\"Check THIS out!\"{}",
				},
			},
			j_joy_mekk_red = {
				name = "{C:joy_effect}Mekk-Knight Red Moon",
				text = {
					"Scored card in this {C:attention}column{}",
					"gives {C:mult}+#1#{} Mult times its rank",
					"{C:inactive}(Currently in column{} {C:attention}#2#{}{C:inactive}){}",
				},
			},
			j_joy_mekk_orange = {
				name = "{C:joy_effect}Mekk-Knight Orange Sunset",
				text = {
					"Played card in this {C:attention}column{}",
					"counts for scoring",
					"{C:inactive}(Currently in column{} {C:attention}#1#{}{C:inactive}){}",
				},
			},
			j_joy_mekk_yellow = {
				name = "{C:joy_effect}Mekk-Knight Yellow Star",
				text = {
					"Scored card in this {C:attention}column{}",
					"gives {C:money}+$#1#{} times its rank",
					"{C:inactive}(Currently in column{} {C:attention}#2#{}{C:inactive}){}",
				},
			},
			j_joy_mekk_green = {
				name = "{C:joy_effect}Mekk-Knight Green Horizon",
				text = {
					"Scored card in this {C:attention}column{}",
					"has a chance {C:green}1 in <rank>{} to",
					"retrigger that many times",
					"{C:inactive}(Currently in column{} {C:attention}#1#{}{C:inactive}){}",
				},
			},
			j_joy_mekk_blue = {
				name = "{C:joy_effect}Mekk-Knight Blue Sky",
				text = {
					"Scored card in this {C:attention}column{}",
					"gives {C:chips}+#1#{} Chips times its rank",
					"{C:inactive}(Currently in column{} {C:attention}#2#{}{C:inactive}){}",
				},
			},
			j_joy_mekk_indigo = {
				name = "{C:joy_effect}Mekk-Knight Indigo Eclipse",
				text = {
					"Gets ability based on the {C:attention}column{}",
					"{V:1}1: All scored cards retrigger once{}",
					"{V:2}2:{} {C:chips}+#1#{} {V:2}Chips{}",
					"{V:3}3:{} {C:mult}+#2#{} {V:3}Mult{}",
					"{V:4}4:{} {X:mult,C:white}X#3#{} {V:4}Mult{}",
					"{V:5}5+:{} {C:money}+$#4#{} {V:5}at end of round{}",
				},
			},
			j_joy_mekk_purple = {
				name = "{C:joy_effect}Mekk-Knight Purple Nightfall",
				text = {
					"This card {C:attention}banishes{} until end of {C:attention}Ante{}",
					"when {C:attention}Blind{} is selected to create {C:attention}#1#{}",
					"{C:joy_normal}Main Deck \"Mekk-Knight\"{}",
					"{C:inactive}(Must have room){}",
				},
			},
			j_joy_mekk_morningstar = {
				name = "{C:joy_link}Mekk-Knight of the Morning Star",
				text = {
					"Scored card in adjacent {C:attention}columns{}",
					"give {X:mult,C:white}X#1#{} Mult if there's a",
					"{C:joy_normal}\"Mekk-Knight\"{} in that {C:attention}column{}",
					"{C:inactive}(Currently in columns{} {C:attention}#2#{} {C:inactive}and{} {C:attention}#3#{}{C:inactive}){}",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:attention}Jokers{}",
				}
			},
			j_joy_mekk_spectrum = {
				name = "{C:joy_link}Mekk-Knight Spectrum Supreme",
				text = {
					"{C:joy_normal}\"Mekk-Knight\"{} abilities apply to",
					"all played cards",
					" ",
					"Once per round, sell 1 {C:joy_normal}\"Mekk-Knight\"{}",
					"to create {C:attention}#1#{} {C:joy_normal}Main Deck \"Mekk-Knight\"{}",
					"{C:inactive}(Must have room){}",
				},
				joy_summon_conditions = {
					"{C:attention}3{} {C:joy_normal}\"Mekk-Knight\"{}",
				}
			},
			j_joy_mekkcrus_avramax = {
				name = "{C:joy_link}Mekk-Knight Crusadia Avramax",
				text = {
					"Immediately wins every {C:attention}Blind{}",
					" ",
					"Destroys itself after a number of {C:attention}Blinds{} is defeated",
					"equal to the {C:attention}materials{} used for its summon {C:inactive}(#1#/#2#){}",
				},
				joy_summon_conditions = {
					"{C:attention}2+{} {C:joy_spell}Extra Deck{} summoned {C:attention}Jokers{}",
				}
			},
			j_joy_mekkleg_scars = {
				name = "{C:joy_spell}World Legacy Scars",
				text = {
					"Each {C:joy_normal}\"Mekk-Knight\"{} gives {C:mult}+#1#{} Mult",
					" ",
					"During a {C:attention}Blind{}, you can {C:attention}tribute #2#{}",
					"{C:joy_normal}\"Mekk-Knight\"{} to gain {C:blue}+#3#{} Hand",
					" ",
					"Sell this card when there are #4# {C:joy_normal}\"Mekk-Knight\"{} in the {C:attention}GY",
					"with different names to win the current {C:attention}Blind{}"
				}
			},
			--#endregion
			--#region Generaider
			j_joy_token_generaider = {
				name = "{C:joy_token}Generaider Token",
				text = {
					"This card can be used as any {C:joy_token}Token{}",
				},
			},
			j_joy_generaider_loptr = {
				name = "{C:joy_effect}Loptr, Shadow of the Generaider Bosses",
				text = {
					"This card is destroyed when a {C:attention}Boss Blind{}",
					"is defeated to create {C:joy_spell}\"Generaider Boss Stage\"{}",
					"{C:inactive}(Must have room){}",
				},
			},
			j_joy_generaider_vala = {
				name = "{C:joy_effect}Vala, Seidhr of the Generaider Bosses",
				text = {
					"This card is destroyed when a {C:attention}Boss Blind{} is defeated to",
					"{C:attention}revive #1#{} {C:red}Rare{} {C:joy_normal}\"Generaider\"{}",
				},
			},
			j_joy_generaider_harr = {
				name = "{C:joy_effect}Harr, Generaider Boss of Storms",
				text = {
					"You can {C:attention}tribute #1#{} {C:joy_normal}\"Generaider\"{}",
					"and/or {C:joy_normal}Spellcaster{} {C:attention}Jokers{}",
					"to disable the current {C:attention}Boss Blind{}",
				},
			},
			j_joy_generaider_nidhogg = {
				name = "{C:joy_effect}Nidhogg, Generaider Boss of Ice",
				text = {
					"You can {C:attention}tribute #1#{} {C:joy_normal}\"Generaider\"{}",
					"and/or {C:joy_normal}Wyrm{} {C:attention}Jokers{}",
					"to retrigger each scored card this round",
				},
			},
			j_joy_generaider_frodi = {
				name = "{C:joy_effect}Frodi, Generaider Boss of Swords",
				text = {
					"You can {C:attention}tribute{} any number of {C:joy_normal}\"Generaider\"{}",
					"and/or {C:joy_normal}Warrior{} {C:attention}Jokers{}",
					"to gain that much hand size this round",
				},
			},
			j_joy_generaider_utgarda = {
				name = "{C:joy_effect}Utgarda, Generaider Boss of Delusion",
				text = {
					"You can {C:attention}tribute #1#{} {C:joy_normal}\"Generaider\"{}",
					"and/or {C:joy_normal}Rock{} {C:attention}Joker{}",
					"to {C:attention}banish{} a card in your consumable area",
					"until {C:attention}Blind{} is selected",
				},
			},
			j_joy_generaider_mardel = {
				name = "{C:joy_effect}Mardel, Generaider Boss of Light",
				text = {
					"You can {C:attention}tribute #1#{} {C:joy_normal}\"Generaider\"{}",
					"and/or {C:joy_normal}Plant{} {C:attention}Joker{} to create {C:attention}#2#{}",
					"{C:green}Uncommon{} {C:joy_normal}\"Generaider\"{}",
					"{C:inactive}(Must have room){}",
				},
			},
			j_joy_generaider_dovelgus = {
				name = "{C:joy_effect}Dovelgus, Generaider Boss of Iron",
				text = {
					"You can {C:attention}tribute #1#{} {C:joy_normal}\"Generaider\"{}",
					"and/or {C:joy_normal}Machine{} {C:attention}Jokers{}",
					"to make each {C:joy_normal}\"Generaider\"{} and {C:joy_normal}Machine{}",
					"give {X:mult,C:white}X#2#{} Mult this round",
				},
			},
			j_joy_generaider_naglfar = {
				name = "{C:joy_effect}Naglfar, Generaider Boss of Fire",
				text = {
					"You can {C:attention}tribute #1#{} {C:joy_normal}\"Generaider\"{}",
					"and/or {C:joy_normal}Beast-Warrior{} {C:attention}Jokers{}",
					"to gain {C:blue}+#2#{} Hand and {C:red}+#3#{} Discard this {C:attention}Blind{}",
				},
			},
			j_joy_generaider_hela = {
				name = "{C:joy_effect}Hela, Generaider Boss of Doom",
				text = {
					"You can {C:attention}tribute #1#{} {C:joy_normal}\"Generaider\"{}",
					"and/or {C:joy_normal}Zombie{} {C:attention}Jokers{} to {C:attention}revive #2#{}",
					"{C:red}Rare{} {C:joy_normal}\"Generaider\"{} {C:attention}Joker{} as {C:dark_edition}Negative{}",
				},
			},
			j_joy_generaider_jormungandr = {
				name = "{C:joy_xyz}Jormungandr, Generaider Boss of Eternity",
				text = {
					"{C:mult}+#1#{} Mult for each {C:joy_xyz}Xyz material{}",
					"{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult){}",
					" ",
					"{C:joy_xyz}Detach{} {C:attention}#3#{}: Permanently",
					"gain {C:attention}+#4#{} hand size",
				},
				joy_summon_conditions = {
					"{C:attention}2+{} {C:red}Rare{} {C:attention}Jokers{}",
				}
			},
			j_joy_generaider_laevatein = {
				name = "{C:joy_xyz}Laevatein, Generaider Boss of Shadows",
				text = {
					"{C:joy_xyz}Detach{} {C:attention}#1#{}: Destroy all other {C:attention}Jokers{} and",
					"create a {C:joy_xyz}\"Jormungandr, Generaider Boss of Eternity\"{}",
					"attaching all cards in the {C:attention}GY{} to it as {C:joy_xyz}Xyz materials{}",
				},
				joy_summon_conditions = {
					"{C:attention}5{} {C:red}Rare{} {C:attention}Jokers{}",
				}
			},
			j_joy_generaider_boss_stage = {
				name = "{C:joy_spell}Generaider Boss Stage",
				text = {
					"Creates as many {C:joy_token}\"Generaider Tokens\"{}",
					"as possible when {C:attention}Blind{} is selected",
					" ",
					"Once per round, you can {C:attention}tribute #1#{}",
					"{C:joy_token}\"Generaider Tokens\"{} to create {C:attention}#2#{}",
					"not owned {C:red}Rare{} {C:joy_normal}\"Generaider\"{}",
					"{C:inactive}(Must have room){}",
				},
			},
			--#endregion
			--#region Ghoti
			j_joy_fish_keaf = {
				name = "{C:joy_effect}Keaf, Murk of the Ghoti",
				text = {
					"This card {C:attention}banishes{} at the end of round",
					"until {C:attention}Blind{} is selected and",
					"{C:attention}revives #1#{} {C:joy_spell}Extra Deck{} {C:joy_normal}\"Ghoti\"{}",
				},
			},
			j_joy_fish_paces = {
				name = "{C:joy_effect}Paces, Light of the Ghoti",
				text = {
					"{C:chips}+#1#{} Chips",
					" ",
					"This card {C:attention}banishes{} at the end of round",
					"until {C:attention}Blind{} is selected",
				},
			},
			j_joy_fish_shif = {
				name = "{C:joy_effect}Shif, Fairy of the Ghoti",
				text = {
					"{C:mult}+#1#{} Mult",
					" ",
					"This card {C:attention}banishes{} at the end of round",
					"until {C:attention}Blind{} is selected",
				},
			},
			j_joy_fish_zep = {
				name = "{C:joy_effect}Zep, Ruby of the Ghoti",
				text = {
					"This card {C:attention}banishes{} at the end of round",
					"until {C:attention}Blind{} is selected and",
					"{C:attention}revives #1#{} {C:joy_normal}Main Deck{} {C:joy_normal}\"Ghoti\"{}",
				},
			},
			j_joy_fish_ixeep = {
				name = "{C:joy_effect}Ixeep, Omen of the Ghoti",
				text = {
					"This card {C:attention}banishes{} at the end of round",
					"until {C:attention}Boss Blind{} is selected and",
					"creates {C:attention}#1#{} {C:joy_normal}Main Deck{} {C:joy_normal}\"Ghoti\"{}",
					"{C:inactive}(Must have room){}",
				},
			},
			j_joy_fish_eanoc = {
				name = "{C:joy_effect}Eanoc, Sentry of the Ghoti",
				text = {
					"This card {C:attention}banishes{} at the end of round",
					"until {C:attention}Blind{} is selected",
					" ",
					"Adds {C:attention}#1#{} {C:joy_normal}\"Ghoti\"{}",
					"to the {C:joy_spell}Extra Deck{} after returning from",
					"{C:attention}banishment #2#{} times",
					"{C:inactive}(Must have room) (#3#/#2#){}",
				},
			},
			j_joy_fish_psiics = {
				name = "{C:joy_effect}Psiics, Moonlight of the Ghoti",
				text = {
					"This card {C:attention}banishes{} at the end of round",
					"until {C:attention}Boss Blind{} is selected and revives {C:attention}#1#{}",
					"{C:joy_synchro}Tuner{} {C:attention}Joker{} as {C:dark_edition}Negative{}",
				},
			},
			j_joy_fish_snopios = {
				name = "{C:joy_effect}Snopios, Shade of the Ghoti",
				text = {
					"This card and #1# card in your consumable",
					"area {C:attention}banish{} at the end of round",
					"until {C:attention}Blind{} is selected",
					" ",
					"Creates {C:joy_spell}\"The Most Distant, Deepest Depths\"{}",
					"after returning from {C:attention}banishment #2#{} times",
					"{C:inactive}(Must have room) (#3#/#2#){}",
				},
			},
			j_joy_fish_arionpos = {
				name = "{C:joy_synchro}Arionpos, Serpent of the Ghoti",
				text = {
					"{C:chips}+#1#{} Chips for each card",
					"{C:attention}banished{} this run",
					"{C:inactive}(Currently{} {C:chips}+#2#{} {C:inactive}Chips){}",
					" ",
					"This card {C:attention}banishes{} at the end of round",
					"until {C:attention}Blind{} is selected and",
					"adds {C:attention}#3#{} {C:joy_normal}\"Ghoti\"{} to the {C:joy_spell}Extra Deck{}",
					"{C:inactive}(Must have room){}",
				},
				joy_summon_conditions = {
					"{C:attention}1{} {C:joy_normal}Fish{} {C:joy_synchro}Tuner{} +",
					"{C:attention}1{} non-{C:joy_synchro}Tuner{}",
				}
			},
			j_joy_fish_askaan = {
				name = "{C:joy_synchro}Askaan, the Bicorned Ghoti",
				text = {
					"{C:mult}+#1#{} Mult for each card",
					"{C:attention}banished{} this run",
					"{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult){}",
					" ",
					"This card and a non-{C:joy_normal}\"Ghoti\"{} {C:attention}Joker{}",
					"{C:attention}banish{} at the end of round",
					"until {C:attention}Blind{} is selected",
				},
				joy_summon_conditions = {
					"{C:attention}1{} {C:joy_synchro}Tuner{} +",
					"{C:attention}1{} {C:red}Rare{} non-{C:joy_synchro}Tuner{}",
				}
			},
			j_joy_fish_guoglim = {
				name = "{C:joy_synchro}Guoglim, Spear of the Ghoti",
				text = {
					"Gains {X:mult,C:white}X#1#{} Mult for each card",
					"{C:attention}banished{} this run",
					"{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
					" ",
					"{C:attention}Revives{} as many different {C:joy_normal}Fish{}",
					"{C:attention}Jokers{} as possible when summoned",
					" ",
					"This card {C:attention}banishes{} at the end of round",
					"until {C:attention}Blind{} is selected",
				},
				joy_summon_conditions = {
					"{C:attention}1{} {C:joy_synchro}Tuner{} +",
					"{C:attention}1{} {C:red}Rare{} non-{C:joy_synchro}Tuner{}",
				}
			},
			j_joy_fish_deepbeyond = {
				name = "{C:joy_synchro}Ghoti of the Deep Beyond",
				text = {
					"This card and all other non-{C:joy_normal}\"Ghoti\"{} {C:attention}Jokers{}",
					"{C:attention}banish{} at the end of round",
					"until {C:attention}Blind{} is selected",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:joy_normal}Fish{} {C:joy_synchro}Tuners{} +",
					"{C:attention}1{} {C:red}Rare{} non-{C:joy_synchro}Tuner{}",
				}
			},
			j_joy_fish_depths = {
				name = "{C:joy_spell}The Most Distant, Deepest Depths",
				text = {
					"{C:money}+$#1#{} each time a card",
					"is {C:attention}banished",
				}
			},
			--#endregion
			--#region PSY-Frame
			j_joy_psy_driver = {
				name = "{C:joy_normal}PSY-Frame Driver",
				text = {
					"{E:1}A Psychic soldier that rides into battle against the Security{}",
					"{E:1}Forces on currents of lightning, using an autonomic amplifier{}",
					"{E:1}called \"PSY-Frame\"{}",
				},
			},
			j_joy_psy_alpha = {
				name = "{C:joy_effect}PSY-Framegear Alpha",
				text = {
					"Create {C:attention}#1#{} {C:joy_normal}\"PSY-Frame Driver\"",
					"when obtained, if not owned",
					"{C:inactive}(Must have room){}",
					" ",
					"{C:attention}Banish a{} {C:joy_normal}\"PSY-Frame Driver\"",
					"when {C:attention}Blind{} is selected until end of round to",
					"make all cards held in hand give {X:mult,C:white}X#2#{} Mult this round",
				},
			},
			j_joy_psy_beta = {
				name = "{C:joy_effect}PSY-Framegear Beta",
				text = {
					"Create {C:attention}#1#{} {C:joy_normal}\"PSY-Frame Driver\"",
					"when obtained, if not owned",
					"{C:inactive}(Must have room){}",
					" ",
					"{C:attention}Banish a{} {C:joy_normal}\"PSY-Frame Driver\"",
					"when {C:attention}Blind{} is selected until end of round to",
					"make all scored cards give {X:mult,C:white}X#2#{} Mult this round",
				},
			},
			j_joy_psy_gamma = {
				name = "{C:joy_effect}PSY-Framegear Gamma",
				text = {
					"Create {C:attention}#1#{} {C:joy_normal}\"PSY-Frame Driver\"",
					"when obtained, if not owned",
					"{C:inactive}(Must have room){}",
					" ",
					"{C:attention}Banish a{} {C:joy_normal}\"PSY-Frame Driver\"",
					"when {C:attention}Blind{} is selected until end of round to",
					"make all {C:attention}Jokers{} each give {X:mult,C:white}X#2#{} Mult this round",
				},
			},
			j_joy_psy_delta = {
				name = "{C:joy_effect}PSY-Framegear Delta",
				text = {
					"Create {C:attention}#1#{} {C:joy_normal}\"PSY-Frame Driver\"",
					"when obtained, if not owned",
					"{C:inactive}(Must have room){}",
					" ",
					"{C:attention}Banish a{} {C:joy_normal}\"PSY-Frame Driver\"",
					"when {C:attention}Blind{} is selected until end of round to",
					"make all {C:tarot}Tarot{} cards in your consumable area",
					"each give {X:mult,C:white}X#2#{} Mult this round",
				},
			},
			j_joy_psy_epsilon = {
				name = "{C:joy_effect}PSY-Framegear Epsilon",
				text = {
					"Create {C:attention}#1#{} {C:joy_normal}\"PSY-Frame Driver\"",
					"when obtained, if not owned",
					"{C:inactive}(Must have room){}",
					" ",
					"{C:attention}Banish a{} {C:joy_normal}\"PSY-Frame Driver\"",
					"when {C:attention}Blind{} is selected until end of round to",
					"make all {C:planet}Planet{} cards in your consumable area",
					"each give {X:mult,C:white}X#2#{} Mult this round",
				},
			},
			j_joy_psy_multithreader = {
				name = "{C:joy_effect}PSY-Frame Multi-Threader",
				text = {
					"This card is treated as {C:joy_normal}\"PSY-Frame Driver\"",
					"for {C:joy_normal}\"PSY-Frame\"{} abilities",
					" ",
					"Create {C:attention}#1#{} {C:joy_normal}Main Deck \"PSY-Frame\"{}",
					"{C:joy_effect}Effect{} {C:attention}Joker{} when this card",
					"returns from {C:attention}banishment{}",
					"{C:inactive}(Must have room){}",
				},
			},
			j_joy_psy_zeta = {
				name = "{C:joy_synchro}PSY-Framelord Zeta",
				text = {
					"This card and #1# cards in your consumable",
					"area {C:attention}banish{} at the end of round",
					"until {C:attention}Blind{} is selected",
				},
				joy_summon_conditions = {
					"{C:attention}1{} {C:joy_synchro}Tuner{} +",
					"{C:attention}1{} {C:blue}Common{} non-{C:joy_synchro}Tuner{}",
				}
			},
			j_joy_psy_omega = {
				name = "{C:joy_synchro}PSY-Framelord Omega",
				text = {
					"This card and another {C:attention}Joker{}",
					"{C:attention}banish{} at the end of round",
					"until {C:attention}Blind{} is selected",
				},
				joy_summon_conditions = {
					"{C:attention}1{} {C:joy_synchro}Tuner{} +",
					"{C:attention}1{} {C:blue}Common{} non-{C:joy_synchro}Tuner{}",
				}
			},
			j_joy_psy_lambda = {
				name = "{C:joy_synchro}PSY-Framelord Lambda",
				text = {
					"{C:joy_normal}\"PSY-Frame\"{} abilities are active",
					"without {C:attention}banishing{} {C:joy_normal}\"PSY-Frame Driver\"",
					" ",
					"Add {C:attention}#1#{} {C:joy_normal}\"PSY-Frame\"",
					"to the {C:joy_spell}Extra Deck{} when a {C:joy_normal}Psychic{}",
					"{C:attention}Joker{} is {C:attention}banished{}",
					"{C:inactive}(Must have room){}",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:attention}Jokers{}, except {C:joy_token}Tokens{}",
				}
			},
			j_joy_psy_circuit = {
				name = "{C:joy_spell}PSY-Frame Circuit",
				text = {
					"{C:money}+$#1#{} each time a {C:joy_synchro}Synchro{} is summoned",
					" ",
					"{C:joy_normal}Psychic{} {C:joy_synchro}Synchros{}",
					"become {C:dark_edition}Negative{} when summoned"
				}
			},
			--#endregion
			--#region Runick
			j_joy_runick_hugin = {
				name = "{C:joy_fusion}Hugin the Runick Wings",
				text = {
					"{C:attention}+#1#{} consumable slot",
					" ",
					"Create {C:attention}#1#{} {C:joy_spell}\"Runick Fountain\"",
					"when summoned",
					"{C:inactive}(Must have room){}",
				},
				joy_summon_conditions = {
					"{C:attention}3{} {C:tarot}Tarot{} cards",
				}
			},
			j_joy_runick_munin = {
				name = "{C:joy_fusion}Munin the Runick Wings",
				text = {
					"{C:attention}+#1#{} consumable slot",
					" ",
					"Gains {C:chips}+#2#{} Chips for each {C:tarot}Tarot{}",
					"used during a {C:attention}Blind{}",
					"{C:inactive}(Currently{} {C:chips}+#3#{} {C:inactive}Chips){}",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:tarot}Tarot{} cards",
				}
			},
			j_joy_runick_geri = {
				name = "{C:joy_fusion}Geri the Runick Fangs",
				text = {
					"Create {C:attention}#1#{} {C:joy_spell}\"Runick Fountain\"",
					"when summoned if there's any in the {C:attention}GY{}",
					"{C:inactive}(Must have room){}",
					" ",
					"Sell this card to create up to",
					"{C:attention}#2#{} {C:tarot}Tarot{} cards",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:tarot}Tarot{} cards",
				}
			},
			j_joy_runick_freki = {
				name = "{C:joy_fusion}Freki the Runick Fangs",
				text = {
					"Adds {C:attention}#1#{} random {C:attention}playing cards{}",
					"when a {C:tarot}Tarot{} card is used during a {C:attention}Blind{}",
					" ",
					"Sell this card to create up to",
					"{C:attention}#2#{} {C:tarot}Tarot{} cards",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:tarot}Tarot{} cards",
				}
			},
			j_joy_runick_sleipnir = {
				name = "{C:joy_fusion}Sleipnir the Runick Mane",
				text = {
					"This card {C:attention}banishes{} at the end of round",
					"until {C:attention}Blind{} is selected",
					" ",
					"Create {C:attention}#1#{} {C:dark_edition}Negative{} {C:tarot}Tarot{} cards",
					"when it returns from {C:attention}banishment{}",
				},
				joy_summon_conditions = {
					"{C:attention}4{} {C:tarot}Tarot{} cards",
				}
			},
			j_joy_runick_fountain = {
				name = "{C:joy_spell}Runick Fountain",
				text = {
					"Creates as many {C:tarot}Tarot{} cards used during",
					"this {C:attention}Blind{} as possible at end of round",
					"{C:inactive}(Removes Editions){}",
					" ",
					"Destroys {C:attention}#1#{} random {C:attention}playing cards{}",
					"in your deck when {C:attention}Blind{} is selected",
				},
			},
			--#endregion
			--#region Burning Abyss
			j_joy_ba_alich = {
				name = "{C:joy_effect}Alich, Malebranche of the Burning Abyss",
				text = {
					"Lower {C:attention}Blind{}'s requirement by {C:red}#1#%{}",
					"when {C:attention}Blind{} is selected",
					" ",
					"Destroys itself if you own a non-{C:joy_normal}Fiend{}",
					"{C:joy_normal}Monster{} {C:attention}Joker{} when {C:attention}Blind{} is selected"
				}
			},
			j_joy_ba_barbar = {
				name = "{C:joy_effect}Barbar, Malebranche of the Burning Abyss",
				text = {
					"{C:mult}+#1#{} Mult",
					"{C:mult}+#2#{} Mult for every {C:joy_normal}Fiend{} {C:attention}Joker{} in the {C:attention}GY{}",
					"{C:inactive}(Currently{} {C:mult}+#3#{} {C:inactive}Mult total){}",
					" ",
					"Destroys itself if you own a non-{C:joy_normal}Fiend{}",
					"{C:joy_normal}Monster{} {C:attention}Joker{} when {C:attention}Blind{} is selected"
				}
			},
			j_joy_ba_cagna = {
				name = "{C:joy_effect}Cagna, Malebranche of the Burning Abyss",
				text = {
					"{C:chips}+#1#{} Chips",
					"Send {C:attention}#2#{} {C:joy_normal}Fiend{} {C:attention}Jokers{} to the {C:attention}GY{}",
					"when {C:attention}Blind{} is selected",
					" ",
					"Destroys itself if you own a non-{C:joy_normal}Fiend{}",
					"{C:joy_normal}Monster{} {C:attention}Joker{} when {C:attention}Blind{} is selected"
				}
			},
			j_joy_ba_calcab = {
				name = "{C:joy_effect}Calcab, Malebranche of the Burning Abyss",
				text = {
					"{C:attention}+#1#{} hand size",
					" ",
					"Destroys itself if you own a non-{C:joy_normal}Fiend{}",
					"{C:joy_normal}Monster{} {C:attention}Joker{} when {C:attention}Blind{} is selected"
				}
			},
			j_joy_ba_cir = {
				name = "{C:joy_effect}Cir, Malebranche of the Burning Abyss",
				text = {
					"{X:mult,C:white}X#1#{} Mult",
					"{C:attention}Revives{} {C:attention}#2#{} {C:joy_normal}\"Burning Abyss\"{}",
					"when {C:attention}Blind{} is selected",
					" ",
					"Destroys itself if you own a non-{C:joy_normal}Fiend{}",
					"{C:joy_normal}Monster{} {C:attention}Joker{} when {C:attention}Blind{} is selected"
				}
			},
			j_joy_ba_draghig = {
				name = "{C:joy_effect}Draghig, Malebranche of the Burning Abyss",
				text = {
					"{C:joy_normal}Fiends{} each give {C:chips}+#1#{} Chips",
					" ",
					"Creates {C:attention}#2#{} non-{C:joy_spell}Special{} {C:joy_normal}\"Burning Abyss\"{}",
					"when obtained",
					"{C:inactive}(Must have room){}",
					" ",
					"Destroys itself if you own a non-{C:joy_normal}Fiend{}",
					"{C:joy_normal}Monster{} {C:attention}Joker{} when {C:attention}Blind{} is selected"
				}
			},
			j_joy_ba_farfa = {
				name = "{C:joy_effect}Farfa, Malebranche of the Burning Abyss",
				text = {
					"{C:attention}Banish{} {C:attention}#1#{} other Joker when obtained",
					"until end of round",
					" ",
					"Destroys itself if you own a non-{C:joy_normal}Fiend{}",
					"{C:joy_normal}Monster{} {C:attention}Joker{} when {C:attention}Blind{} is selected"
				}
			},
			j_joy_ba_graff = {
				name = "{C:joy_effect}Graff, Malebranche of the Burning Abyss",
				text = {
					"{C:joy_normal}Fiends{} each give {C:mult}+#1#{} Mult",
					" ",
					"Creates {C:attention}#2#{} non-{C:joy_spell}Special{} {C:joy_normal}\"Burning Abyss\"{}",
					"when obtained",
					"{C:inactive}(Must have room){}",
					" ",
					"Destroys itself if you own a non-{C:joy_normal}Fiend{}",
					"{C:joy_normal}Monster{} {C:attention}Joker{} when {C:attention}Blind{} is selected"
				}
			},
			j_joy_ba_libic = {
				name = "{C:joy_effect}Libic, Malebranche of the Burning Abyss",
				text = {
					"Destroys itself if you own a non-{C:joy_normal}Fiend{}",
					"{C:joy_normal}Monster{} {C:attention}Joker{} when {C:attention}Blind{} is selected",
					"and {C:attention}revives{} {C:attention}#1#{} {C:joy_normal}Fiend{} {C:attention}Joker{}",
					"{s:0.9,C:inactive}(This also triggers on sell)"
				}
			},
			j_joy_ba_rubic = {
				name = "{C:joy_effect}Rubic, Malebranche of the Burning Abyss",
				text = {
					"Destroys itself if you own a non-{C:joy_normal}Fiend{}",
					"{C:joy_normal}Monster{} {C:attention}Joker{} when {C:attention}Blind{} is selected",
					"and adds {C:attention}#1#{} {C:joy_normal}\"Burning Abyss\"{} to the {C:joy_spell}Extra Deck{}",
					"{s:0.9,C:inactive}(This also triggers on sell)"
				}
			},
			j_joy_ba_scarm = {
				name = "{C:joy_effect}Scarm, Malebranche of the Burning Abyss",
				text = {
					"Destroys itself if you own a non-{C:joy_normal}Fiend{}",
					"{C:joy_normal}Monster{} {C:attention}Joker{} when {C:attention}Blind{} is selected",
					"and creates {C:attention}#1#{} {C:joy_normal}Main Deck Fiends{}",
					"{C:inactive}(Must have room){}",
					"{s:0.9,C:inactive}(This also triggers on sell)"
				}
			},
			j_joy_ba_malacoda = {
				name = "{C:joy_ritual}Malacoda, Netherlord of the Burning Abyss",
				text = {
					"Gains {X:mult,C:white}X#1#{} for each {C:joy_normal}Fiend{} in the {C:attention}GY{}",
					"{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
					" ",
					"{C:joy_normal}\"Burning Abyss\"{} don't get destroyed by their own effects"
				},
				joy_summon_conditions = {
					"{C:attention}2 Jokers{}, including a {C:joy_normal}Fiend{}",
				}
			},
			j_joy_ba_cherubini = {
				name = "{C:joy_link}Cherubini, Ebon Angel of the Burning Abyss",
				text = {
					"Sends {C:attention}#1#{} {C:joy_normal}\"Burning Abyss\"{} to the {C:attention}GY{}",
					"when {C:attention}Blind{} is selected",
					" ",
					"{C:joy_normal}\"Burning Abyss\"{} don't get destroyed by their own effects"
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:joy_normal}Fiends{}",
				}
			},
			j_joy_ba_dante = {
				name = "{C:joy_xyz}Dante, Traveler of the Burning Abyss",
				text = {
					"{C:mult}+#1#{} Mult for each {C:attention}Joker{} in the {C:attention}GY{}",
					"{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult){}",
					" ",
					"{C:joy_xyz}Detach{} {C:attention}#3#{}: Send {C:attention}#4#{}",
					"random cards to the {C:attention}GY{}",
					" ",
					"{C:joy_normal}\"Burning Abyss\"{} don't get destroyed by their own effects"
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:blue}Common{} {C:attention}Jokers{}",
				}
			},
			j_joy_ba_pilgrim = {
				name = "{C:joy_fusion}Dante, Pilgrim of the Burning Abyss",
				text = {
					"{C:blue}+#1#{} Hands",
					"{C:red}+#2#{} Discards",
					" ",
					"{C:joy_normal}\"Burning Abyss\"{} don't get destroyed by their own effects"
				},
				joy_summon_conditions = {
					"{C:attention}3{} {C:joy_normal}\"Burning Abyss\"{}",
					"with different names",
				}
			},
			j_joy_ba_virgil = {
				name = "{C:joy_synchro}Virgil, Rock Star of the Burning Abyss",
				text = {
					"Permanently gain {C:attention}+#1#{} hand size when obtained",
					" ",
					"{C:joy_normal}\"Burning Abyss\"{} don't get destroyed by their own effects"
				},
				joy_summon_conditions = {
					"{C:attention}1{} {C:joy_synchro}Tuner{} +",
					"{C:attention}1{} {C:joy_normal}Fiend{} non-{C:joy_synchro}Tuner{}",
				}
			},
			j_joy_ba_beatrice = {
				name = "{C:joy_xyz}Beatrice, Lady of the Eternal",
				text = {
					"Gains {X:mult,C:white}X#1#{} for each {C:attention}Joker{} in the {C:attention}GY{}",
					"{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
					" ",
					"{C:joy_xyz}Detach{} {C:attention}#3#{}: {C:attention}Revive #4#{} {C:joy_normal}\"Burning Abyss\"{}",
					"(or any {C:attention}Joker{} if none)",
					" ",
					"Sell this summoned card to add",
					"{C:joy_xyz}\"Dante, Traveler of the Burning Abyss\"{}",
					"and {C:joy_fusion}\"Dante, Pilgrim of the Burning Abyss\"{}",
					"to the {C:joy_spell}Extra Deck{} {C:inactive}(Must have room){}",
					" ",
					"{C:joy_normal}\"Burning Abyss\"{} don't get destroyed by their own effects"
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:red}Rare{} {C:attention}Jokers{}",
					"or {C:attention}1{} {C:joy_normal}\"Dante\"{}",
					"{s:0.9,C:inactive}(If Xyz, transfer its materials)",
				}
			},
			--#endregion
			--#region Labrynth
			j_joy_lab_clock = {
				name = "{C:joy_effect}Labrynth Cooclock",
				text = {
					"You can {C:attention}tribute{} this card to",
					"{C:attention}flip #1#{} random card in hand",
					"face-down (and shuffle them) then {C:attention}revive #2#",
					"{C:blue}Common{} {C:joy_normal}\"Labrynth\"{} if possible"
				}
			},
			j_joy_lab_stovie = {
				name = "{C:joy_effect}Labrynth Stovie Torbie",
				text = {
					"You can {C:attention}tribute{} this and another {C:attention}Joker{} to",
					"{C:attention}flip #1#{} random cards in hand",
					"face-down (and shuffle them) then gain {C:money}+$#2#",
					"if you tributed a {C:joy_normal}Fiend"
				}
			},
			j_joy_lab_changdra = {
				name = "{C:joy_effect}Labrynth Chandraglier",
				text = {
					"You can {C:attention}tribute{} this and another {C:attention}Joker{} to",
					"{C:attention}flip #1#{} random cards in hand",
					"face-down (and shuffle them) then create {C:attention}#2#",
					"random Tags if you tributed a {C:joy_normal}Fiend"
				}
			},
			j_joy_lab_ariane = {
				name = "{C:joy_effect}Ariane the Labrynth Servant",
				text = {
					"{C:attention}+#1#{} hand size next {C:attention}Blind{} for each",
					"playing card {C:attention}flipped{} this round",
					" ",
					"Add an {C:green}Uncommon{} {C:joy_normal}\"Labrynth\"{} to the next shop",
					"if {C:attention}#2#{} or more cards are flipped this round"
				}
			},
			j_joy_lab_arianna = {
				name = "{C:joy_effect}Arianna the Labrynth Servant",
				text = {
					"{C:attention}+#1#{} hand size next {C:attention}Blind{} for each",
					"playing card {C:attention}flipped{} this round",
					" ",
					"Add a {C:blue}Common{} {C:joy_normal}\"Labrynth\"{} to the next shop",
					"if {C:attention}#2#{} or more cards are flipped this round"
				}
			},
			j_joy_lab_arias = {
				name = "{C:joy_effect}Arias the Labrynth Butler",
				text = {
					"Gains {C:chips}+#1#{} Chips for each",
					"playing card {C:attention}flipped{}",
					"{C:inactive}(Currently{} {C:chips}+#2# {C:inactive}Chips){}",
					" ",
					"Add a {C:red}Rare{} {C:joy_normal}\"Labrynth\"{} to the next shop",
					"if {C:attention}#3#{} or more cards are flipped this round",
					" ",
					"Free if you own a {C:joy_normal}\"Labrynth\"{}"
				}
			},
			j_joy_lab_archfiend = {
				name = "{C:joy_effect}Labrynth Archfiend",
				text = {
					"{C:mult}+#1#{} Mult for each",
					"{C:joy_normal}Fiend{} in the {C:attention}GY{}",
					"{C:inactive}(Currently{} {C:mult}+#2# {C:inactive}Mult){}",
					" ",
					"When a playing card is {C:attention}flipped{},",
					"{C:attention}flip{} a random card in hand face-down (and shuffle them)"

				}
			},
			j_joy_lab_lovely = {
				name = "{C:joy_effect}Lovely Labrynth of the Silver Castle",
				text = {
					"{C:green}#1# in #2#{} chances of drawing cards face-down",
					"Chances increase for each {C:joy_normal}Fiend{} owned",
					" ",
					"Gains {C:mult}+#3#{} Mult for each",
					"card {C:attention}flipped{} face-down",
					"{C:inactive}(Currently{} {C:mult}+#4# {C:inactive}Mult){}",
					" ",
					"Non-{C:joy_trap}Trap{} {C:joy_normal}Fiends{} can use their",
					"non-activated abilities while face-down",
					"{s:0.9,C:inactive}(Including this card)"
				}
			},
			j_joy_lab_lady = {
				name = "{C:joy_effect}Lady Labrynth of the Silver Castle",
				text = {
					"Each time a card is {C:attention}flipped{} each",
					"{C:joy_normal}\"Labrynth\"{} give {X:mult,C:white}X#1#{} more Mult",
					"{C:inactive}(Currently{} {X:mult,C:white}+#2#{} {C:inactive}Mult){}",
					" ",
					"Non-{C:joy_trap}Trap{} {C:joy_normal}Fiends{} can use their",
					"non-activated abilities while face-down",
					"{s:0.9,C:inactive}(Including this card)"
				}
			},
			j_joy_lab_labyrinth = {
				name = "{C:joy_spell}Labrynth Labyrinth",
				text = {
					"{C:money}+$#1#{} for each {C:attention}Joker flipped{}",
					" ",
					"{C:green}#2# in #3#{} chance to {C:attention}flip #4#",
					"random card in hand face-down when a playing card is {C:attention}flipped"
				}
			},
			--#endregion
			--#region Subterror
			j_joy_sub_fiendess = {
				name = "Subterror Fiendess",
				text = { "TBD" }
			},
			j_joy_sub_defender = {
				name = "Subterror Nemesis Defender",
				text = { "TBD" }
			},
			j_joy_sub_archer = {
				name = "Subterror Nemesis Archer",
				text = { "TBD" }
			},
			j_joy_sub_warrior = {
				name = "Subterror Nemesis Warrior",
				text = { "TBD" }
			},
			j_joy_sub_guru = {
				name = "Subterror Guru",
				text = { "TBD" }
			},
			j_joy_sub_stygo = {
				name = "Subterror Behemoth Stygokraken",
				text = { "TBD" }
			},
			j_joy_sub_drago = {
				name = "Subterror Behemoth Dragossuary",
				text = { "TBD" }
			},
			j_joy_sub_uma = {
				name = "Subterror Behemoth Umastryx",
				text = { "TBD" }
			},
			j_joy_sub_phos = {
				name = "Subterror Behemoth Phospheroglacier",
				text = { "TBD" }
			},
			j_joy_sub_volt = {
				name = "Subterror Behemoth Voltelluric",
				text = { "TBD" }
			},
			j_joy_sub_stala = {
				name = "Subterror Behemoth Stalagmo",
				text = { "TBD" }
			},
			j_joy_sub_speleo = {
				name = "Subterror Behemoth Speleogeist",
				text = { "TBD" }
			},
			j_joy_sub_ultra = {
				name = "Subterror Behemoth Ultramafus",
				text = { "TBD" }
			},
			j_joy_sub_befiendess = {
				name = "Subterror Behemoth Fiendess",
				text = { "TBD" }
			},
			j_joy_sub_city = {
				name = "The Hidden City",
				text = { "TBD" }
			},
			--#endregion
			--#region Eldlich
			j_joy_eld_eldlich = {
				name = "Eldlich the Golden Lord",
				text = { "TBD" }
			},
			j_joy_eld_conq = {
				name = "Conquistador of the Golden Land",
				text = { "TBD" }
			},
			j_joy_eld_guard = {
				name = "Guardian of the Golden Land",
				text = { "TBD" }
			},
			j_joy_eld_huaq = {
				name = "Huaquero of the Golden Land",
				text = { "TBD" }
			},
			j_joy_eld_exalted = {
				name = "Eldlixir of the Exalted Golden Land",
				text = { "TBD" }
			},
			j_joy_eld_mad = {
				name = "Eldlich the Mad Golden Lord",
				text = { "TBD" }
			},
			j_joy_eld_angel = {
				name = "Angelcaido of the Golden Land",
				text = { "TBD" }
			},
			--#endregion
			--#region @Ignister
			j_joy_ignis_achichi = {
				name = "Achichi @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_pikari = {
				name = "Pikari @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_hiyari = {
				name = "Hiyari @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_bururu = {
				name = "Bururu @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_doshin = {
				name = "Doshin @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_gatchiri = {
				name = "Gatchiri @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_gussari = {
				name = "Gussari @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_danmari = {
				name = "Danmari @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_doyon = {
				name = "Doyon @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_donyoribo = {
				name = "Donyoribo @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_backup = {
				name = "Backup @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_wizard = {
				name = "Wizard @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_kiruku = {
				name = "Kurikulink @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_leviathan = {
				name = "Water Leviathan @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_golem = {
				name = "Earth Golem @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_pegasus = {
				name = "Wind Pegasus @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_dragon = {
				name = "Light Dragon @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_phoenix = {
				name = "Fire Phoenix @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_accode = {
				name = "Accode Talker @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_infant = {
				name = "Dark Infant @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_templar = {
				name = "Dark Templar @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_arrival = {
				name = "The Arrival Cyberse @Ignister",
				text = { "TBD" }
			},
			j_joy_ignis_ailand = {
				name = "Ignister A.I.Land",
				text = { "TBD" }
			},
			--#endregion
			--#region Solfachord
			j_joy_solfa_cutia = {
				name = "DoSolfachord Cutia",
				text = { "TBD" }
			},
			j_joy_solfa_dreamia = {
				name = "ReSolfachord Dreamia",
				text = { "TBD" }
			},
			j_joy_solfa_eliteia = {
				name = "MiSolfachord Eliteia",
				text = { "TBD" }
			},
			j_joy_solfa_fancia = {
				name = "FaSolfachord Fancia",
				text = { "TBD" }
			},
			j_joy_solfa_gracia = {
				name = "SolSolfachord Gracia",
				text = { "TBD" }
			},
			j_joy_solfa_angelia = {
				name = "LaSolfachord Angelia",
				text = { "TBD" }
			},
			j_joy_solfa_beautia = {
				name = "TiSolfachord Beautia",
				text = { "TBD" }
			},
			j_joy_solfa_coolia = {
				name = "DoSolfachord Coolia",
				text = { "TBD" }
			},
			j_joy_solfa_musecia = {
				name = "GranSolfachord Musecia",
				text = { "TBD" }
			},
			j_joy_solfa_grancoolia = {
				name = "GranSolfachord Coolia",
				text = { "TBD" }
			},
			j_joy_solfa_harmonia = {
				name = "Solfachord Harmonia",
				text = { "TBD" }
			},
			--#endregion
			--#region Witchcrafter
			j_joy_witch_genni = {
				name = "Witchcrafter Genni",
				text = { "TBD" }
			},
			j_joy_witch_potterie = {
				name = "Witchcrafter Potterie",
				text = { "TBD" }
			},
			j_joy_witch_pittore = {
				name = "Witchcrafter Pittore",
				text = { "TBD" }
			},
			j_joy_witch_schmietta = {
				name = "Witchcrafter Schmietta",
				text = { "TBD" }
			},
			j_joy_witch_edel = {
				name = "Witchcrafter Edel",
				text = { "TBD" }
			},
			j_joy_witch_haine = {
				name = "Witchcrafter Haine",
				text = { "TBD" }
			},
			j_joy_witch_verre = {
				name = "Witchcrafter Madame Verre",
				text = { "TBD" }
			},
			j_joy_witch_aruru = {
				name = "Witchcrafter Golem Aruru",
				text = { "TBD" }
			},
			j_joy_witch_vicemadame = {
				name = "Witchcrafter Vice-Madame",
				text = { "TBD" }
			},
			--#endregion
			--#region Shaddoll
			j_joy_shaddoll_beast = {
				name = "Shaddoll Beast",
				text = { "TBD" }
			},
			j_joy_shaddoll_dragon = {
				name = "Shaddoll Dragon",
				text = { "TBD" }
			},
			j_joy_shaddoll_falco = {
				name = "Shaddoll Falco",
				text = { "TBD" }
			},
			j_joy_shaddoll_hedgehog = {
				name = "Shaddoll Hedgehog",
				text = { "TBD" }
			},
			j_joy_shaddoll_hound = {
				name = "Shaddoll Hound",
				text = { "TBD" }
			},
			j_joy_shaddoll_squamata = {
				name = "Shaddoll Squamata",
				text = { "TBD" }
			},
			j_joy_shaddoll_core = {
				name = "Shaddoll Core",
				text = { "TBD" }
			},
			j_joy_shaddoll_ariel = {
				name = "Naelshaddoll Ariel",
				text = { "TBD" }
			},
			j_joy_shaddoll_genius = {
				name = "Nehshaddoll Genius",
				text = { "TBD" }
			},
			j_joy_shaddoll_keios = {
				name = "Qadshaddoll Keios",
				text = { "TBD" }
			},
			j_joy_shaddoll_wendi = {
				name = "Reeshaddoll Wendi",
				text = { "TBD" }
			},
			j_joy_shaddoll_hollow = {
				name = "Helshaddoll Hollow",
				text = { "TBD" }
			},
			j_joy_shaddoll_anoya = {
				name = "El Shaddoll Anoyatyllis",
				text = { "TBD" }
			},
			j_joy_shaddoll_apka = {
				name = "El Shaddoll Apkallone",
				text = { "TBD" }
			},
			j_joy_shaddoll_winda = {
				name = "El Shaddoll Winda",
				text = { "TBD" }
			},
			j_joy_shaddoll_elconstruct = {
				name = "El Shaddoll Construct",
				text = { "TBD" }
			},
			j_joy_shaddoll_grysta = {
				name = "El Shaddoll Grysta",
				text = { "TBD" }
			},
			j_joy_shaddoll_shekh = {
				name = "El Shaddoll Shekhinaga",
				text = { "TBD" }
			},
			j_joy_shaddoll_wendigo = {
				name = "El Shaddoll Wendigo",
				text = { "TBD" }
			},
			j_joy_shaddoll_construct = {
				name = "Shaddoll Construct",
				text = { "TBD" }
			},
			j_joy_shaddoll_prison = {
				name = "Curse of the Shadow Prison",
				text = { "TBD" }
			},
			--#endregion
			--#region Paleozoic
			j_joy_paleo_canadia = {
				name = "Paleozoic Canadia",
				text = { "TBD" }
			},
			j_joy_paleo_dino = {
				name = "Paleozoic Dinomischus",
				text = { "TBD" }
			},
			j_joy_paleo_eldonia = {
				name = "Paleozoic Eldonia",
				text = { "TBD" }
			},
			j_joy_paleo_hallu = {
				name = "Paleozoic Hallucigenia",
				text = { "TBD" }
			},
			j_joy_paleo_lean = {
				name = "Paleozoic Leanchoilia",
				text = { "TBD" }
			},
			j_joy_paleo_marrella = {
				name = "Paleozoic Marrella",
				text = { "TBD" }
			},
			j_joy_paleo_oleno = {
				name = "Paleozoic Olenoides",
				text = { "TBD" }
			},
			j_joy_paleo_pikaia = {
				name = "Paleozoic Pikaia",
				text = { "TBD" }
			},
			j_joy_paleo_cambro = {
				name = "Paleozoic Cambroraster",
				text = { "TBD" }
			},
			j_joy_paleo_anomalo = {
				name = "Paleozoic Anomalocaris",
				text = { "TBD" }
			},
			j_joy_paleo_opa = {
				name = "Paleozoic Opabinia",
				text = { "TBD" }
			},
			--#endregion
			--#region Invoked
			j_joy_invoked_aleister = {
				name = "Aleister the Invoker",
				text = { "TBD" }
			},
			j_joy_invoked_madness = {
				name = "Aleister the Invoker of Madness",
				text = { "TBD" }
			},
			j_joy_invoked_caliga = {
				name = "Invoked Caliga",
				text = { "TBD" }
			},
			j_joy_invoked_raidjin = {
				name = "Invoked Raidjin",
				text = { "TBD" }
			},
			j_joy_invoked_cocytus = {
				name = "Invoked Cocytus",
				text = { "TBD" }
			},
			j_joy_invoked_purgatorio = {
				name = "Invoked Purgatrio",
				text = { "TBD" }
			},
			j_joy_invoked_mage = {
				name = "Invoked Magellanica",
				text = { "TBD" }
			},
			j_joy_invoked_augo = {
				name = "Invoked Augoeides",
				text = { "TBD" }
			},
			j_joy_invoked_mechaba = {
				name = "Invoked Mechaba",
				text = { "TBD" }
			},
			j_joy_invoked_elysium = {
				name = "Invoked Elysium",
				text = { "TBD" }
			},
			j_joy_invoked_meltdown = {
				name = "Magical Meltdown",
				text = { "TBD" }
			},
			--#endregion
			--#region Danger!
			j_joy_danger_jack = {
				name = "Danger!? Jackalope?",
				text = { "TBD" }
			},
			j_joy_danger_tsuch = {
				name = "Danger!? Tsuchinoko?",
				text = { "TBD" }
			},
			j_joy_danger_chup = {
				name = "Danger! Chupacabra!",
				text = { "TBD" }
			},
			j_joy_danger_moth = {
				name = "Danger! Mothman!",
				text = { "TBD" }
			},
			j_joy_danger_dog = {
				name = "Danger! Dogman!",
				text = { "TBD" }
			},
			j_joy_danger_ness = {
				name = "Danger! Nessie!",
				text = { "TBD" }
			},
			j_joy_danger_big = {
				name = "Danger! Bigfoot!",
				text = { "TBD" }
			},
			j_joy_danger_ogo = {
				name = "Danger! Ogopogo!",
				text = { "TBD" }
			},
			j_joy_danger_thunder = {
				name = "Danger! Thunderbird!",
				text = { "TBD" }
			},
			j_joy_danger_realm = {
				name = "Realm of Danger!",
				text = { "TBD" }
			},
			j_joy_danger_disorder = {
				name = "Danger! Disturbance! Disorder!",
				text = { "TBD" }
			},
			--#endregion
			--#region Adamancipator
			j_joy_adaman_analyzer = {
				name = "Adamancipator Analyzer",
				text = { "TBD" }
			},
			j_joy_adaman_researcher = {
				name = "Adamancipator Researcher",
				text = { "TBD" }
			},
			j_joy_adaman_seeker = {
				name = "Adamancipator Seeker",
				text = { "TBD" }
			},
			j_joy_adaman_crysdragite = {
				name = "Adamancipator Crystal - Dragite",
				text = { "TBD" }
			},
			j_joy_adaman_crysraptite = {
				name = "Adamancipator Crystal - Raptite",
				text = { "TBD" }
			},
			j_joy_adaman_crysleonite = {
				name = "Adamancipator Crystal - Leonite",
				text = { "TBD" }
			},
			j_joy_adaman_dragite = {
				name = "Adamancipator Risen - Dragite",
				text = { "TBD" }
			},
			j_joy_adaman_leonite = {
				name = "Adamancipator Risen - Leonite",
				text = { "TBD" }
			},
			j_joy_adaman_raptite = {
				name = "Adamancipator Risen - Raptite",
				text = { "TBD" }
			},
			j_joy_adaman_laputite = {
				name = "Adamancipator Laputite",
				text = { "TBD" }
			},
			--#endregion
			--#region Miscellaneous
			--#region Effect
			j_joy_boarder = {
				name = "{C:joy_effect}Inspector Boarder",
				text = {
					"{X:mult,C:white}X#1#{} Mult for each {C:joy_spell}Extra Deck{} {C:attention}Joker{}",
					"{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
					" ",
					"{C:blue}Hands{} equal {C:joy_spell}Extra Deck{} types owned + 1",
					"No repeat hand types",
					"{C:joy_normal}Main Deck{} {C:attention}Jokers{} are debuffed",
					"{C:inactive}(Except{} {C:joy_effect}\"Inspector Boarder\"{}{C:inactive}){}"
				},
			},
			j_joy_grenmaju = {
				name = "{C:joy_effect}Gren Maju Da Eiza",
				text = {
					"{C:chips}+#1#{} Chips for each card",
					"{C:attention}banished{} this run",
					"{C:inactive}(Currently{} {C:chips}+#2#{} {C:inactive}Chips){}",
				},
			},
			j_joy_heavenlyprison = {
				name = "Lord of the Heavenly Prison",
				text = { "TBD" }
			},
			j_joy_rhino = {
				name = "Fiendish Rhino Warrior",
				text = {
					"Send {C:attention}#1#{} {C:joy_normal}Fiends{} to the {C:attention}GY{} and",
					"{C:attention}revive #2#{} {C:joy_normal}Fiend{} when used",
					"as {C:attention}material{C:attention}",
				}
			},
			j_joy_tourguide = {
				name = "Tour Guide From the Underworld",
				text = {
					"Creates {C:attention}#1#{} {C:dark_edition}Negative{} {C:joy_normal}Main Deck{}",
					"{C:blue}Common{} or {C:green}Uncommon{} {C:joy_normal}Fiend{} when obtained",
				}
			},
			j_joy_backup = {
				name = "Backup Secretary",
				text = {
					"TBD"
				}
			},
			j_joy_wizard = {
				name = "Cyberse Wizard",
				text = { "TBD" }
			},
			j_joy_zenoguitar = {
				name = "Rock Band Xenoguitar",
				text = { "TBD" }
			},
			j_joy_revgolem = {
				name = "Revival Golem",
				text = { "TBD" }
			},
			j_joy_tackcrusader = {
				name = "Tackle Crusader",
				text = { "TBD" }
			},
			j_joy_doki = {
				name = "Doki Doki",
				text = { "TBD" }
			},
			j_joy_blockdragon = {
				name = "Block Dragon",
				text = { "TBD" }
			},
			--#endregion
			--#region Trap
			j_joy_quantumcat = {
				name = "Quantum Cat",
				text = { "TBD" }
			},
			j_joy_anguish = {
				name = "Statue of Anguish Pattern",
				text = { "TBD" }
			},
			j_joy_tiki_curse = {
				name = "Tiki Curse",
				text = { "TBD" }
			},
			j_joy_tiki_soul = {
				name = "Tiki Soul",
				text = { "TBD" }
			},
			j_joy_zoma = {
				name = "Zoma the Spirit",
				text = { "TBD" }
			},
			j_joy_zoma_earthbound = {
				name = "Zoma the Earthbound Spirit",
				text = { "TBD" }
			},
			j_joy_finished = {
				name = "You're Finished",
				text = { "TBD" }
			},
			j_joy_apophis = {
				name = "Embodiment of Apophis",
				text = { "TBD" }
			},
			j_joy_azurune = {
				name = "Angel Statue - Azurune",
				text = { "TBD" }
			},
			j_joy_crukra = {
				name = "Crusadia Krawler",
				text = { "TBD" }
			},
			--#endregion
			--#region Pendulum
			j_joy_eccentrick = {
				name = "{C:joy_pendulum}Archfiend Eccentrick",
				text = {
					"{C:joy_pendulum}Consumable effect:{}",
					"{C:joy_pendulum}Destroys up to{} {C:attention}#1#{} {C:joy_pendulum}selected cards{}",
					" ",
					"{C:mult}+#2#{} Mult for every destroyed playing card this run",
					"{C:inactive}(Currently{} {C:mult}+#3#{} {C:inactive}Mult){}",
				},
			},
			j_joy_pendulumoon = {
				name = "PenduLuMoon",
				text = { "TBD" }
			},
			j_joy_couverture = {
				name = "Patissciel Couverture",
				text = { "TBD" }
			},
			--#endregion
			--#region Ritual
			j_joy_sauravis = {
				name = "{C:joy_ritual}Sauravis, the Ancient and Ascended",
				text = {
					"Sell this card to disable the current",
					"{C:attention}Boss Blind{} and add it to",
					"the next shop",
					" ",
					"Gains {X:mult,C:white}X#1#{} for each time",
					"this ability was used this run",
					"{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}"
				},
				joy_summon_conditions = {
					"{C:attention}2 Jokers{}",
				}
			},
			--#endregion
			--#region Fusion
			j_joy_mudragon = {
				name = "{C:joy_fusion}Mudragon of the Swamp",
				text = {
					"This {C:attention}Joker{} is treated as every",
					"{C:joy_normal}Attribute{} and can be used as any {C:attention}material{}",
					"for a {C:joy_fusion}Fusion Summon{}"
				},
				joy_summon_conditions = {
					"{C:attention}2 Jokers{} with different rarities",
				}
			},
			j_joy_garura = {
				name = "{C:joy_fusion}Garura, Wings of Resonant Life",
				text = {
					"{C:attention}+#1#{} hand size",
					" ",
					"Permanently gain {C:attention}+#2#{} hand size",
					"if used as {C:attention}material{}"
				},
				joy_summon_conditions = {
					"{C:attention}2 Jokers{} with the same rarity",
					"but with different names",
				}
			},
			--#endregion
			--#region Synchro
			j_joy_firewall_saber = {
				name = "Firewall Saber Dragon",
				text = { "TBD" }
			},
			--#endregion
			--#region Xyz
			j_joy_zeus = {
				name = "Divine Arsenal AA-ZEUS - Sky Thunder",
				text = { "TBD" }
			},
			j_joy_typhon = {
				name = "Super Starslayer TY-PHON - Sky Crisis",
				text = { "TBD" }
			},
			--#endregion
			--#region Link
			j_joy_apollousa = {
				name = "{C:joy_link}Apollousa, Bow of the Goddess",
				text = {
					"{C:chips}+#1#{} Chips for each {C:attention}material{}",
					"used for its summon, reduces by {C:red}#2#{} each round",
					"{C:inactive}(Currently{} {C:chips}+#3#{} {C:inactive}Chips){}",
				},
				joy_summon_conditions = {
					"{C:attention}2+ Jokers{} with different names",
				}
			},
			j_joy_beyond = {
				name = "Beyond the Pendulum",
				text = { "TBD" }
			},
			j_joy_linkuriboh = {
				name = "Linkuriboh",
				text = { "TBD" }
			},
			j_joy_linguriboh = {
				name = "Linguriboh",
				text = { "TBD" }
			},
			--#endregion
			--#endregion
		},
		Tag = {
			tag_joy_booster = {
				name = "Booster Tag",
				text = {
					"Adds one {C:booster}Booster",
					"to the next shop",
				},
			},
			tag_joy_monster = {
				name = "Monster Tag",
				text = {
					"Adds",
					"{V:1}#1#{}",
					"to the shop"
				},
			},
		},
		Other = {
			--#region Boosters
			p_joy_monster_pack = {
				name = "Champion Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{} {C:joy_normal}Monster{} {C:joker}Joker{} cards",
				},
			},
			p_joy_jumbo_monster_pack = {
				name = "Turbo Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{} {C:joy_normal}Monster{} {C:joker}Joker{} cards",
				},
			},
			p_joy_mega_monster_pack = {
				name = "Duelist Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{} {C:joy_normal}Monster{} {C:joker}Joker{} cards",
				},
			},
			p_joy_extra_pack = {
				name = "Astral Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{} {C:joy_spell}Special Summon{} {C:joker}Joker{} cards",
				},
			},
			p_joy_jumbo_extra_pack = {
				name = "Star Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{} {C:joy_spell}Special Summon{} {C:joker}Joker{} cards",
				},
			},
			p_joy_mega_extra_pack = {
				name = "Premium Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{} {C:joy_spell}Special Summon{} {C:joker}Joker{} cards",
				},
			},
			--#endregion
			joy_credits = {
				name = " ",
				text = {
					"{C:joy_mod}Booster Art:{} IcyEthics",
					" ",
					"{C:joy_mod}Special Thanks{} to the folks in",
					"the Balatro Discord <3"
				}
			},
			--#region Tooltips
			joy_tooltip_related = {
				name = "Related Cards",
				text = {
					"Press {C:attention}d{} to see",
					"related cards",
				},
			},
			joy_tooltip_transform = {
				name = "Transform",
				text = {
					"Changes a {C:attention}Joker{} into another",
					"Keeps any enhancements",
				},
			},
			joy_tooltip_revive = {
				name = "Revive",
				text = {
					"Create a card and remove it from the {C:attention}GY{}",
					"Must have room and might have",
					"a random edition, unless specified",
					"{s:0.9,C:inactive}({s:0.9,C:joy_spell}Extra Deck{} {s:0.9,C:inactive}and {s:0.9,C:joy_ritual}Ritual{} {s:0.9,C:attention}Jokers{} {s:0.9,C:inactive}that were not",
					"{s:0.9,C:inactive}properly summoned can't be revived)",
					"{s:0.9,C:inactive}(Revived Jokers have a sell value of 1)"
				},
			},
			joy_tooltip_extra_deck_joker = {
				name = "Extra Deck Joker",
				text = {
					"{C:joy_fusion}Fusion{}, {C:joy_synchro}Synchro{},",
					"{C:joy_xyz}Xyz{} and {C:joy_link}Link{} {C:attention}Jokers{}"
				},
			},
			joy_tooltip_main_deck_joker = {
				name = "Main Deck Joker",
				text = {
					"{C:joy_normal}Normal{}, {C:joy_effect}Effect{},",
					"and {C:joy_ritual}Ritual{} {C:attention}Jokers{}"
				},
			},
			joy_tooltip_special = {
				name = "Special Joker",
				text = {
					"{C:joy_ritual}Ritual{}, {C:joy_fusion}Fusion{}, {C:joy_synchro}Synchro{},",
					"{C:joy_xyz}Xyz{} and {C:joy_link}Link{} {C:attention}Jokers{}"
				},
			},
			joy_tooltip_pendulum_joker = {
				name = "Pendulum Joker",
				text = {
					"Can be used as consumable",
				},
			},
			joy_tooltip_banish = {
				name = "Banish",
				text = {
					"Card temporarily disappears until specified time,",
					"keeping only some effects active.",
					"They can return even if you don't have room"
				},
			},
			joy_tooltip_tribute = {
				name = "Tribute",
				text = {
					"Destroy card to activate an ability",
				},
			},
			joy_tooltip_material = {
				name = "Material",
				text = {
					"Cards used for a summon",
					"{C:joy_xyz}Xyz monsters{} start with a counter equal",
					"to the number used",
				},
			},
			joy_tooltip_detach = {
				name = "Detach",
				text = {
					"Remove an Xyz material counter",
					"to activate an ability",
				},
			},
			joy_tooltip_token = {
				name = "Token",
				text = {
					"{C:joy_normal}Monster{} card crated by abilities",
					"It has no with no abilities of its own",
				},
			},
			--#endregion
			--#region Glossary
			joy_glossary_monster = {
				name = "",
				text = {
					"{C:joy_normal,s:1.3}Monster{} {C:attention,s:1.3}Jokers{}: {C:attention}Jokers{} from this mod",
				},
			},
			joy_glossary_gy = {
				name = "",
				text = {
					"{C:attention,s:1.3}Graveyard{} (also {C:attention}GY{}): List of {C:joy_normal}Monster{} {C:attention}Jokers{} sold, destroyed or used for a {C:attention}Summon{}. They lose any enhacements."
				},
			},
			joy_glossary_revive = {
				name = "",
				text = {
					"{C:attention,s:1.3}Revive{}: Create a card from the {C:attention}GY{} and remove it from there. Must have room and might have a random edition, unless specified",
					"{C:joy_spell}Extra Deck{} and {C:joy_ritual}Ritual{} {C:attention}Jokers{} that were not properly summoned can't be revived",
					"Revived Jokers have a sell value of 1"
				},
			},
			joy_glossary_banish = {
				name = "",
				text = {
					"{C:attention,s:1.3}Banish{}: Card temporarily disappears until specified time, keeping only some effects active.",
					"They can return even if you don't have room, unless specified"
				},
			},
			joy_glossary_transform = {
				name = "",
				text = {
					"{C:attention,s:1.3}Transform{}: Changes a {C:attention}Joker{} into another. Keeps any enhancements",
				},
			},
			joy_glossary_facedown = {
				name = "",
				text = {
					"{C:attention,s:1.3}Face-down{}: Flipped {C:joy_normal}Monster{} {C:attention}Jokers{} can't use their abilities (unless specified). {C:joy_link}Links{} can't be face-down",
				},
			},
			joy_glossary_maindeck = {
				name = "",
				text = {
					"{C:joy_normal,s:1.3}Main Deck{} {C:attention,s:1.3}Jokers{}: Any {C:joy_normal}Monster{} {C:attention}Joker{} that is not an {C:joy_spell}Extra Deck{} {C:attention}Joker{} (See Summon Glossary)",
				},
			},
			joy_glossary_pendulum = {
				name = "",
				text = {
					"{C:joy_pendulum,s:1.3}Pendulum{} {C:attention,s:1.3}Jokers{}: {C:attention}Jokers{} that can also be used as consumables",
				},
			},
			joy_glossary_fieldspell = {
				name = "",
				text = {
					"{C:joy_spell,s:1.3}Field Spells{}: They go into the {C:joy_spell}Field Spell{} area (press the {C:joy_spell}Extra Deck{} button) but otherwise act like any other {C:attention}Joker{}",
				},
			},
			joy_glossary_extradeck = {
				name = "",
				text = {
					"{C:joy_spell,s:1.3}Extra Deck{} {C:attention,s:1.3}Jokers{}: When obtanied from the shop they are put in the {C:joy_spell}Extra Deck{}.",
					"To use them, you have to sacrifice {C:attention}Jokers{} listed on the card's summoning requirements.",
					"This includes {C:joy_fusion}Fusion{}, {C:joy_synchro}Synchro{}, {C:joy_xyz}Xyz{} and {C:joy_link}Link{} {C:attention}Jokers{}",
					"{C:joy_xyz}Xyz{} and {C:joy_link}Link{} {C:attention}Jokers{} can't be used for {C:joy_synchro}Synchro{} and {C:joy_xyz}Xyz{} summons unless specified",
					"{C:joy_token}Tokens{} can't be used for {C:joy_xyz}Xyz{} summons unless specified",
					"Summoned Jokers have a sell value equal to their cost"
				},
			},
			joy_glossary_material = {
				name = "",
				text = {
					"{C:attention,s:1.3}Material{}: Cards used to summon a {C:attention}Joker{}",
				},
			},
			joy_glossary_detach = {
				name = "",
				text = {
					"{C:joy_xyz,s:1.3}Detach{}: {C:joy_xyz}Xyz{} {C:attention}Jokers{} start with a number equal to the materials used to summon it.",
					"Some abilities might {C:joy_xyz}detach{} these or allow you to do it to activate some ability",
				},
			},
			joy_glossary_ritual = {
				name = "",
				text = {
					"{C:joy_ritual,s:1.3}Ritual{} {C:attention,s:1.3}Jokers{}: These don't go in the {C:joy_spell}Extra Deck{} but are summoned directly from the shop instead. They count as {C:joy_normal}Main Deck{} {C:attention}Jokers{}",
				},
			},
			--#endregion
		}
	},
	misc = {
		challenge_names = {
			c_joy_mystic_wok = "Mystic Wok",
			c_joy_mistake = "Mistake",
			c_joy_monster_reborn = "Monster Reborn",
		},
		v_text = {
			ch_c_joy_gy_start = {
				"Start with some cards in the {C:attention}GY{}",
			},
		},
		dictionary = {
			k_joy_extra_deck = "Extra Deck",
			k_joy_summon_conditions = "Summoning Conditions",
			k_joy_graveyard = "Graveyard",
			k_joy_banishment = "Banishment",
			k_joy_banish_blind_selected = "Start of Blind",
			k_joy_banish_end_of_round = "End of Round",
			k_joy_banish_boss_selected = "Start of Boss Blind",
			k_joy_banish_end_of_ante = "End of Ante",
			k_joy_select_materials = "Select Materials",
			k_joy_select_tributes = "Select Tributes",
			k_joy_summon = "Summon",
			k_joy_detach = "Detach",
			k_joy_activate = "Activate",
			k_joy_token = "Token",
			k_joy_disable_tooltips = "Disable glossary tooltips",
			k_joy_disable_booster_tag = "Disable Booster Tag from appearing naturally",
			k_joy_only_ygo_cards = "Only Monster Cards appear",
			k_joy_extra_ygo_booster = "Extra Monster Card booster each shop",
			k_joy_splash = "Splash!",
			k_joy_defeated = "Defeated!",
			k_joy_banished = "Banished!",
			k_joy_booster_group = "Monster Pack",
			k_joy_related = "Related",
			k_joy_monster_tag_default = "a Monster Joker",
			k_joy_glossary = "Basic Glossary",
			k_joy_summon_glosary = "Summon Glossary",
			k_joy_credits = "Credits",
			k_joy_discord = "Discord",
			k_joy_github = "Github",
			--#region Card types
			k_joy_Aqua = "Aqua",
			k_joy_Beast = "Beast",
			k_joy_BeastWarrior = "Beast-Warrior",
			k_joy_CreatorGod = "Creator God",
			k_joy_Cyberse = "Cyberse",
			k_joy_Dinosaur = "Dinosaur",
			k_joy_DivineBeast = "Divine-Beast",
			k_joy_Dragon = "Dragon",
			k_joy_Fairy = "Fairy",
			k_joy_Fiend = "Fiend",
			k_joy_Fish = "Fish",
			k_joy_Illusion = "Illusion",
			k_joy_Insect = "Insect",
			k_joy_Machine = "Machine",
			k_joy_Plant = "Plant",
			k_joy_Psychic = "Psychic",
			k_joy_Pyro = "Pyro",
			k_joy_Reptile = "Reptile",
			k_joy_Rock = "Rock",
			k_joy_SeaSerpent = "Sea Serpent",
			k_joy_Spellcaster = "Spellcaster",
			k_joy_Thunder = "Thunder",
			k_joy_Warrior = "Warrior",
			k_joy_WingedBeast = "Winged-Beast",
			k_joy_Wyrm = "Wyrm",
			k_joy_Zombie = "Zombie",
			k_joy_effect = "Effect",
			k_joy_normal = "Normal",
			k_joy_tuner = "Tuner",
			k_joy_pendulum = "Pendulum",
			k_joy_FUSION = "Fusion",
			k_joy_RITUAL = "Ritual",
			k_joy_SYNCHRO = "Synchro",
			k_joy_XYZ = "Xyz",
			k_joy_LINK = "Link",
			k_joy_LIGHT = "LIGHT",
			k_joy_DARK = "DARK",
			k_joy_WATER = "WATER",
			k_joy_FIRE = "FIRE",
			k_joy_EARTH = "EARTH",
			k_joy_WIND = "WIND",
			k_joy_DIVINE = "DIVINE",
			k_joy_spell = "Spell",
			k_joy_trap = "Trap",
			k_joy_fieldspell = "Field Spell",
			--#endregion
			--#region Archetypes
			k_joy_archetype_dmaid = "Dragonmaid",
			k_joy_archetype_ltwin = "Live☆Twin",
			k_joy_archetype_dogma = "Dogmatika",
			k_joy_archetype_yokai = "Ghost Girls",
			k_joy_archetype_spright = "Spright",
			k_joy_archetype_mekk = "Mekk-Knight",
			k_joy_archetype_generaider = "Generaider",
			k_joy_archetype_fish = "Ghoti",
			k_joy_archetype_psy = "PSY-Frame",
			k_joy_archetype_runick = "Runick",
			k_joy_archetype_ba = "Burning Abyss",
			k_joy_archetype_lab = "Labrynth",
			k_joy_archetype_sub = "Subterror",
			k_joy_archetype_eld = "Eldlich",
			k_joy_archetype_ignis = "@Ignister",
			k_joy_archetype_solfa = "Solfachord",
			k_joy_archetype_witch = "Witchcrafter",
			k_joy_archetype_shaddoll = "Shaddoll",
			k_joy_archetype_paleo = "Paleozoic",
			k_joy_archetype_invoked = "Invoked",
			k_joy_archetype_danger = "Danger!",
			k_joy_archetype_adaman = "Adamancipator",
			k_joy_archetype_misc = "Free Agents",
			k_joy_archetype_token = "Tokens",
			--#endregion
		}
	},
}
