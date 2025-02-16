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
			--#region Dragonmaid
			j_joy_dmaid_kitchen = {
				name = "{C:joy_effect}Kitchen Dragonmaid",
				text = {
					"{C:attention}#1#{} free {C:green}Reroll{} for each",
					"{C:joy_normal}\"Dragonmaid\"{} {C:attention}Joker{} when obtained",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Dragonmaid Tinkhec\"",
					"when {C:attention}Blind{} is selected",
				},
			},
			j_joy_dmaid_tinkhec = {
				name = "{C:joy_effect}Dragonmaid Tinkhec",
				text = {
					"{C:joy_normal}\"Dragonmaid\"{} {C:attention}Jokers{} each",
					"give {C:mult}+#1#{} Mult",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Kitchen Dragonmaid\"",
					"at end of round",
				},
			},
			j_joy_dmaid_parlor = {
				name = "{C:joy_effect}Parlor Dragonmaid",
				text = {
					"{C:attention}#1# Booster Tag{} when obtained if you have",
					"{C:attention}#2#{} {C:joy_normal}\"Dragonmaid\"{} {C:attention}Jokers{},",
					"gaining an extra for every {C:attention}#3#{} more",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Dragonmaid Lorpar\"",
					"when {C:attention}Blind{} is selected",
				},
			},
			j_joy_dmaid_lorpar = {
				name = "{C:joy_effect}Dragonmaid Lorpar",
				text = {
					"{C:joy_normal}\"Dragonmaid\"{} {C:attention}Jokers{} each",
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
					"{C:blue}Common{} {C:joy_normal}\"Dragonmaid\"{} {C:attention}Joker(s){} when obtained",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Dragonmaid Ernus\"",
					"when {C:attention}Blind{} is selected",
				},
			},
			j_joy_dmaid_ernus = {
				name = "{C:joy_effect}Dragonmaid Ernus",
				text = {
					"{C:mult}+#1#{} Mult for each {C:joy_normal}\"Dragonmaid\"{}",
					"{C:attention}Joker{} in the {C:attention}GY{}",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Nurse Dragonmaid\"",
					"at end of round",
				},
			},
			j_joy_dmaid_laundry = {
				name = "{C:joy_effect}Laundry Dragonmaid",
				text = {
					"Adds {C:attention}#1#{} random {C:joy_normal}Main Deck{}",
					"{C:joy_normal}\"Dragonmaid\"{} {C:attention}Jokers{} to the {C:attention}GY{}",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Dragonmaid Nudyarl\"",
					"when {C:attention}Blind{} is selected",
				},
			},
			j_joy_dmaid_nudyarl = {
				name = "{C:joy_effect}Dragonmaid Nudyarl",
				text = {
					"{C:chips}+#1#{} Chips for each {C:joy_normal}\"Dragonmaid\"{}",
					"{C:attention}Joker{} in the {C:attention}GY{}",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Laundry Dragonmaid\"",
					"at end of round",
				},
			},
			j_joy_dmaid_chamber = {
				name = "{C:joy_effect}Chamber Dragonmaid",
				text = {
					"{C:attention}#1# Voucher Tag{} when obtained if you have",
					"{C:attention}#2#{} {C:joy_normal}\"Dragonmaid\"{} {C:attention}Jokers{},",
					"gaining an extra for every {C:attention}#3#{} more",
					" ",
					"{C:attention}Transforms{} into {C:joy_effect}\"Dragonmaid Stern\"",
					"when {C:attention}Blind{} is selected",
				},
			},
			j_joy_dmaid_stern = {
				name = "{C:joy_effect}Dragonmaid Stern",
				text = {
					"{C:green}#1# in #2#{} chance to {C:attention}revive #3#{} {C:green}Uncommon{}",
					"or {C:red}Rare{} {C:joy_normal}\"Dragonmaid\"{} {C:attention}Joker(s){}",
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
					"{C:green}Uncommon{} {C:joy_normal}\"Dragonmaid\"{} {C:attention}Joker{}",
					"when {C:attention}Blind{} is selected",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:attention}Jokers{}, including a {C:joy_normal}\"Dragonmaid\"{}"
				}
			},
			j_joy_dmaid_house = {
				name = "{C:joy_fusion}House Dragonmaid",
				text = {
					"{X:mult,C:white}X#1#{} Mult for each",
					"{C:joy_normal}\"Dragonmaid\"{} {C:attention}Joker{}",
					"{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
					" ",
					"{C:attention}Jokers{} in the {C:attention}GY{} count for",
					"{C:joy_normal}\"Dragonmaid\"{} effects",
					" ",
					"{C:attention}Transforms{} into {C:joy_fusion}\"Dragonmaid Sheou\"",
					"after {C:attention}#3#{} rounds {C:inactive}(#4#/#3#){}",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:joy_normal}\"Dragonmaid\"{} {C:attention}Jokers{}"
				}
			},
			j_joy_dmaid_sheou = {
				name = "{C:joy_fusion}Dragonmaid Sheou",
				text = {
					"{C:attention}Jokers{} in the {C:attention}GY{} count for",
					"{C:joy_normal}\"Dragonmaid\"{} effects",
					" ",
					"When {C:attention}Boss Blind{} is selected,",
					"disables its effects then {C:attention}transforms{} into",
					"{C:joy_fusion}\"House Dragonmaid\"{} and creates {C:attention}#1#{} {C:blue}Common{}",
					"{C:joy_normal}\"Dragonmaid\"{} {C:attention}Joker{}",
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
					"Free if you own a {C:joy_normal}\"Ki-sikil\"{} {C:attention}Joker{}"
				},
			},
			j_joy_ltwin_lilla_sweet = {
				name = "{C:joy_effect}Live☆Twin Lil-la Sweet",
				text = {
					"{C:blue}+#1#{} hand each round",
					" ",
					"Free if you own a {C:joy_normal}\"Ki-sikil\"{} {C:attention}Joker{}"
				},
			},
			j_joy_ltwin_kisikil_frost = {
				name = "{C:joy_effect}Live☆Twin Ki-sikil Frost",
				text = {
					"{C:attention}+#1#{} hand size",
					" ",
					"Free if you own a {C:joy_normal}\"Lil-la\"{} {C:attention}Joker{}"
				},
			},
			j_joy_etwin_kisikil_deal = {
				name = "{C:joy_link}Evil★Twin Ki-sikil Deal",
				text = {
					"{C:mult}+#1#{} Mult",
					"{C:attention}+#2#{} hand size",
					" ",
					"Adds {C:attention}#3#{} {C:joy_normal}Main Deck \"Lil-la\"{} {C:attention}Joker{} to the {C:attention}GY{}",
					"when {C:attention}Blind{} is selected",
				},
				joy_summon_conditions = {
					"{C:attention}1{} {C:joy_normal}\"Ki-sikil\"{} {C:attention}Joker{}"
				}
			},
			j_joy_etwin_kisikil = {
				name = "{C:joy_link}Evil★Twin Ki-sikil",
				text = {
					"{C:mult}+#1#{} Mult",
					" ",
					"Permanently gain {C:attention}+#2#{} hand size if you",
					"own a {C:joy_normal}\"Lil-la\"{} {C:attention}Joker{} when obtained",
					" ",
					"{C:attention}Revives #3#{} {C:joy_link}Evil★Twin Lil-la{} or {C:attention}#3#{} {C:joy_normal}\"Lil-la\"{}",
					"{C:attention}Joker{} when {C:attention}Blind{} is selected",
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
					"{C:money}+$#2#{} if you own a {C:joy_normal}\"Ki-sikil\"{} {C:attention}Joker{} when obtained",
					" ",
					"{C:attention}Revives #3#{} {C:joy_link}Evil★Twin Ki-sikil{} or {C:attention}#3#{} {C:joy_normal}\"Ki-sikil\"{}",
					"{C:attention}Joker{} when {C:attention}Blind{} is selected",
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
					"{C:red}-#3#{} discards for each {C:joy_link}Link{} {C:attention}Joker{} when {C:attention}Blind{} is selected",
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
					"{C:attention}2{} {C:joy_normal}\"Evil★Twin\"{} {C:attention}Jokers{}"
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
					"{C:joy_normal}\"Dogmatika\"{} {C:attention}Jokers{} each give {C:mult}+#1#{} Mult",
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
					"Create {C:attention}#1#{} {C:joy_ritual}non-Ritual{} {C:joy_normal}\"Dogmatika\"{} {C:attention}Joker{}",
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
					"{C:attention}Revives #1#{} {C:joy_normal}\"Dogmatika\"{} {C:attention}Joker{} when obtained",
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
					"count for {C:joy_normal}\"Dogmatika\"{} effects {C:inactive}(as debuffed){}"
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
					"{C:attention}2{} {C:joy_normal}\"Dogmatika\"{} {C:attention}Jokers{}"
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
					"{C:green}#1# in #2#{} chance to not draw any cards",
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
					"Create {C:attention}#1#{} {C:joy_normal}Main Deck \"Spright\"{}",
					"{C:attention}Joker{} at end of round",
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
					"count for {C:joy_normal}\"Spright\"{} effects"
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
					"{C:joy_xyz}Detach{} {C:attention}1 material{} to create",
					"{C:attention}#1#{} {C:green}Uncommon{} {C:attention}Joker{}",
					"{C:inactive}(Must have room){}",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:green}Uncommon{} {C:attention}Jokers{}",
					"({C:joy_link}Links{} allowed)"
				}
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
				pendulum_text = {
					"Destroys up to",
					"{C:attention}#1#{} selected cards",
				}
			},
			--#endregion
			--#region Ritual
			j_joy_sauravis = {
				name = "{C:joy_ritual}Sauravis, the Ancient and Ascended",
				text = {
					"Sell this card to disable the current",
					"{C:attention}Boss Blind{} and add it to",
					"the next shop"
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
		},
		Other = {
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
					"Revived Jokers have a sell value of 1"
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
			joy_glossary_extradeck = {
				name = "",
				text = {
					"{C:joy_spell,s:1.3}Extra Deck{} {C:attention,s:1.3}Jokers{}: When obtanied from the shop they are put in the {C:joy_spell}Extra Deck{}.",
					"To use them, you have to sacrifice {C:attention}Jokers{} listed on the card's summoning requirements.",
					"This includes {C:joy_fusion}Fusion{}, {C:joy_synchro}Synchro{}, {C:joy_xyz}Xyz{} and {C:joy_link}Link{} {C:attention}Jokers{}",
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
					"Some effects might {C:joy_xyz}detach{} these or allow you to do it to activate some ability",
				},
			},
			joy_glossary_ritual = {
				name = "",
				text = {
					"{C:joy_ritual,s:1.3}Ritual{} {C:attention,s:1.3}Jokers{}: These don't go in the {C:joy_spell}Extra Deck{} but are summoned directly from the shop instead. They count as {C:joy_normal}Main Deck{} {C:attention}Jokers{}",
				},
			},
		}
	},
	misc = {
		dictionary = {
			b_joy_extra_deck = "Extra Deck",
			b_joy_summon_conditions = "Summoning Conditions",
			b_joy_graveyard = "Graveyard",
			b_joy_summon = "Summon",
			b_joy_detach = "Detach",
			b_joy_disable_booster_tag = "Disable Booster Tag from appearing naturally",
			b_joy_archetype_dmaid = "Dragonmaid",
			b_joy_archetype_ltwin = "Live☆Twin",
			b_joy_archetype_dogma = "Dogmatika",
			b_joy_archetype_yokai = "Ghost Girls",
			b_joy_archetype_spright = "Spright",
			b_joy_archetype_misc = "Miscellaneous",
		}
	},
}
