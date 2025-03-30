return {
	descriptions = {
		Mod = {
			JoyousSpring = {
				name = "JoyousSpring",
				text = {
					"Adds modern {C:joy_effect}Yu-Gi-Oh!{} cards and mechanics",
				},
			},
		},
		Joker = {
			j_joy_token = {
				name = "{C:joy_token}토큰",
				text = {
					"이 카드는 {C:joy_token}토큰{}으로 사용할 수 있습니다",
				},
			},
			--#region Dragonmaid
			j_joy_dmaid_kitchen = {
				name = "{C:joy_effect}드래곤메이드 티루루",
				text = {
					"소환 시 보유한 {C:joy_normal}\"드래곤메이드\"{} 한 장마다",
					"{C:attention}#1#{}번 상점을 무료로 {C:green}새로고침{} 할 수 있습니다",
					" ",
					"블라인드를 선택할 시",
					"{C:joy_effect}\"드래곤메이드 플란메\"{}로 {C:attention}변신{}합니다",
				},
			},
			j_joy_dmaid_tinkhec = {
				name = "{C:joy_effect}드래곤메이드 플란메",
				text = {
					"각 {C:joy_normal}\"드래곤메이드\"{} 몬스터가",
					"{C:mult}+#1#{} 배수를 부여합니다",
					" ",
					"라운드 종료 시",
					"{C:joy_effect}\"드래곤메이드 티루루\"{}로 {C:attention}변신{}합니다",
				},
			},
			j_joy_dmaid_parlor = {
				name = "{C:joy_effect}드래곤메이드 파룰라",
				text = {
					"소환 시 {C:joy_normal}\"드래곤메이드\"{}를 {C:attention}#2#{}장 보유했을경우,",
					"{C:attention}부스터 태그{}를 {C:attention}#1#{}개 얻고,",
					"그 이상의 {C:attention}#3#{}장 마다 하나를 더 얻습니다",
					" ",
					"블라인드를 선택할 시",
					"{C:joy_effect}\"드래곤메이드 루프트\"{}로 {C:attention}변신{}합니다",
				},
			},
			j_joy_dmaid_lorpar = {
				name = "{C:joy_effect}드래곤메이드 루프트",
				text = {
					"각 {C:joy_normal}\"드래곤메이드\"{} 몬스터가",
					"{X:mult,C:white}X#1#{} 배수를 부여합니다",
					" ",
					"라운드 종료 시",
					"{C:joy_effect}\"드래곤메이드 파룰라\"{}로 {C:attention}변신{}합니다",
				},
			},
			j_joy_dmaid_nurse = {
				name = "{C:joy_effect}드래곤메이드 너서리",
				text = {
					"소환 시 {C:green}#1#/#2#{} 확률로 {C:blue}일반{}",
					"{C:joy_normal}\"드래곤메이드\" {C:attention}#3#{}장을 소생시킵니다",
					" ",
					"블라인드를 선택할 시",
					"{C:joy_effect}\"드래곤메이드 에르데\"{}로 {C:attention}변신{}합니다",
				},
			},
			j_joy_dmaid_ernus = {
				name = "{C:joy_effect}드래곤메이드 에르데",
				text = {
					"묘지의 각 {C:joy_normal}\"드래곤메이드\"{} 몬스터가",
					"{C:mult}+#1#{} 배수를 부여합니다",
					" ",
					"라운드 종료 시",
					"{C:joy_effect}\"드래곤메이드 너서리\"{}로 {C:attention}변신{}합니다",
				},
			},
			j_joy_dmaid_laundry = {
				name = "{C:joy_effect}드래곤메이드 라도리",
				text = {
					"소환 시 {C:attention}묘지{}에 무작위한 {C:joy_normal}메인 덱{}",
					"{C:joy_normal}\"드래곤메이드\" {C:attention}#1#{}장을 생성합니다",
					" ",
					"블라인드를 선택할 시",
					"{C:joy_effect}\"드래곤메이드 후르스\"{}로 {C:attention}변신{}합니다",
				},
			},
			j_joy_dmaid_nudyarl = {
				name = "{C:joy_effect}드래곤메이드 후르스",
				text = {
					"묘지의 각 {C:joy_normal}\"드래곤메이드\"{} 몬스터가",
					"칩 {C:chips}+#1#{}개를 부여합니다",
					" ",
					"라운드 종료 시",
					"{C:joy_effect}\"드래곤메이드 라도리\"{}로 {C:attention}변신{}합니다",
				},
			},
			j_joy_dmaid_chamber = {
				name = "{C:joy_effect}드래곤메이드 체임",
				text = {
					"소환 시 {C:joy_normal}\"드래곤메이드\"{}를 {C:attention}#2#{}장 보유했을경우",
					"{C:attention}바우처 태그{}를 {C:attention}#1#{}개 얻고,",
					"그 이상의 {C:attention}#3#{}장마다 한개를 더 얻습니다",
					"",
					" ",
					"블라인드를 선택할 시",
					"{C:joy_effect}\"드래곤메이드 슈테른\"{}으로 {C:attention}변신{}합니다",
				},
			},
			j_joy_dmaid_stern = {
				name = "{C:joy_effect}드래곤메이드 슈테른",
				text = {
					"소환 시 {C:green}#1#/#2#{} 확률로 {C:green}희귀{} 또는 {C:red}레어{}",
					"{C:joy_normal}\"드래곤메이드\" 카드 {C:attention}#3#{}장을 {C:attention}소생{}시킵니다",
					" ",
					"라운드 종료 시",
					"{C:joy_effect}\"드래곤메이드 체임\"{}으로 {C:attention}변신{}합니다",
				},
			},
			j_joy_dmaid_lady = {
				name = "{C:joy_fusion}드래곤메이드 라티스",
				text = {
					"소환 시 {C:joy_fusion}\"드래곤메이드 하스\"{}를",
					"{C:joy_spell}엑스트라 덱{}에 추가합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
					" ",
					"{C:green}#1#/#2#{} 확률로 {C:attention}블라인드{}를 선택할 시",
					"무작위한 {C:green}희귀{} {C:joy_normal}\"드래곤메이드\"{}로 {C:attention}변신{}합니다",
				},
				joy_summon_conditions = {
					"{C:joy_normal}\"드래곤메이드\"{} {C:attention}1{}장을 포함한 {C:attention}조커 2{}장",
				},
			},
			j_joy_dmaid_house = {
				name = "{C:joy_fusion}드래곤메이드 하스키",
				text = {
					"{C:joy_normal}\"드래곤메이드\"{} 한 장 마다 {X:mult,C:white}X#1#{} 배수를 획득합니다",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
					" ",
					"{C:joy_normal}\"드래곤메이드\"{}의 효과를 처리할때",
					"{C:attention}묘지{}의 {C:attention}조커{}들도 보유한 것으로 취급됩니다",
					" ",
					"{C:attention}#3#{} 라운드 이후 {C:joy_fusion}\"드래곤메이드 슈트럴\"{}로",
					"{C:attention}변신{}합니다 {C:inactive}(#4#/#3#){}",
				},
				joy_summon_conditions = {
					"{C:joy_normal}\"드래곤메이드\" {C:attention}2{}장",
				},
			},
			j_joy_dmaid_sheou = {
				name = "{C:joy_fusion}드래곤메이드 슈트럴",
				text = {
					"{C:joy_normal}\"드래곤메이드\"{}의 효과를 처리할때",
					"{C:attention}묘지{}의 {C:attention}조커{}들도 보유한 것으로 취급됩니다",
					" ",
					"{C:attention}보스 블라인드{}를 선택할 시, 블라인드의 효과를 비활성화한뒤",
					"{C:joy_fusion}\"드래곤메이드 하스키\"로 {C:attention}변신{}하고",
					"무작위한 {C:blue}일반{} {C:joy_normal}\"드래곤메이드\"{}를 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
				},
			},
			--#endregion
			--#region Live Twin
			j_joy_ltwin_lilla = {
				name = "{C:joy_effect}Live☆Twin 리일라",
				text = {
					"칩 {C:chips}+#1#{} 개",
					" ",
					"소환 시 {C:joy_effect}\"Live☆Twin 키스킬\"{}을",
					"보유하지 않고 있다면 {C:attention}#2#{}장 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
				},
			},
			j_joy_ltwin_kisikil = {
				name = "{C:joy_effect}Live☆Twin 키스킬",
				text = {
					"{C:mult}+#1#{} 배수",
					" ",
					"소환 시 {C:joy_effect}\"Live☆Twin 리일라\"{}를",
					"보유하지 않고 있다면 {C:attention}#2#{}장 생성합니다",
				},
			},
			j_joy_ltwin_lilla_treat = {
				name = "{C:joy_effect}Live☆Twin 리일라 트리트",
				text = {
					"라운드별 버리기 {C:red}+#1#{}번",
					" ",
					"{C:joy_normal}\"키스킬\"{} 보유 시 무료",
				},
			},
			j_joy_ltwin_lilla_sweet = {
				name = "{C:joy_effect}Live☆Twin 리일라 스위트",
				text = {
					"라운드별 핸드 {C:blue}+#1#{}번",
					" ",
					"{C:joy_normal}\"키스킬\"{} 보유 시 무료",
				},
			},
			j_joy_ltwin_kisikil_frost = {
				name = "{C:joy_effect}Live☆Twin 키스킬 프로스트",
				text = {
					"핸드 크기 {C:attention}+#1#{}장",
					" ",
					"{C:joy_normal}\"리일라\"{} 보유 시 무료",
				},
			},
			j_joy_etwin_kisikil_deal = {
				name = "{C:joy_link}Evil★Twin 키스킬 딜",
				text = {
					"{C:mult}+#1#{} 배수",
					"핸드 크기 {C:attention}+#2#{}장",
					" ",
					"{C:attention}블라인드{}를 선택 시 무작위한",
					"{C:joy_normal}메인 덱 \"리일라\"{}를 {C:attention}묘지{}에 생성합니다",
				},
				joy_summon_conditions = {
					"{C:joy_normal}\"키스킬\"{} {C:attention}1{}장",
				},
			},
			j_joy_etwin_kisikil = {
				name = "{C:joy_link}Evil★Twin 키스킬",
				text = {
					"{C:mult}+#1#{} 배수",
					" ",
					"소환 시 {C:joy_normal}\"리일라\"{}를 보유하고 있다면",
					"영구히 핸드 크기 {C:attention}+#2#{}장을 얻습니다",
					" ",
					"{C:attention}블라인드{}를 선택 시 {C:joy_link}Evil★Twin 리일라{} {C:attention}#3#{}장",
					"혹은 {C:joy_normal}\"리일라\"{} {C:attention}#3#{}장을 {C:attention}소생{}시킵니다",
				},
				joy_summon_conditions = {
					"{C:joy_normal}\"키스킬\"{} {C:attention}1{}장을 포함한 {C:attention}조커 2{}장",
				},
			},
			j_joy_etwin_lilla = {
				name = "{C:joy_link}Evil★Twin 리일라",
				text = {
					"칩 {C:chips}+#1#{}개",
					" ",
					"소환 시 {C:joy_normal}\"키스킬\"{}를 보유하고 있다면",
					"{C:money}+$#2#{}를 얻습니다",
					" ",
					"{C:attention}블라인드{}를 선택 시 {C:joy_link}Evil★Twin 키스킬{} {C:attention}#3#{}장",
					"혹은 {C:joy_normal}\"키스킬\"{} {C:attention}#3#{}장을 {C:attention}소생{}시킵니다",
				},
				joy_summon_conditions = {
					"{C:joy_normal}\"리일라\"{} {C:attention}1{}장을 포함한 {C:attention}조커 2{}장",
				},
			},
			j_joy_etwin_kisikil_lilla = {
				name = "{C:joy_effect}Evil★Twins 키스킬 리일라",
				text = {
					"{C:attention}묘지{}의 {C:joy_normal}\"리일라\" 한 장 마다 {C:chips}+#1#{}개를 획득합니다",
					"{C:attention}묘지{}의 {C:joy_normal}\"키스킬\" 한 장 마다 {C:mult}+#2#{} 배수를 획득합니다",
					"{C:inactive}(현재 칩 {C:chips}+#4#{}{C:inactive}개{} {C:mult}+#5#{} {C:inactive}배수){}",
					"{C:attention}블라인드{}를 선택할시 그 라운드동안 보유한",
					"{C:joy_link}링크{} 몬스터마다 버리기 횟수를 {C:red}#3#{}번 잃습니다",
					" ",
					"이 카드는 {C:attention}소생{}될수 없습니다",
				},
			},
			j_joy_etwin_sunny = {
				name = "{C:joy_link}Evil★Twin's 트러블 서니",
				text = {
					"칩 {C:chips}+#1#{}개",
					"{C:mult}+#2#{} 배수",
					" ",
					"라운드가 끝날때 {C:joy_spell{}엑스트라 덱{}으로 돌아가며",
					"{C:joy_link}Evil★Twin 키스킬{}과 {C:joy_link}Evil★Twin 리일라{}를",
					"{C:attention}#3#{}장씩 {C:attention}소생{}시킵니다",
				},
				joy_summon_conditions = {
					"{C:joy_normal}\"Evil★Twin\"{} {C:attention}2{}장",
				},
			},
			j_joy_ltwin_channel = {
				name = "{C:joy_spell}Live☆Twin 채널",
				text = {
					"{C:attention}블라인드{}의 도중, {C:joy_normal}\"키시킬\"{} 또는 {C:joy_normal}\"리일라\"{}",
					"{C:joy_link}링크{} 몬스터를 {C:attention}#1#{}장 {C:attention}릴리스{}해",
					"이 라운드에서 얻는 칩의 갯수를 {C:attention}2배{}로 늘릴수 있습니다",
					" ",
					"상점에서 나갈때 {C:joy_normal}\"키시킬\"{} 또는",
					"{C:joy_normal}\"리일라\"{} {C:attention}#2#{}장을 {C:attention}소생{}시킵니다",
				},
			},
			--#endregion
			--#region Dogmatika
			j_joy_dogma_ecclesia = {
				name = "{C:joy_effect}드래그마의 성녀 에클레시아",
				text = {
					"{C:joy_spell}엑스트라 덱{} {C:attention}조커{}를 판매할 때마다",
					"배수 획득량이 {X:mult,C:white}X#1#{} 증가합니다",
					"{C:attention}보스 블라인드{}를 승리할 시 초기화됩니다",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
				},
			},
			j_joy_dogma_fleur = {
				name = "{C:joy_effect}드래그마의 기사 플루르드리스",
				text = {
					"각 {C:joy_normal}\"드래그마\"{}가",
					"{C:mult}+#1#{} 배수를 부여합니다",
				},
			},
			j_joy_dogma_maximus = {
				name = "{C:joy_effect}막시무스 드래그마",
				text = {
					"{C:attention}블라인드{}를 선택 시 디버프된 {C:dark_edition}네거티브{}",
					"{C:joy_spell}엑스트라 덱{} {C:attention}조커{} {C:attention}#1#{}장을 생성합니다",
				},
			},
			j_joy_dogma_adin = {
				name = "{C:joy_effect}드래그마의 천계 아딘",
				text = {
					"{C:attention}보스 블라인드{}에 승리할 시 무작위한 {C:joy_ritual}의식{}",
					"카드가 아닌 {C:joy_normal}\"드래그마\" {C:attention}#1#{}장을 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
					" ",
					"디버프된 {C:joy_spell}엑스트라 덱{} {C:attention}조커{}를 보유 시 무료",
				},
			},
			j_joy_dogma_theo = {
				name = "{C:joy_effect}드래그마의 철퇴 테오",
				text = {
					"디버프된 {C:joy_spell}엑스트라 덱{} {C:attention}조커{}",
					"한 장 마다 칩 {C:chips}+#1#{}개를 획득합니다",
					"{C:inactive}(현재 칩 {C:chips}+#2# {C:inactive}개)",
					" ",
					"디버프된 {C:joy_spell}엑스트라 덱{} {C:attention}조커{}를 보유 시 무료",
				},
			},
			j_joy_dogma_ashiyan = {
				name = "{C:joy_effect}핫샤신 드래그마",
				text = {
					"소환 시 {C:joy_normal}\"드래그마\"{} {C:attention}#1#{}장을 {C:attention}소생{}시킵니다",
					" ",
					"디버프된 {C:joy_spell}엑스트라 덱{} {C:attention}조커{}를 보유 시 무료",
				},
			},
			j_joy_dogma_nexus = {
				name = "{C:joy_effect}교도추기 테트라드래그마",
				text = {
					"라운드 종료 시 무작위한 {{C:joy_spell}엑스트라 덱{}",
					"{C:attention}조커{} {C:attention}#1#{}장을 {C:attention}복제{}합니다",
					"{C:inactive}(복제본은 디버프되며{} {C:dark_edition}네거티브{}{C:inactive}를 얻습니다){}",
				},
			},
			j_joy_dogma_relic = {
				name = "{C:joy_ritual}드래그마의 알버스 세인트 ",
				text = {
					"디버프된 {C:joy_spell}엑스트라 덱{} {C:attention}조커 #2#{}장마다",
					"핸드 사이즈 {C:attention}+#1#{}장을 얻습니다",
					"{C:inactive}(현재{} {C:attention}+#3#{C:inactive}장){}",
					" ",
					"{C:joy_normal}\"드래그마\"{}의 효과를 처리할때 {C:attention}묘지{}의 {C:joy_spell}엑스트라 덱{}",
					"{C:attention}조커{}들은 디버프되있으며 보유한 것으로 취급됩니다",
				},
				joy_summon_conditions = {
					"{C:joy_normal}\"드래그마\"{} {C:attention}1{}장을 포함한 {C:attention}조커 2{}장",
				},
			},
			j_joy_dogma_knight = {
				name = "{C:joy_ritual}드래그마의 알버스 나이트",
				text = {
					"디버프된 {C:joy_spell}엑스트라 덱{} {C:attention}조커{}",
					"한 장 마다 {C:mult}+#1#{} 배수를 획득합니다",
					"{C:inactive}(현재{} {C:mult}+#2# {C:inactive}배수){}",
					" ",
					"상점의 모든 {C:joy_spell}엑스트라 덱{} {C:attention}조커{}들은",
					"무료지만 디버프됩니다",
				},
				joy_summon_conditions = {
					"{C:joy_normal}\"드래그마\"{} {C:attention}2{}장",
				},
			},
			j_joy_dogma_nation = {
				name = "{C:joy_spell}교도국가 드래그마",
				text = {
					"라운드 종료 시 디버프된 {C:joy_spell}엑스트라 덱{}",
					"{C:attention}조커{}마다 {C:attention}+$#1#{}를 얻습니다",
					"{C:inactive}(현재{} {C:money}+$#2#{C:inactive}){}",
					" ",
					"{C:joy_spell}엑스트라 덱{} {C:attention}조커{} {C:attention}#3#{}장을 {C:attention}릴리스{}해",
					"무작위한 {C:joy_normal}\"드래그마\"{} {C:attention}#4#{}장을 생성할 수 있습니다",
					"{C:inactive}(자리가 있어야 합니다){}",
				},
			},
			--#endregion
			--#region Ghost Girls
			j_joy_yokai_ogre = {
				name = "{C:joy_effect}유령토끼",
				text = {
					"득점하는 모든 카드를 파괴합니다",
					"이 효과로 파괴된 카드 한 장마다",
					"배수 획득량이 {X:mult,C:white}X#1#{} 증가합니다",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
				},
			},
			j_joy_yokai_reaper = {
				name = "{C:joy_effect}부유벚꽃",
				text = {
					"{C:attention}묘지{}의 {C:joy_spell}엑스트라 덱{} {C:attention}조커{} 한 장마다",
					"{X:mult,C:white}X#1#{} 배수를 획득합니다",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
				},
			},
			j_joy_yokai_ash = {
				name = "{C:joy_effect}하루 우라라",
				text = {
					"카드를 내거나 버릴 때마다 {C:green}#1#/#2#{}의",
					"확률로 카드를 뽑지 않습니다",
					"이 효과가 발동할 때마다",
					"배수 획득량이 {X:mult,C:white}X#3#{} 증가합니다",
					"{C:inactive}(현재{} {X:mult,C:white}X#4#{} {C:inactive}배수){}",
				},
			},
			j_joy_yokai_belle = {
				name = "{C:joy_effect}저택 와라시",
				text = {
					"{C:attention}조커{}가 소생될 때마다",
					"배수 획득량이 {X:mult,C:white}X#1#{} 증가합니다",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
				},
			},
			j_joy_yokai_sister = {
				name = "{C:joy_effect}하나 미즈키",
				text = {
					"{C:attention}블라인드{} 도중 소모품을 사용할 때마다",
					"배수 획득량이 {X:mult,C:white}X#1#{} 증가합니다",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
					" ",
					"한 라운드동안 소모품을 사용하지",
					"않을 경우 즉시 {C:red}패배{}합니다",
				},
			},
			j_joy_yokai_mourner = {
				name = "{C:joy_effect}사요 시구레",
				text = {
					"보유한 모든 {C:blue}일반{} 또는 {C:green}희귀{}",
					"조커가 영구히 디버프됩니다",
					"디버프된 카드를 판매할 때마다",
					"배수 획득량이 {X:mult,C:white}X#1#{} 증가합니다",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
				},
			},
			--#endregion
			--#region Spright
			j_joy_spright_blue = {
				name = "{C:joy_effect}스프라이트 블루",
				text = {
					"라운드 종료 시 무작위한 {C:joy_normal}메인 덱{}",
					"{C:joy_normal}\"스프라이트\"{} {C:attention}#1#{}장을 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
					" ",
					"{C:green}희귀{} 조커 보유 시 무료",
				},
			},
			j_joy_spright_jet = {
				name = "{C:joy_effect}스프라이트 제트",
				text = {
					"라운드 종료 시 무작위한 {C:joy_normal}메인 덱{}",
					"{C:joy_normal}\"스프라이트\"{} {C:attention}#1#{}장을 {C:attention}묘지{}에 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
					" ",
					"{C:green}희귀{} 조커 보유 시 무료",
				},
			},
			j_joy_spright_carrot = {
				name = "{C:joy_effect}스프라이트 캐롯",
				text = {
					"보유한 {C:green}희귀{} 조커마다",
					"{X:mult,C:white}X#1#{} 배수를 획득합니다",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
					" ",
					"{C:green}희귀{} 조커 보유 시 무료",
				},
			},
			j_joy_spright_red = {
				name = "{C:joy_effect}스프라이트 레드",
				text = {
					"보유한 {C:green}희귀{} 조커마다",
					"{C:mult}+#1#{} 배수를 획득합니다",
					"{C:inactive}(현재{} {C:mult}+#2#{} {C:inactive}배수){}",
					" ",
					"{C:green}희귀{} 조커 보유 시 무료",
				},
			},
			j_joy_spright_pixies = {
				name = "{C:joy_effect}스프라이트 픽시즈",
				text = {
					"보유한 {C:green}희귀{} 조커마다",
					"칩 {C:chips}+#1#{}개를 획득합니다",
					"{C:inactive}(현재 칩{C:chips}+#2#{} {C:inactive}개){}",
					" ",
					"{C:green}희귀{} 조커 보유 시 무료",
				},
			},
			j_joy_spright_elf = {
				name = "{C:joy_link}스프라이트 엘프",
				text = {
					"{C:attention}블라인드{}를 선택 시",
					"{{C:green}희귀{} 조커 {C:attention}#1#{}장을 {C:attention}소생{}시킵니다",
					" ",
					"{C:joy_normal}\"스프라이트\"{}의 효과를 처리 시",
					"{C:attention}묘지{}의 {C:green}희귀{} 조커들은",
					"보유된것으로 취급됩니다",
				},
				joy_summon_conditions = {
					"{C:green}희귀{} 조커 {C:attention}2{}장",
				},
			},
			j_joy_spright_sprind = {
				name = "{C:joy_link}스프라이트 스프린드",
				text = {
					"보유한 다른 {C:green}희귀{} 조커들은 {C:dark_edition}네거티브{}가 되지만",
					"그 외의 다른 조커들은 전부 디버프됩니다",
					" ",
					"{C:attention}엑시즈 소재 #1#{}장을 {C:joy_xyz}엑시즈{}할 시",
					"{C:joy_spell}엑스트라 덱{}에 {C:joy_xyz}\"기간틱 스프라이트\"{}를 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
					"{C:inactive}(#2#/#1#){}",
				},
				joy_summon_conditions = {
					"{C:joy_xyz}엑시즈{} 조커 {C:attention}1{}장을 포함한",
					"{C:green}희귀{} 조커 {C:attention}2{}장,",
				},
			},
			j_joy_spright_gigantic = {
				name = "{C:joy_xyz}기간틱 스프라이트",
				text = {
					"{C:joy_xyz}엑시즈{} {C:attention}1{}: 무작위한",
					"{C:green}희귀{} 조커를 {C:attention}#1#{}장",
					"생성 합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
				},
				joy_summon_conditions = {
					"{C:green}희귀{} 조커 {C:attention}2{}장",
					"({C:joy_link}링크{} 몬스터도 포함 가능)",
				},
			},
			--#endregion
			--#region Mekk-Knight
			j_joy_mekk_avram = {
				name = "{C:joy_normal}잭나이츠 아브람",
				text = {
					"{E:1}별의 빛을 수호하는 용사 환계에 드리운 어둠을",
					"{E:1}물리치기 위해 선택받은 자에게 힘을 맡기다",
					"{E:1}별의 잔으로 이어진 의지는 새로운 열쇠가 되어",
					"{E:1}어둠을 끊어내는 검이 되리라",
				},
			},
			j_joy_mekk_red = {
				name = "{C:joy_effect}홍련의 잭나이츠",
				text = {
					"이 조커의 {C:attention}열{}에 위치한 카드가",
					"득점할때 그 카드의 랭크에 {C:mult}+#1#{}를",
					"곱한만큼 배수를 획득합니다",
					"{C:inactive}(현재 열:{} {C:attention}#2#{}{C:inactive}){}",
				},
			},
			j_joy_mekk_orange = {
				name = "{C:joy_effect}등영의 잭나이츠",
				text = {
					"이 조커의 {C:attention}열{}에 위치한",
					"플레이한 카드는 무조건 득점합니다",
					"{C:inactive}(현재 열:{} {C:attention}#1#{}{C:inactive}){}",
				},
			},
			j_joy_mekk_yellow = {
				name = "{C:joy_effect}황화의 잭나이츠",
				text = {
					"이 조커의 {C:attention}열{}에 위치한 카드가",
					"득점할때 그 카드의 랭크에",
					"{C:money}+$#1#{}를 곱한만큼 얻습니다",
					"{C:inactive}(현재 열: {} {C:attention}#2#{}{C:inactive}){}",
				},
			},
			j_joy_mekk_green = {
				name = "{C:joy_effect}취람의 잭나이츠",
				text = {
					"이 조커의 {C:attention}열{}에 위치한 카드가",
					"{C:green}#1#/<랭크>{} 확률로 <랭크>번",
					"다시 득점합니다",
					"{C:inactive}(현재 열: {C:attention}#2#{}{C:inactive}){}",
				},
			},
			j_joy_mekk_blue = {
				name = "{C:joy_effect}창궁의 잭나이츠",
				text = {
					"이 조커의 {C:attention}열{}에 위치한 카드가",
					"득점할때 그 카드의 랭크에 {C:chips}+#1#{}를",
					"곱한만큼 칩을 획득합니다",
					"{C:inactive}(현재 열: {C:attention}#2#{}{C:inactive}){}",
				},
			},
			j_joy_mekk_indigo = {
				name = "{C:joy_effect}감벽의 잭나이츠 ",
				text = {
					"이 조커의 {C:attention}열{}에 따라 다른 효과를 얻습니다",
					"{V:1}1:{} 모든 득점하는 카드들을 재발동합니다{}",
					"{V:2}2:{} 칩 {C:chips}+#1#{} {}개",
					"{V:3}3:{} {C:mult}+#2#{} 배수",
					"{V:4}4:{} {X:mult,C:white}X#3#{} 배수",
					"{V:5}5+:{} 라운드 종료 시 {C:money}+$#4#{} {V:5}",
				},
			},
			j_joy_mekk_purple = {
				name = "{C:joy_effect}자소의 잭나이츠",
				text = {
					"{C:attention}블라인드{} 선택 시 현재 {C:attention}앤티{}의",
					"끝까지 {C:attention}제외{}되며 무작위한 {C:joy_normal}메인 덱",
					"{C:joy_normal}\"잭나이츠\" {C:attention}#1#{}장을 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
				},
			},
			j_joy_mekk_morningstar = {
				name = "{C:joy_link}명성의 잭나이츠",
				text = {
					"인접한 {C:attention}열{}에 위치한 카드가 득점할때",
					"그 {C:attention}열{}에 {C:joy_normal}\"잭나이츠\"{}가 있을경우",
					"{X:mult,C:white}X#1#{} 배수를 얻습니다",
					"{C:inactive}(현재 열들:{} {C:attention}#2#{} {C:inactive},{} {C:attention}#3#{}{C:inactive}){}",
				},
				joy_summon_conditions = {
					"조커 {C:attention}2{}장",
				},
			},
			j_joy_mekk_spectrum = {
				name = "{C:joy_link}성흔의 잭나이츠",
				text = {
					"{C:joy_normal}\"잭나이츠\"{}의 효과들이 모든",
					"플레이한 카드에 발동합니다",
					" ",
					"라운드당 한번 {C:joy_normal}\"잭나이츠\"{}를 판매할 시",
					"무작위한 {C:joy_normal}메인 덱 \"잭나이츠\"{}를 {C:attention}#1#{}장 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
				},
				joy_summon_conditions = {
					"{C:joy_normal}\"잭나이츠\" {C:attention}3{}장",
				},
			},
			j_joy_mekkcrus_avramax = {
				name = "{C:joy_link}잭나이츠 파라디온 아스트람",
				text = {
					"{C:attention}블라인드{}에 무조건 승리합니다",
					" ",
					"이 카드는 소환에 사용된 {C:attention}소재{} 수 만큼의",
					"{C:attention}블라인드{}에 승리한 후 파괴됩니다 {C:inactive}(#1#/#2#){}",
				},
				joy_summon_conditions = {
					"{C:joy_spell}엑스트라 덱{}에서 소환된 조커 {C:attention}2{}장 이상",
				},
			},
			j_joy_mekkleg_scars = {
				name = "{C:joy_spell}성유물이 새긴 상흔",
				text = {
					"각 {C:joy_normal}\"잭나이츠\"{}가 {C:mult}+#1#{} 배수를 부여합니다",
					" ",
					"{C:attention}블라인드{} 도중, {C:joy_normal}\"잭나이츠\"{}를",
					"{C:attention}#2#{}장 {C:attention}릴리스{}해 그 블라인드 동안",
					"핸드 크기를 {C:blue}+#3#{}장 늘릴수 있습니다",
					" ",
					"{C:attention}묘지{}에 이름이 다른 {C:joy_normal}\"잭나이츠\"{}가",
					"#4#장 이상 있을때 이 카드를 판매하면",
					"즉시 {C:attention}블라인드{}에 승리합니다",
				},
			},
			--#endregion
			--#region Generaider
			j_joy_token_generaider = {
				name = "{C:joy_token}제너레이드 토큰",
				text = {
					"이 카드는 {C:joy_token}토큰{}으로 사용할 수 있습니다",
				},
			},
			j_joy_generaider_loptr = {
				name = "{C:joy_effect}제너레이드 섀도우 로프톨",
				text = {
					"{C:attention}보스 블라인드{}에 승리할 시 파괴되며",
					"{C:joy_spell}\"제너레이드 보스 스테이지\"{}를 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
				},
			},
			j_joy_generaider_vala = {
				name = "{C:joy_effect}제너레이드 세이즈 발라",
				text = {
					"{C:attention}보스 블라인드{}에 승리할 시 파괴되며",
					"{C:red}레어{} {C:joy_spell}\"제너레이드\"{}를 {C:attention}소생{}시킵니다",
				},
			},
			j_joy_generaider_harr = {
				name = "{C:joy_effect}포효의 제너레이드 하르",
				text = {
					"{C:joy_normal}\"제너레이드\"{} 또는 {C:joy_normal}마법사족{} 조커",
					"{C:attention}#1#{}장을 {C:attention}릴리스{}해 현재",
					"{C:attention}보스 블라인드{}의 효과를 무효화할 수 있습니다",
				},
			},
			j_joy_generaider_nidhogg = {
				name = "{C:joy_effect}얼음의 제너레이드 니드헥",
				text = {
					"{C:joy_normal}\"제너레이드\"{} 또는 {C:joy_normal}환룡족{} 조커",
					"{C:attention}#1#{}장을 {C:attention}릴리스{}해",
					"이 라운드 도중 모든 득점하는",
					"재발동 시킬수 있습니다",
				},
			},
			j_joy_generaider_frodi = {
				name = "{C:joy_effect}검의 제너레이드 프로디",
				text = {
					"{C:joy_normal}\"제너레이드\"{} 또는 {C:joy_normal}전사족{} 조커들을",
					"임의의 수만큼 {C:attention}릴리스{}해",
					"그 수 만큼 한 라운드 동안 핸드",
					"크기를 증가시킬수 있습니다",
				},
			},
			j_joy_generaider_utgarda = {
				name = "{C:joy_effect}허구의 제너레이드 우트가르자",
				text = {
					"{C:joy_normal}\"제너레이드\"{} 또는 {C:joy_normal}암석족{} 조커",
					"{C:attention}#1#{}장을 {C:attention}릴리스{}해",
					"{C:attention}블라인드{}를 선택할때까지 소모품 존의",
					"무작위 카드를 {C:attention}제외{}할 수 있습니다",
				},
			},
			j_joy_generaider_mardel = {
				name = "{C:joy_effect}빛의 제너레이드 마르델",
				text = {
					"한 라운드에 한 번 {C:joy_normal}\"제너레이드\"{} 또는 {C:joy_normal}식물족{}",
					"조커 {C:attention}#1#{}장을 {C:attention}릴리스{}해 무작위한",
					"{C:green}희귀{} {C:joy_normal}\"제너레이드\"{}를 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
				},
			},
			j_joy_generaider_dovelgus = {
				name = "{C:joy_effect}철의 제너레이드 도벨구스",
				text = {
					"{C:joy_normal}\"제너레이드\"{} 또는 {C:joy_normal}기계족{} 조커",
					"{C:attention}#1#{}장을 {C:attention}릴리스{}할 시",
					"각 {C:joy_normal}\"제네레이드\"{}와 {C:joy_normal}기계족{}",
					"조커들이 {X:mult,C:white}X#2#{} 배수를 부여합니다",
				},
			},
			j_joy_generaider_naglfar = {
				name = "{C:joy_effect}화염의 제너레이드 나글파",
				text = {
					"{C:joy_normal}\"제너레이드\"{} 또는 {C:joy_normal}기계족{} 조커",
					"{C:attention}#1#{}장을 {C:attention}릴리스{}하면",
					"이 {C:attention}블라인드{} 동안 핸드 수 {C:blue}+#2#{}번과",
					"버리기 {C:red}+#3#{}번을 얻습니다",
				},
			},
			j_joy_generaider_hela = {
				name = "{C:joy_effect}죽음의 제너레이드 헬",
				text = {
					"{C:joy_normal}\"제너레이드\"{} 또는 {C:joy_normal}언데드족{} 조커",
					"{C:attention}#1#{}장을 {C:attention}릴리스{}하면",
					"{C:red}레어{} {C:joy_normal}\"제너레이드\"{} 조커 {C:attention}#2#{}장을",
					"{C:dark_edition}네거티브{}로 {C:attention}소생{}시킵니다",
				},
			},
			j_joy_generaider_jormungandr = {
				name = "{C:joy_xyz}영원의 제너레이드 오르무간드",
				text = {
					"이 카드의 {C:joy_xyz}엑시스 소재{} 한 장",
					"마다 {C:mult}+#1#{} 배수를 획득합니다",
					"{C:inactive}(현재{} {C:mult}+#2#{} {C:inactive} 배수){}",
					" ",
					"{C:joy_xyz}엑시즈{} {C:attention}#3#{}: 영구히 핸드 크기를",
					"{C:attention}+#4#{}장 증가시킵니다",
				},
				joy_summon_conditions = {
					"{C:red}레어{} 조커 {C:attention}2{}장 이상",
				},
			},
			j_joy_generaider_laevatein = {
				name = "{C:joy_xyz}그림자의 제너레이드 레이바테인",
				text = {
					"{C:joy_xyz}엑시즈{} {C:attention}#1#{}: 다른 모든 조커를 파괴하며",
					"{C:attention}묘지{}의 모든 카드를 {C:joy_xyz}엑시즈 소재{}로 하는",
					"{C:joy_xyz}\"영원의 제너레이드 오르무간드\"{}를 생성합니다",
				},
				joy_summon_conditions = {
					"{C:red}레어{} 조커 {C:attention}5{}장",
				},
			},
			j_joy_generaider_boss_stage = {
				name = "{C:joy_spell}제너레이드 보스 스테이지",
				text = {
					"{C:attention}블라인드{} 선택 시 가능한 만큼",
					"{C:joy_token}\"제너레이드 토큰\"{}을 생성합니다",
					" ",
					"라운드에 한 번, {C:joy_token}\"제너레이드 토큰\"{} {C:attention}#1#{}장을",
					"{C:attention}릴리스{}해 보유하지 않은 {C:red}레어{}",
					"{C:joy_normal}\"제너레이드\"{} {C:attention}#2#{}장을 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
				},
			},
			--#endregion
			--#region Ghoti
			j_joy_fish_keaf = {
				name = "{C:joy_effect}고티스의 어스름 키프",
				text = {
					"라운드 종료 시 {C:attention}블라인드{}를 선택할 때까지",
					"{C:attention}제외{}되며 {C:joy_spell}엑스트라 덱{}",
					"{C:joy_normal}\"고티스\" {C:attention}#1#{}장을 {C:attention}소생{}시킵니다",
				},
			},
			j_joy_fish_paces = {
				name = "{C:joy_effect}고티스의 빛 페이시스",
				text = {
					"칩 {C:chips}+#1#{} 개",
					" ",
					"라운드 종료 시 {C:attention}블라인드{}를",
					"선택할 때까지 {C:attention}제외{}됩니다",
				},
			},
			j_joy_fish_shif = {
				name = "{C:joy_effect}고티스의 요정 시프",
				text = {
					"{C:mult}+#1#{} 배수",
					" ",
					"라운드 종료 시 {C:attention}블라인드{}를",
					"선택할 때까지 {C:attention}제외{}됩니다",
				},
			},
			j_joy_fish_zep = {
				name = "{C:joy_effect}고티스의 홍옥 제프",
				text = {
					"라운드 종료 시 {C:attention}블라인드{}를 선택할 때까지",
					"{C:attention}제외{}되며 {C:joy_spell}메인 덱{}",
					"{C:joy_normal}\"고티스\" {C:attention}#1#{}장을 {C:attention}소생{}시킵니다",
				},
			},
			j_joy_fish_ixeep = {
				name = "{C:joy_effect}고티스의 전조 이그지프",
				text = {
					"라운드 종료 시 {C:attention}보스 블라인드{}를 선택할 때까지",
					"{C:attention}제외{}되며 무작위한 {C:joy_spell}메인 덱{}",
					"{C:joy_normal}\"고티스\" {C:attention}#1#{}장을 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
				},
			},
			j_joy_fish_eanoc = {
				name = "{C:joy_effect}고티스의 수호인 이녹",
				text = {
					"라운드 종료 시 {C:attention}블라인드{}를",
					"선택할 때까지 {C:attention}제외{}됩니다",
					" ",
					"{C:attention}제외{}에서 {C:attention}#2#{}번 돌아올 때마다",
					"무작위한 {C:joy_spell}엑스트라 덱{} {C:joy_normal}\"고티스\"{}를",
					"{C:joy_spell}엑스트라 덱{}에 {C:attention}#1#{}장 넣습니다",
					"{C:inactive}(자리가 있어야 합니다) (#3#/#2#){}",
				},
			},
			j_joy_fish_psiics = {
				name = "{C:joy_effect}고티스의 월야 사이크스",
				text = {
					"라운드 종료 시 {C:attention}보스 블라인드{}를 선택할 때까지",
					"{C:attention}제외{}되며 {C:joy_spell}메인 덱{} {C:joy_synchro}튜너{} 조커",
					"{C:attention}#1#{}장을 {C:dark_edition}네거티브{}로 {C:attention}소생{}시킵니다",
				},
			},
			j_joy_fish_snopios = {
				name = "{C:joy_effect}스노피오스, 고티의 그림자",
				text = {
					"라운드 종료 시 자신과 소모품 존의 무작위한 카드",
					"{C:attention}#1#{}장을 {C:attention}블라인드{}를 선택할 때까지 {C:attention}제외{}합니다",
					" ",
					"{C:attention}제외{}에서 {C:attention}#2#{}번 돌아올 때",
					"{C:joy_spell}\"저편의 우주\"{}를 생성합니다",
					"{C:inactive}(자리가 있어야 합니다) (#3#/#2#){}",
				},
			},
			j_joy_fish_arionpos = {
				name = "{C:joy_synchro}고티스의 대사 아리온포스",
				text = {
					"이 런에서 {C:attention}제외{}됬던 카드",
					"한 장 마다 칩 {C:chips}+#1#{} 개를 획득합니다",
					"{C:inactive}(현재 칩{} {C:chips}+#2#{} {C:inactive}개){}",
					" ",
					"라운드 종료 시 {C:attention}보스 블라인드{}를 선택할 때까지",
					"{C:attention}제외{}되며 무작위한 {C:joy_spell}엑스트라 덱{}",
					"{C:joy_normal}\"고티스\"{}를 {C:joy_spell}엑스트라 덱{}에 {C:attention}#3#{}장 넣습니다",
					"{C:inactive}(자리가 있어야 합니다){}",
				},
				joy_summon_conditions = {
					"{C:joy_normal}어류족{} {C:joy_synchro}튜너{} {C:attention}1{}장 +",
					"{C:joy_synchro}튜너{} 이의외 조커 {C:attention}1{}장",
				},
			},
			j_joy_fish_askaan = {
				name = "{C:joy_synchro}고티스의 쌍각 아스칸",
				text = {
					"이 런에서 {C:attention}제외{}됬던 카드",
					"한 장 마다 {C:mult}+#1#{} 배수를 획득합니다",
					"{C:inactive}(현재{} {C:mult}+#2#{} {C:inactive} 배수){}",
					" ",
					"라운드 종료 시 이 카드와",
					"{C:joy_normal}\"고티스\"{}가 아닌 카드 한 장을",
					"{C:attention}블라인드{}를 선택할 때까지 {C:attention}제외{}합니다",
				},
				joy_summon_conditions = {
					"{C:joy_synchro}튜너{} {C:attention}1{}장 +",
					"{C:joy_synchro}튜너{}가 아닌 {C:red}레어{} 조커 {C:attention}1{}장",
				},
			},
			j_joy_fish_guoglim = {
				name = "{C:joy_synchro}고티스의 사극 구오그림",
				text = {
					"이 런에서 {C:attention}제외{}됬던 카드",
					"한 장 마다 {X:mult,C:white}X#1#{} 배수를 획득합니다",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
					" ",
					"소환 시 {C:joy_normal}어류족{} 조커를",
					"가능한 만큼 {C:attention}소생{}시킵니다",
					"{s:0.9,C:inactive}(이 소환에 사용된 소재는 소생할 수 없습니다)",
					" ",
					"라운드 종료 시 {C:attention}블라인드{}를",
					"선택할 때까지 {C:attention}제외{}됩니다",
				},
				joy_summon_conditions = {
					"{C:joy_synchro}튜너{} {C:attention}1{}장 +",
					"{C:joy_synchro}튜너{}가 아닌 {C:red}레어{} 조커 {C:attention}1{}장",
				},
			},
			j_joy_fish_deepbeyond = {
				name = "{C:joy_synchro}저편의 고티스",
				text = {
					"라운드 종료 시 이 카드와",
					"{C:joy_normal}\"고티스\"{}가 아닌 모든 조커를",
					"{C:attention}블라인드{}를 선택할 때까지 {C:attention}제외{}합니다",
				},
				joy_summon_conditions = {
					"{C:joy_normal}어류족{} {C:joy_synchro}튜너{} {C:attention}2{}장 +",
					"{C:joy_synchro}튜너{}가 아닌 {C:red}레어{} 조커 {C:attention}1{}장",
				},
			},
			j_joy_fish_depths = {
				name = "{C:joy_spell}저편의 우주",
				text = {
					"카드가 {C:attention}제외{}될",
					"때마다 {C:money}+$#1#{}를",
					"획득합니다",
				},
			},
			--#endregion
			--#region PSY-Frame
			j_joy_psy_driver = {
				name = "{C:joy_normal}PSY프레임 드라이버",
				text = {
					"{E:1}전격을 조종하는 사이킥 전사.",
					"{E:1}자율형 증폭기 \"PSY(싸이)프레임\"을 구사하여",
					"{E:1}시큐리티 포스에 습격을 갱항한다.",
					"{E:1}그 모습은, 정말로 전광석화와 같다.{}",
				},
			},
			j_joy_psy_alpha = {
				name = "{C:joy_effect}PSY프레임기어 알파",
				text = {
					"소환 시 {C:joy_normal}\"PSY프레임 드라이버\"{}가",
					"없다면 {C:attention}#1#{}장을 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
					" ",
					"{C:attention}블라인드{} 선택 시 {C:joy_normal}\"PSY프레임 드라이버\"{}를",
					"라운드의 끝까지 {C:attention}제외{}합니다",
					"이 효과가 발동한 라운드에 손패에 남은 모든 카드가",
					"{X:mult,C:white}X#2#{} 배수를 부여합니다",
				},
			},
			j_joy_psy_beta = {
				name = "{C:joy_effect}PSY프레임기어 베타",
				text = {
					"소환 시 {C:joy_normal}\"PSY프레임 드라이버\"{}가",
					"없다면 {C:attention}#1#{}장을 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
					" ",
					"{C:attention}블라인드{} 선택 시 {C:joy_normal}\"PSY프레임 드라이버\"{}를",
					"라운드의 끝까지 {C:attention}제외{}합니다",
					"이 효과가 발동한 라운드에 득점하는 모든 카드가",
					"{X:mult,C:white}X#2#{} 배수를 부여합니다",
				},
			},
			j_joy_psy_gamma = {
				name = "{C:joy_effect}PSY프레임기어 감마",
				text = {
					"소환 시 {C:joy_normal}\"PSY프레임 드라이버\"{}가",
					"없다면 {C:attention}#1#{}장을 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
					" ",
					"{C:attention}블라인드{} 선택 시 {C:joy_normal}\"PSY프레임 드라이버\"{}를",
					"라운드의 끝까지 {C:attention}제외{}합니다",
					"이 효과가 발동한 라운드에 각 조커가",
					"{X:mult,C:white}X#2#{} 배수를 부여합니다",
				},
			},
			j_joy_psy_delta = {
				name = "{C:joy_effect}PSY프레임기어 델타",
				text = {
					"소환 시 {C:joy_normal}\"PSY프레임 드라이버\"{}가",
					"없다면 {C:attention}#1#{}장을 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
					" ",
					"{C:attention}블라인드{} 선택 시 {C:joy_normal}\"PSY프레임 드라이버\"{}를",
					"라운드의 끝까지 {C:attention}제외{}합니다",
					"이 효과가 발동한 라운드에 보유한 각 타로 카드가",
					"{X:mult,C:white}X#2#{} 배수를 부여합니다",
				},
			},
			j_joy_psy_epsilon = {
				name = "{C:joy_effect}PSY프레임기어 엡실론",
				text = {
					"소환 시 {C:joy_normal}\"PSY프레임 드라이버\"{}가",
					"없다면 {C:attention}#1#{}장을 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
					" ",
					"{C:attention}블라인드{} 선택 시 {C:joy_normal}\"PSY프레임 드라이버\"{}를",
					"라운드의 끝까지 {C:attention}제외{}합니다",
					"이 효과가 발동한 라운드에 보유한 각 행성 카드가",
					"{X:mult,C:white}X#2#{} 배수를 부여합니다",
				},
			},
			j_joy_psy_multithreader = {
				name = "{C:joy_effect}PSY프레임 멀티스레더",
				text = {
					"{C:joy_normal}\"PSY프레임\"{}의 능력을 처리 시",
					"이 카드는 {C:joy_normal}\"PSY프레임 드라이버\"{}로 취급됩니다",
					" ",
					"이 카드가 {C:attention}제외{}당한 후 돌아올 때에 무작위한",
					"{C:joy_normal}메인 덱 \"PSY프레임\"{} 효과 몬스터를 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
				},
			},
			j_joy_psy_zeta = {
				name = "{C:joy_synchro}PSY프레임로드 제타",
				text = {
					"{C:attention}라운드{}가 끝날때 {C:attention}블라인드{}를",
					"선택할 때까지 이 카드와 무작위한",
					"{C:attention}소모품 {C:attention}#1#{}장을 {C:attention}제외{}합니다",
				},
				joy_summon_conditions = {
					"{C:joy_synchro}튜너{} {C:attention}1{}장 +",
					"{C:joy_synchro}튜너{}가 아닌 {C:blue}일반{} 조커",
				},
			},
			j_joy_psy_omega = {
				name = "{C:joy_synchro}PSY프레임로드 오메가",
				text = {
					"{C:attention}라운드{}가 끝날때 {C:attention}블라인드{}를",
					"선택할 때까지 이 카드와 다른 무작위한",
					"{C:attention}조커 1{}장을 {C:attention}제외{}합니다",
				},
				joy_summon_conditions = {
					"{C:joy_synchro}튜너{} {C:attention}1{}장 +",
					"{C:joy_synchro}튜너{}가 아닌 {C:blue}일반{} 조커",
				},
			},
			j_joy_psy_lambda = {
				name = "{C:joy_synchro}PSY프레임로드 램다",
				text = {
					"{C:joy_normal}\"PSY프레임\"{} 능력이 {C:joy_normal}\"PSY프레임 드라이버\"{}를",
					"{C:attention}제외{} 하지 않고도 발동됩니다",
					" ",
					"{C:joy_normal}사이킥족{} 조커가 {C:attention}제외{}에서 돌아올 때마다",
					"무작위한 {C:joy_spell}엑스트라 덱{} {C:joy_normal}\"PSY프레임\"{} 조커 {C:attention}#1#{}장을",
					"{C:joy_spell}엑스트라 덱{}에 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
				},
				joy_summon_conditions = {
					"{C:joy_token}토큰{}이 아닌 조커 {C:attention}2{}장",
				},
			},
			j_joy_psy_circuit = {
				name = "{C:joy_spell}PSY프레임 서킷",
				text = {
					"{C:joy_synchro}싱크로{} 조커를 소환할 때마다 {C:money}+$#1#{}",
					" ",
					"{C:joy_normal}사이킥족{} {C:joy_synchro}싱크로{} 조커는",
					"소환 시 {C:dark_edition}네거티브{}가 됩니다",
				},
			},
			--#endregion
			--#region Runick
			j_joy_runick_hugin = {
				name = "{C:joy_fusion}루닉의 날개 후긴",
				text = {
					"소모품 슬롯 {C:attention}+#1#{}개",
					" ",
					"소환 시 {C:joy_spell}\"루닉의 샘\"{}을",
					"{C:attention}#1#{}장 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
				},
				joy_summon_conditions = {
					"{C:tarot}타로{} 카드 {C:attention}3{}장",
				},
			},
			j_joy_runick_munin = {
				name = "{C:joy_fusion}루닉의 날개 무닌",
				text = {
					"소모품 슬롯 {C:attention}+#1#{}개",
					" ",
					"{C:attention}블라인드{} 도중 {C:tarot}타로{} 카드를 사용할 때마다",
					"이 카드의 칩 획득량이 {C:chips}+#2#{}개 증가합니다",
					"{C:inactive}(현재 칩{} {C:chips}+#3#{} {C:inactive}개){}",
				},
				joy_summon_conditions = {
					"{C:tarot}타로{} 카드 {C:attention}2{}장",
				},
			},
			j_joy_runick_geri = {
				name = "{C:joy_fusion}루닉의 이빨 게리",
				text = {
					"소환 시 {C:attention}묘지{}에 {C:joy_spell}\"루닉의 샘\"{}이 있을경우",
					"{C:joy_spell}\"루닉의 샘\"{}을 {C:attention}#1#{}장 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
					" ",
					"소환된 이 카드를 팔면 무작위한",
					"{C:tarot}타로{} 카드를 {C:attention}#2#{}장 생성합니다",
				},
				joy_summon_conditions = {
					"{C:tarot}타로{} 카드 {C:attention}2{}장",
				},
			},
			j_joy_runick_freki = {
				name = "{C:joy_fusion}루닉의 이빨 프레키",
				text = {
					"{C:attention}블라인드{} 도중 {C:tarot}타로{} 카드를 사용할 때마다",
					"덱에 무작위한 플레잉 카드 {C:attention}#1#{}장을 추가합니다",
					" ",
					"이 카드를 팔면 무작위한",
					"{C:tarot}타로{} 카드를 {C:attention}#2#{}장 생성합니다",
				},
				joy_summon_conditions = {
					"{C:tarot}타로{} 카드 {C:attention}2{}장",
				},
			},
			j_joy_runick_sleipnir = {
				name = "{C:joy_fusion}루닉의 갈기 슬레이프닐",
				text = {
					"라운드 종료 시 {C:attention}블라인드{}를",
					"선택할 때까지 {C:attention}제외{}됩니다",
					" ",
					"{C:attention}제외{}에서 돌아올 때 무작위한",
					"{C:dark_edition}네거티브{} {C:tarot}타로{} 카드를 {C:attention}#1#{}장 생성합니다",
				},
				joy_summon_conditions = {
					"{C:tarot}타로{} 카드 {C:attention}4{}장",
				},
			},
			j_joy_runick_fountain = {
				name = "{C:joy_spell}루닉의 샘",
				text = {
					"라운드가 끝날때 그 라운드 동안 사용한",
					"{C:tarot}타로{} 카드들을 복제해 생성합니다",
					"{C:inactive}(모든 에디션은 사라집니다){}",
					" ",
					"{C:attention}블라인드{} 선택 시 덱의 {C:attention}플레잉 카드{}",
					"{C:attention}#1#{}장을 무작위로 파괴합니다",
				},
			},
			--#endregion
			--#region Burning Abyss
			j_joy_ba_alich = {
				name = "{C:joy_effect}피안의 악귀 아리키노",
				text = {
					"{C:attention}블라인드{} 선택 시 요구 점수를",
					"{C:red}#1#%{} 감소시킵니다",
					" ",
					"{C:joy_normal}악마족{} 이외의 {C:joy_normal}몬스터{} 조커를 보유했을경우",
					"{C:attention}블라인드{}를 선택할 때 파괴됩니다",
				},
			},
			j_joy_ba_barbar = {
				name = "{C:joy_effect}피안의 악귀 바르바릿챠",
				text = {
					"{C:mult}+#1#{} 배수",
					"{C:attention}묘지{}에 있는 {C:joy_normal}악마족{} 조커 한 장",
					"마다 {C:mult}+#2#{} 배수를 획득합니다",
					"{C:inactive}(현재 총{} {C:mult}+#3#{} {C:inactive}배수){}",
					" ",
					"{C:joy_normal}악마족{} 이외의 {C:joy_normal}몬스터{} 조커를 보유했을경우",
					"{C:attention}블라인드{}를 선택할 때 파괴됩니다",
				},
			},
			j_joy_ba_cagna = {
				name = "{C:joy_effect}피안의 악귀 하로우하운드",
				text = {
					"칩 {C:chips}+#1#{} 개",
					"{C:attention}블라인드{} 선택 시 {C:attention}묘지{}에 무작위한",
					"{C:joy_normal}악마족{} 조커를 {C:attention}#2#{}장 생성합니다",
					" ",
					"{C:joy_normal}악마족{} 이외의 {C:joy_normal}몬스터{} 조커를 보유했을경우",
					"{C:attention}블라인드{}를 선택할 때 파괴됩니다",
				},
			},
			j_joy_ba_calcab = {
				name = "{C:joy_effect}피안의 악귀 하클스파",
				text = {
					"핸드 크기 {C:attention}+#1#{}장",
					" ",
					"{C:joy_normal}악마족{} 이외의 {C:joy_normal}몬스터{} 조커를 보유했을경우",
					"{C:attention}블라인드{}를 선택할 때 파괴됩니다",
				},
			},
			j_joy_ba_cir = {
				name = "{C:joy_effect}피안의 악귀 가토르호그",
				text = {
					"{X:mult,C:white}X#1#{} 배수",
					"",
					"{C:attention}블라인드{} 선택시",
					"{C:joy_normal}\"피안\"{} 조커 {C:attention}#2#{}장을 {C:attention}소생{}시킵니다",
					"",
					"{C:joy_normal}악마족{} 이외의 {C:joy_normal}몬스터{} 조커를 보유했을경우",
					"{C:attention}블라인드{}를 선택할 때 파괴됩니다",
				},
			},
			j_joy_ba_draghig = {
				name = "{C:joy_effect}피안의 악귀 드라고넬",
				text = {
					"각 {C:joy_normal}악마족{} 조커가 칩 {C:chips}+#1#{}개를 부여합니다",
					" ",
					"소환 시 무작위한 {C:joy_spell}스페셜{} 조커가 아닌",
					"{C:joy_normal}\"피안\"{} 조커를 {C:attention}#2#{}장 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
					" ",
					"{C:joy_normal}악마족{} 이외의 {C:joy_normal}몬스터{} 조커를 보유했을경우",
					"{C:attention}블라인드{}를 선택할 때 파괴됩니다",
				},
			},
			j_joy_ba_farfa = {
				name = "{C:joy_effect}피안의 악귀 퍼파렐",
				text = {
					"소환 시 라운드의 끝 까지 다른 무작위",
					"조커 {C:attention}#1#{}장을 {C:attention}제외{}시킵니다",
					" ",
					"{C:joy_normal}악마족{} 이외의 {C:joy_normal}몬스터{} 조커를 보유했을경우",
					"{C:attention}블라인드{}를 선택할 때 파괴됩니다",
				},
			},
			j_joy_ba_graff = {
				name = "{C:joy_effect}피안의 악귀 그래바스니치",
				text = {
					"각 {C:joy_normal}악마족{} 조커가 {C:mult}+#1#{} 배수를 부여합니다",
					" ",
					"소환 시 무작위한 {C:joy_spell}스페셜{} {C:joy_normal}\"피안\"{}",
					"조커를 {C:attention}#2#{}장을 생성합니다",
					"{C:inactive}(자리가 있어야 합니다){}",
					" ",
					"{C:joy_normal}악마족{} 이외의 {C:joy_normal}몬스터{} 조커를 보유했을경우",
					"{C:attention}블라인드{}를 선택할 때 파괴됩니다",
				},
			},
			j_joy_ba_libic = {
				name = "{C:joy_effect}피안의 악귀 리비옷코",
				text = {
					"{C:joy_normal}악마족{} 이외의 {C:joy_normal}몬스터{} 조커를 보유했을경우",
					"{C:attention}블라인드{}를 선택할 때 이 카드를 파괴하고",
					"{C:joy_normal}악마족{} 조커 {C:attention}#1#{}장을 {C:attention}소생{}시킵니다",
					"{s:0.9,C:inactive}(이 효과는 이 카드를 판매할 때도 발동됩니다)",
				},
			},
			j_joy_ba_rubic = {
				name = "{C:joy_effect}피안의 악귀 라비캔트",
				text = {
					"{C:joy_normal}악마족{} 이외의 {C:joy_normal}몬스터{} 조커를 보유했을경우",
					"{C:attention}블라인드{}를 선택할 때 이 카드를 파괴하고",
					"무작위한 {C:joy_spell}엑스트라 덱{} {C:joy_normal}\"피안\"{} 조커",
					"{C:attention}#1#{}장을 {C:joy_spell}엑스트라 덱{}에 생성합니다",
					"{s:0.9,C:inactive}(이 효과는 이 카드를 판매할 때도 발동됩니다)",
				},
			},
			j_joy_ba_scarm = {
				name = "{C:joy_effect}피안의 악귀 스칼라마리온",
				text = {
					"{C:joy_normal}악마족{} 이외의 {C:joy_normal}몬스터{} 조커를 보유했을경우",
					"{C:attention}블라인드{}를 선택할 때 이 카드를 파괴하고, 무작위한",
					"{C:joy_normal}메인 덱 악마족{} 조커 {C:attention}#1#{}장을 생성합니다",
					"{C:inactive}(자리가 있어야 합니다)",
					"{s:0.9,C:inactive}(이 효과는 이 카드를 판매할 때도 발동됩니다)",
				},
			},
			j_joy_ba_malacoda = {
				name = "{C:joy_ritual}피안의 귀신 헬레이카",
				text = {
					"{C:attention}묘지{}의 {C:joy_normal}악마족{} 한 장마다",
					"{X:mult,C:white}X#1#{} 배수를 획득합니다",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
					" ",
					"{C:joy_normal}\"피안\"{} 조커가 자기 자신을 파괴하지 않습니다",
				},
				joy_summon_conditions = {
					"{C:joy_normal}악마족{} {C:attention}1{}장을 포함한 {C:attention}조커 2{}장",
				},
			},
			j_joy_ba_cherubini = {
				name = "{C:joy_link}피안의 흑천사 케루비니",
				text = {
					"{C:attention}블라인드{} 선택 시 무작위한 {C:joy_normal}\"피안\"{}",
					"조커 {C:attention}#1#{}장을 {C:attention}묘지{}에 생성합니다",
					" ",
					"{C:joy_normal}\"피안\"{} 조커가 자기 자신을 파괴하지 않습니다",
				},
				joy_summon_conditions = {
					"{C:joy_normal}악마족{} {C:attention}2{}장",
				},
			},
			j_joy_ba_dante = {
				name = "{C:joy_xyz}피안의 여행자 단테",
				text = {
					"{C:attention}묘지{}의 {C:joy_normal}악마족{} 한 장마다",
					"{C:mult}+#1#{} 배수를 획득합니다",
					"{C:inactive}(현재{} {C:mult}+#2#{} {C:inactive}배수){}",
					" ",
					"{C:joy_xyz}엑시즈{} {C:attention}#3#{}: {C:attention}묘지{}에",
					"무작위한 조커 {C:attention}#4#{}장을 생성합니다",
					" ",
					"{C:joy_normal}\"피안\"{} 조커가 자기 자신을 파괴하지 않습니다",
				},
				joy_summon_conditions = {
					"{C:blue}일반{} 조커 {C:attention}2{}장",
				},
			},
			j_joy_ba_pilgrim = {
				name = "{C:joy_fusion}피안의 순례자 단테",
				text = {
					"핸드 {C:blue}+#1#{}",
					"버리기 {C:red}+#2#{}",
					" ",
					"{C:joy_normal}\"피안\"{} 조커가 자기 자신을 파괴하지 않습니다",
				},
				joy_summon_conditions = {
					"이름이 다른 {C:joy_normal}\"피안\"{} 조커 {C:attention}3{}장",
				},
			},
			j_joy_ba_virgil = {
				name = "{C:joy_synchro}피안의 시인 베르기리우스",
				text = {
					"소환 시 영구히 핸드 크기를 {C:attention}+#1#{}장 늘립니다",
					" ",
					"{C:joy_normal}\"피안\"{} 조커가 자기 자신을 파괴하지 않습니다",
				},
				joy_summon_conditions = {
					"{C:joy_synchro}튜너{} {C:attention}1{}장 +",
					"{C:joy_synchro}튜너{}가 아닌 {C:joy_normal}악마족{} 조커 {C:attention}1{}장",
				},
			},
			j_joy_ba_beatrice = {
				name = "{C:joy_xyz}영원의 숙녀 베아트리체",
				text = {
					"{C:attention}묘지{}에 있는 조커 한 장 마다 {X:mult,C:white}X#1#{} 배수를 얻습니다",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
					" ",
					"{C:joy_xyz}엑시즈{} {C:attention}#3#{}: {C:joy_normal}\"피안\"{} 조커 (없을시 임의의 조커)",
					"{C:attention}#4#{}장을 {C:attention}소생{}시킵니다",
					" ",
					"소환된 이 카드를 판매 시 {C:joy_xyz}\"피안의 여행자 단테\"{}와",
					"{C:joy_fusion}\"피안의 순례자 단테\"{}를 {C:joy_spell}엑스트라 덱{}에 넣습니다",
					"{C:inactive}(자리가 있어야 합니다){}",
					" ",
					"{C:joy_normal}\"피안\"{} 조커가 자기 자신을 파괴하지 않습니다",
				},
				joy_summon_conditions = {
					"{C:red}레어{} 조커 {C:attention}2{}장",
					"혹은 {C:joy_normal}\"단테\" {C:attention}1{}장",
					"{s:0.9,C:inactive}(엑시즈일경우, 소재를 이 카드로 옮깁니다)",
				},
			},
			--#endregion
			--#region Labrynth
			j_joy_lab_clock = {
				name = "{C:joy_effect}라뷰린스 쿠클락",
				text = {
					"이 카드를 {C:attention}릴리스{}해 손패의 무작위 카드 {C:attention}#1#{}장을",
					"{C:attention}뒷면{}으로 뒤집고 패를 섞을수 있습니다",
					" ",
					"이 효과로 뒤집힌 카드들에게",
					"영구히 {C:mult}+#2#{} 배수를 부여합니다",
					" ",
					"그 후, {C:blue}일반{} {C:joy_normal}\"라뷰린스\"{} 조커를",
					"{C:attention}#3#{}장까지 {C:attention}소생{}시킵니다",
				},
			},
			j_joy_lab_stovie = {
				name = "{C:joy_effect}라뷰린스 스토피",
				text = {
					"이 카드와 다른 조커 한 장을 {C:attention}릴리스{}해",
					"손패의 무작위 카드 {C:attention}#1#{}장을",
					"{C:attention}뒷면{}으로 뒤집고 패를 섞을수 있습니다",
					" ",
					"이 효과로 뒤집힌 카드들에게",
					"영구히 칩 {C:chips}+#2#{}개를 부여합니다",
					" ",
					"이 효과로 {C:joy_normal}악마족{}을",
					"릴리스했을 경우, {C:money}+$#3#{}",
				},
			},
			j_joy_lab_changdra = {
				name = "{C:joy_effect}라뷰린스 샹드라",
				text = {
					"이 카드와 다른 조커 한 장을 {C:attention}릴리스{}해",
					"손패의 무작위 카드 {C:attention}#1#{}장을 {C:attention}뒷면{}으로",
					"뒤집고 패를 섞을수 있습니다",
					" ",
					"이 효과로 뒤집힌 카드들에게",
					"영구히 {C:money}+$#2#{}를 부여합니다",
					" ",
					"이 효과로 {C:joy_normal}악마족{}을 릴리스했을",
					"경우, 무작위한 태그 {C:attention}#3#{}개를 얻습니다",
				},
			},
			j_joy_lab_ariane = {
				name = "{C:joy_effect}라뷰린스 서번츠 아리안느",
				text = {
					"라운드 도중 플레잉 카드를 {C:attention}뒤집으면{}",
					"다음 {C:attention}블라인드{} 동안의 손패",
					"크기를 {C:attention}+#1#{}장 증가시킵니다",
					" ",
					"한 라운드 안에 {C:attention}#2#{}장 이상의",
					"카드를 뒤집었을경우, 다음 상점에 {C:green}희귀",
					"{C:joy_normal}\"라뷰린스\"{} 한 장을 추가합니다",
					"{s:0.9,C:inactive}(현재 #3#장)",
				},
			},
			j_joy_lab_arianna = {
				name = "{C:joy_effect}라뷰린스 서번츠 아리안나",
				text = {
					"라운드 도중 플레잉 카드를 {C:attention}뒤집으면{}",
					"다음 {C:attention}블라인드{} 동안의 손패",
					"크기를 {C:attention}+#1#{}장 증가시킵니다",
					" ",
					"한 라운드 안에 {C:attention}#2#{}장 이상의",
					"카드를 뒤집었을경우, 다음 상점에 {C:blue}일반",
					"{C:joy_normal}\"라뷰린스\"{} 한 장을 추가합니다",
					"{s:0.9,C:inactive}(현재 #3#장)",
				},
			},
			j_joy_lab_arias = {
				name = "{C:joy_effect}라뷰린스 버틀러 아리아스",
				text = {
					"플레잉 카드를 {C:attention}뒷면으로 뒤집으면{} 이 카드의",
					"칩 획득량이 {C:chips}+#1#{}개 증가합니다",
					"{C:inactive}(현재 칩{} {C:chips}+#2# {C:inactive}개){}",
					" ",
					"한 라운드 안에 {C:attention}#3#{}장 이상의",
					"카드를 뒤집었을경우, 다음 상점에 {C:red}레어{}",
					"{C:joy_normal}\"라뷰린스\"{} 한 장을 추가합니다",
					"{s:0.9,C:inactive}(현재 #4#장)",
					" ",
					"{C:joy_normal}\"라뷰린스\"{} 보유시 무료",
				},
			},
			j_joy_lab_archfiend = {
				name = "{C:joy_effect}라뷰린스 데몬",
				text = {
					"{C:attention}묘지{}에 있는 {C:joy_normal}악마족{} 조커",
					"하나마다 {C:mult}+#1#{} 배수를 획득합니다",
					"{C:inactive}(현재{} {C:mult}+#2# {C:inactive}배수){}",
					" ",
					"플레잉 카드가 {C:attention}뒤집힐때{}, 무작위한",
					"다른 카드를 {C:attention}뒷면으로 뒤집고{} 패를 섞습니다",
				},
			},
			j_joy_lab_lovely = {
				name = "{C:joy_effect}백은 성의 라뷰린스",
				text = {
					"{C:green}#1#/#2#{} 확률로 카드가 뒤집혀 드로우됩니다",
					"{C:joy_normal}악마족{} 조커를 많이 보유 할 수록 확률이 증가합니다",
					" ",
					"플레잉 카드를 {C:attention}뒷면으로 뒤집으면{} 이",
					"카드의 배수 획득량이 {C:mult}+#3#{}개 증가합니다",
					"{C:inactive}(현재{} {C:mult}+#4# {C:inactive}배수){}",
				},
			},
			j_joy_lab_lady = {
				name = "{C:joy_effect}레이디 오브 더 라뷰린스",
				text = {
					"라운드 도중 플레잉 카드를 {C:attention}뒤집을 때마다{}",
					"이 카드의 배수 획득량이 {X:mult,C:white}X#1#{} 증가합니다",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
					" ",
					"{C:joy_trap}함정{}이 아닌 {C:joy_normal}악마족{} 조커들의",
					"지속 효과는 뒷면일때도 처리됩니다",
					"{s:0.9,C:inactive}(이 카드 포함)",
				},
			},
			j_joy_lab_labyrinth = {
				name = "{C:joy_spell}라뷰린스 래버린스",
				text = {
					"{C:attention}조커{}가 뒤집힐 때마다 {C:money}+$#1#{}",
					" ",
					"플레잉 카드가 {C:attention}뒤집힐 때{} {C:green}#2#/#3#{} 확률로",
					"손패의 무작위한 카드 {C:attention}#4#{}장을",
					"{C:attention}뒷면으로 뒤집고{} 패를 섞습니다",
				},
			},
			--#endregion
			--#region Subterror
			j_joy_sub_fiendess = {
				name = "{C:joy_effect}서브테러의 요마",
				text = {
					"한 라운드에 한번, 이 카드와 다른 {C:attention}조커{}를",
					"뒷면으로 {C:attention}뒤집어{} {C:joy_normal}\"서브테러\"{} 카드를",
					"{C:dark_edition}네거티브{}를 부여해 {C:attention}소생{}시킬수 있습니다",
				},
			},
			j_joy_sub_defender = {
				name = "{C:joy_effect}서브테러의 도장",
				text = {
					"각 뒷면 {C:attention}조커{}와 {C:joy_normal}\"서브테러\"{} 조커",
					"한 장마다 칩 {C:chips}+#1#{}개를 획득합니다",
					"{C:inactive}(현재 칩{} {C:chips}+#2#{} {C:inactive}개){}",
					" ",
					"이 카드를 판매하면 모든 카드를",
					"앞면으로 {C:attention}뒤집습니다{}",
				},
			},
			j_joy_sub_archer = {
				name = "{C:joy_effect}서브테러의 사수",
				text = {
					"한 앤티에 한번, 이 카드와 다른 {C:attention}조커{}를",
					"뒷면으로 {C:attention}뒤집어{} 무작위한 {C:blue}일반{} 혹은",
					"{C:green}희귀{} {C:joy_normal}\"서브테러\"를",
					"네거티브를 부여해 생성할 수 있습니다",
				},
			},
			j_joy_sub_warrior = {
				name = "{C:joy_effect}서브테러의 전사",
				text = {
					"이 카드와 다른 {C:attention}조커{}를 {C:attention}릴리스{}해",
					"{C:joy_normal}\"서브테러마리스\"{} 카드를 {C:attention}#1#{}장 {C:attention}소생{}시킵니다",
					"만약 한 장도 없을경우,",
					"대신 {C:joy_normal}\"서브테러\"{}카드를 {C:attention}소생{}시킵니다",
					" ",
					"{C:joy_effect}리버스{}: {C:attention}묘지{}에 무작위한",
					"{C:joy_normal}\"서브테러마리스\"{} 카드를 생성합니다",
				},
			},
			j_joy_sub_guru = {
				name = "{C:joy_effect}서브테러의 도사",
				text = {
					"한 {C:attention}블라인드{}에 한번, 이 카드와",
					"다른 {C:attention}조커 #1#{}장을 뒷면으로 {C:attention}뒤집어{}",
					"아래의 효과를 발동시킬수 있습니다:",
					"이 라운드 동안, 각 {C:attention}뒷면{} 조커마다 {X:mult,C:white}X#2#{} 배수를 얻고",
					"{C:attention}앞면{} 조커마다 핸드 크기를 {C:attention}+#3#{}장 늘립니다",
					"{s:0.9,C:inactive}(뒷면일 경우에도 발동합니다)",
					" ",
					"{C:joy_effect}리버스{}: 무작위한 {C:blue}일반{} 또는 {C:green}희귀{}",
					"{C:joy_normal}\"서브테러\" 카드를 생성합니다",
					"{C:inactive}(공간이 있어야 합니다)",
					" ",
					"{C:attention}블라인드{} 선택 시 앞면으로 {C:attention}뒤집힙니다{}",
					"{s:0.9,C:inactive}(뒷면일 경우에도 발동합니다)",
				},
			},
			j_joy_sub_stygo = {
				name = "{C:joy_effect}서브테러마리스 아쿠에드리아",
				text = {
					"{C:joy_effect}리버스{}: 이 라운드 동안 {C:attention}뒷면{}으로",
					"뒤집힌 카드가 {X:mult,C:white}X#1#{} 배수를 부여합니다",
					" ",
					"소환 시 뒷면으로 {C:attention}뒤집힙니다{}",
					"{C:attention}보스 블라인드{}에 승리할시 {C:attention}뒤집힙니다{}",
					"{s:0.9,C:inactive}(뒷면일 경우에도 발동합니다)",
				},
			},
			j_joy_sub_drago = {
				name = "{C:joy_effect}서브테러마리스 아루라본",
				text = {
					"{C:joy_effect}리버스{}: 무작위 {C:joy_normal}\"서브테러\"{} 또는 뒷면",
					"{C:attention}조커{}에 무작위한 에디션을 부여합니다",
					" ",
					"소환 시 뒷면으로 {C:attention}뒤집힙니다{}",
					"{C:attention}보스 블라인드{}에 승리할시 {C:attention}뒤집힙니다{}",
					"{s:0.9,C:inactive}(뒷면일 경우에도 발동합니다)",
				},
			},
			j_joy_sub_uma = {
				name = "{C:joy_effect}서브테러마리스 리그리어드",
				text = {
					"{C:joy_effect}리버스{}: 다른 {C:attention}조커 #1#{}장을 {C:attention}블라인드{}를",
					"선택할때까지 {C:attention}제외{}시킵니다",
					" ",
					"소환 시 뒷면으로 {C:attention}뒤집힙니다{}",
					"{C:attention}보스 블라인드{}에 승리할시 {C:attention}뒤집힙니다{}",
					"{s:0.9,C:inactive}(뒷면일 경우에도 발동합니다)",
				},
			},
			j_joy_sub_phos = {
				name = "{C:joy_effect}Subterror Behemoth Phospheroglacier",
				text = {
					"{C:chips}+#1#{} Chips for each {C:joy_normal}\"Subterror\"{} or {C:joy_normal}Aqua{} in the {C:attention}GY{}",
					"{C:inactive}(현재{} {C:chips}+#2#{} {C:inactive}Chips){}",
					" ",
					"{C:joy_effect}리버스{}: Send {C:attention}#3#{} {C:joy_normal}\"Subterror\"{} to the {C:attention}GY{}",
					" ",
					"소환 시 뒷면으로 {C:attention}뒤집힙니다{}",
					"{C:attention}보스 블라인드{}에 승리할시 {C:attention}뒤집힙니다{}",
					"{s:0.9,C:inactive}(뒷면일 경우에도 발동합니다)",
				},
			},
			j_joy_sub_volt = {
				name = "{C:joy_effect}Subterror Behemoth Voltelluric",
				text = {
					"뒷면인 카드 한 장 마다",
					"{C:mult}+#1#{} 배수를 획득합니다",
					"{C:inactive}(현재{} {C:mult}+#2#{} {C:inactive}배수){}",
					" ",
					"{C:joy_effect}리버스{}: 손패의 모든 카드를",
					"뒷면으로 {C:attention}뒤집은뒤{} 섞습니다",
					" ",
					"소환 시 뒷면으로 {C:attention}뒤집힙니다{}",
					"{C:attention}보스 블라인드{}에 승리할시 {C:attention}뒤집힙니다{}",
					"{s:0.9,C:inactive}(뒷면일 경우에도 발동합니다)",
				},
			},
			j_joy_sub_stala = {
				name = "{C:joy_effect}서브테러마리스 지브라타르",
				text = {
					"{C:joy_effect}리버스{}: 카드 {C:attention}#1#{}장을",
					"뒷면으로 뒤집힌채로 뽑습니다",
					" ",
					"소환 시 뒷면으로 {C:attention}뒤집힙니다{}",
					"{C:attention}보스 블라인드{}에 승리할시 {C:attention}뒤집힙니다{}",
					"{s:0.9,C:inactive}(뒷면일 경우에도 발동합니다)",
				},
			},
			j_joy_sub_speleo = {
				name = "{C:joy_effect}서브테러마리스 엘가우스트",
				text = {
					"이 카드의 배수 획득량은 카드가",
					"{C:attention}뒤집힐 때마다{} {X:mult,C:white}X#1#{}씩 증가합니다",
					"{s:0.9,C:inactive}(뒷면일 경우에도 증가합니다)",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
					" ",
					"{C:joy_effect}리버스{}: 다른 모든 {C:attention}조커{}를",
					"{C:attention}앞면으로{} 뒤집습니다",
					" ",
					"소환 시 뒷면으로 {C:attention}뒤집힙니다{}",
					"{C:attention}보스 블라인드{}에 승리할시 {C:attention}뒤집힙니다{}",
					"{s:0.9,C:inactive}(뒷면일 경우에도 발동합니다)",
				},
			},
			j_joy_sub_ultra = {
				name = "{C:joy_effect}서브테러마리스 바레스애시",
				text = {
					"뒷면인 카드 한 장 마다",
					"칩 {C:mult}+#1#{}개를 획득합니다",
					"{C:inactive}(현재 칩{} {C:mult}+#2#{} {C:inactive}개){}",
					" ",
					"{C:joy_effect}리버스{}: 다른 모든 {C:attention}조커{}를",
					"{C:attention}뒷면으로{} 뒤집습니다",
					" ",
					"소환 시 뒷면으로 {C:attention}뒤집힙니다{}",
					"{C:attention}보스 블라인드{}에 승리할시 {C:attention}뒤집힙니다{}",
					"{s:0.9,C:inactive}(뒷면일 경우에도 발동합니다)",
				},
			},
			j_joy_sub_befiendess = {
				name = "{C:joy_link}서브테러마리스의 요마",
				text = {
					"이 카드의 소환에 사용된 소재 한 장마다",
					"칩 {C:chips}+#1#{}개를 획득합니다",
					"소환에 사용된 {C:joy_normal}\"서브테러\" 한 장마다",
					"{C:mult}+#2#{} 배수 를 획득합니다",
					"{C:inactive}(현재 칩{} {C:chips}+#3#{} {C:inactive}개, {C:mult}+#4#{} {C:inactive}배수){}",
					" ",
					"한 라운드에 한 번, {C:attention}조커 #5#{}장을 뒷면으로 {C:attention}뒤집어{}",
					"무작위한 {C:joy_normal}\"서브테러마리스\"{} {C:attention}#6#{}장을 소환할 수 있습니다",
					"{C:inactive}(공간이 있어야 합니다){}",
				},
				joy_summon_conditions = {
					"뒷면인 {C:attention}조커 2{}장 이상",
				},
			},
			j_joy_sub_city = {
				name = "{C:joy_spell}지중계 샴발라",
				text = {
					"한 라운드당 한번, {C:attention}조커{}를 {C:attention}뒤집을수{} 있습니다",
					" ",
					"{C:joy_normal}몬스터{} {C:attention}조커{}가 {C:attention}뒷면{}으로 뒤집히거나",
					"{C:joy_normal}몬스터{}가 아닌 {C:attention}조커{}가 {C:attention}앞면{}으로 뒤집히면",
					"{C:money}+$#1#{}를 획득합니다",
				},
			},
			--#endregion
			--#region Eldlich
			j_joy_eld_eldlich = {
				name = "{C:joy_effect}황금경 엘드리치",
				text = {
					"{C:attention}황금{} 카드가 득점할때마다 보유한 또는",
					"{C:attention}묘지{}에 있는 {C:attention}언데드족{} 한 장 마다",
					"{C:money}+$#1#{}를 획득합니다",
					" ",
					"점수 계산 후, 득점한 모든 카드를",
					"{C:attention}황금{} 카드로 바꿉니다",
					" ",
					"한 라운드에 한 번, {C:joy_normal}언데드족{} 또는 {C:joy_trap}함정{}",
					"{C:attention}조커 #2#{}장을 {C:attention}릴리스{}해 {C:joy_normal}메인 덱{}",
					"{C:joy_normal}\"황금향\"{} 조커를 {C:attention}#3#{}장 {C:attention}생성{}할 수 있습니다",
					"{C:inactive}(공간이 있어야 합니다){}",
				},
			},
			j_joy_eld_conq = {
				name = "{C:joy_trap}황금향의 콘키스타도르",
				text = {
					"{C:attention}황금{} 카드가 득점할때마다 보유한 또는",
					"{C:attention}묘지{}에 있는 {C:attention}언데드족{} 한 장 마다",
					"칩 {C:chips}+#1#{}개를 획득합니다",
					" ",
					"{C:joy_normal}\"엘드리치\"{}를 보유했을경우,",
					"손패에 남은 카드를 포함한",
					"모든 {C:attention}강화된 카드{}를 다시 발동시킵니다",
					" ",
					"{C:joy_effect}리버스{}: 이 라운드 동안",
					"버리기 횟수를 {C:red}+#2#{}번 얻습니다",
				},
			},
			j_joy_eld_guard = {
				name = "{C:joy_trap}황금향의 가디언",
				text = {
					"{C:attention}황금{} 카드가 득점할때마다 보유한 또는",
					"{C:attention}묘지{}에 있는 {C:attention}언데드족{} 한 장 마다",
					"{C:mult}+#1#{} 배수를 획득합니다",
					" ",
					"{C:joy_normal}\"엘드리치\"{}를 보유했을경우,",
					"손패에 남은 카드를 포함한",
					"모든 {C:attention}강화된 카드{}를 다시 발동시킵니다",
					" ",
					"{C:joy_effect}리버스{}: 이 라운드 동안",
					"핸드를 {C:red}+#2#{}번 얻습니다",
				},
			},
			j_joy_eld_huaq = {
				name = "{C:joy_trap}황금향의 와케로",
				text = {
					"{C:attention}황금{} 카드가 득점할때마다 보유한 또는",
					"{C:attention}묘지{}에 있는 {C:attention}언데드족{} 한 장 마다",
					"칩 {C:chips}+#1#{}개를 획득합니다",
					" ",
					"{C:joy_normal}\"엘드리치\"{}를 보유했을경우,",
					"손패에 남은 카드를 포함한",
					"모든 {C:attention}강화된 카드{}를 다시 발동시킵니다",
					" ",
					"{C:joy_effect}리버스{}: 라운드의 종료 시 {C:attention}블라인드{}를 선택할때까지",
					"{C:joy_normal}언데드{}족 {C:attention}조커 #2#{}장을 {C:attention}제외{}합니다",
				},
			},
			j_joy_eld_exalted = {
				name = "{C:joy_trap}고귀한 황금향의 엘드릭시르",
				text = {
					"{C:attention}황금{} 카드가 득점할때마다 보유한 또는",
					"{C:attention}묘지{}에 있는 {C:attention}언데드족{} 한 장 마다",
					"{C:mult}+#1#{} 배수를 획득합니다",
					" ",
					"{C:joy_normal}\"엘드리치\"{}를 보유했을경우,",
					"손패에 남은 카드를 포함한",
					"모든 {C:attention}강화된 카드{}를 다시 발동시킵니다",
					" ",
					"{C:joy_effect}리버스{}: {C:joy_normal}\"황금향\"{} 조커",
					"{C:attention}#2#{}장을 {C:attention}소생{}시킵니다",
					"한 장도 없을경우 대신",
					"{C:joy_trap}함정{} 조커를 {C:attention}소생{}시킵니다",
				},
			},
			j_joy_eld_mad = {
				name = "{C:joy_fusion}엘 레이 콘키스타 엘드리치",
				text = {
					"{C:attention}황금{} 카드가 득점할때마다 보유한 또는",
					"{C:attention}묘지{}에 있는 {C:attention}언데드족{} 한 장 마다",
					"{X:mult,C:white}X#1#{} 배수를 획득합니다",
					" ",
					"모든 카드는 득점 후 {C:attention}황금{} 카드로 바뀝니다",
					" ",
					"{C:joy_trap}함정{} 조커가 자신의 효과로 {C:attention}뒤집히지{}",
					"않지만 {C:joy_effect}리버스{} 효과는 발동합니다",
				},
				joy_summon_conditions = {
					"{C:attention}\"엘드리치\"{} {C:attention}1{}장 + {C:attention}언데드족{} {C:attention}1{}장",
				},
			},
			j_joy_eld_angel = {
				name = "{C:joy_fusion}황금향의 앙헬카이도",
				text = {
					"{C:attention}엘드릭시르{}를 낼수있습니다",
					" ",
					"{C:joy_trap}함정{} 조커의 {C:joy_effect}리버스{} 효과가",
					"발동할때마다 {C:attention}엘드릭시르{}의 레벨을",
					"업그레이드합니다",
					" ",
					"플레이한 핸드에 {C:attention}엘드릭시르{} 포함 시",
					"{C:attentoin}묘지{}에 {C:joy_effect}\"황금경 엘드리치\"{} {C:attention}#1#{}장을 생성합니다",
					" ",
					"소환된 이 카드가 {C:attention}묘지{}로 갈 경우",
					"{C:joy_normal}\"엘드리치\"{} 조커를 {C:dark_edition}네거티브{}를 부여해",
					"{C:attention}#2#{}장 {C:attention}소생{}시킵니다",
				},
				joy_summon_conditions = {
					"{C:joy_trap}함정{}을 포함한 {C:attention}조커 2{}장",
				},
			},
			--#endregion
			--#region @이그니스터
			j_joy_ignis_achichi = {
				name = "{C:joy_effect}아치치＠이그니스터",
				text = {
					"{C:mult}+#1#{} 배수",
					" ",
					"소환 시 무작위한",
					"{C:blue}일반 {C:joy_normal}\"@이그니스터\"",
					"카드를 {C:attention}#2#{}장 생성합니다",
					"{C:inactive}(공간이 있어야 합니다){}",
				},
			},
			j_joy_ignis_pikari = {
				name = "{C:joy_effect}피카리@이그니스터",
				text = {
					"라운드 종료 시",
					"{C:money}+$#1#{}를 획득합니다",
					" ",
					"소환시 무작위한 {C:tarot}타로{} 카드를",
					"{C:attention}#2#{}장 생성합니다",
					"{C:inactive}(공간이 있어야 합니다){}",
				},
			},
			j_joy_ignis_hiyari = {
				name = "{C:joy_effect}히야리@이그니스터",
				text = {
					"손패 크기 {C:attention}+#1#{}장",
					" ",
					"한 라운드당 한 번, {C:joy_normal}사이버스족{}",
					"조커를 {C:attention}#2#{}장 {C:attention}릴리스{}해",
					"무작위한 {C:green}희귀{} {C:joy_normal}\"@이그니스터\"",
					"카드 {C:attention}#3{}장을 생성할 수 있습니다",
					"{C:inactive}(공간이 있어야 합니다){}",
					" ",
					"{C:joy_normal}\"@이그니스터\" 보유시 무료",
				},
			},
			j_joy_ignis_bururu = {
				name = "{C:joy_effect}부르르@이그니스터",
				text = {
					"소환 시 {C:attention}묘지에{} {C:joy_normal}\"@이그니스터\"{}",
					"카드 {C:attention}#1#{}장을 생성합니다",
					" ",
					"{C:joy_normal}사이버스족{} 카드의 {C:attention}소재{}로 사용될 시",
					"{C:joy_normal}메인 덱 \"@이그니스터\"{} {C:attention}#2#{}장을",
					"{C:dark_edition}네거티브{}를 부여해 {C:attention}소생{}시킵니다",
				},
			},
			j_joy_ignis_doshin = {
				name = "{C:joy_effect}드싱@이그니스터",
				text = {
					"칩 {C:chips}+#1#{}개",
					" ",
					"{C:joy_normal}사이버스족{} 카드의 {C:attention}소재{}로 사용될 시",
					"{C:joy_spell}엑스트라 덱 \"@이그니스터\"{}",
					"{C:attention}#2#{}장을 {C:attention}소생{}시킵니다",
				},
			},
			j_joy_ignis_gatchiri = {
				name = "{C:joy_effect}갓치리@이그니스터",
				text = {
					"{X:mult,C:white}X#1#{} 배수를 획득합니다",
					" ",
					"{C:joy_link}링크{} 소환의 소재 한 장을",
					"대체할 수 있습니다",
					" ",
					"이 카드를 {C:attention}소재{}로 한 {C:joy_normal}사이버스족{}",
					"카드는 아래의 효과를 얻습니다:",
					"{s:0.9}뒷면으로 {s:0.9,C:attention}뒤집히거나{s:0.9} 디버프될수 없습니다",
				},
				joy_transfer_ability = {
					"뒷면으로 {C:attention}뒤집히거나{} 디버프될수 없습니다",
				},
			},
			j_joy_ignis_gussari = {
				name = "{C:joy_effect}굿사리@이그니스터",
				text = {
					"{C:mult}+#1#{} 배수",
					" ",
					"{C:joy_link}링크{} 소환의 소재 한 장을",
					"대체할 수 있습니다",
					" ",
					"이 카드를 {C:attention}소재{}로 한 {C:joy_normal}사이버스족{}",
					"카드는 아래의 효과를 얻습니다:",
					"{s:0.9,C:attention}소재{s:0.9} 한 장 마다 {s:0.9,C:mult}+#1#{} 배수",
				},
				joy_transfer_ability = {
					"{C:attention}소재{} 한 장 마다 {C:mult}+#1#{} 배수",
					"{C:inactive}(현재 {C:mult}+#2#{} 배수{C:inactive})",
				},
			},
			j_joy_ignis_danmari = {
				name = "{C:joy_effect}단마리@이그니스터",
				text = {
					"{C:joy_link}링크{} 소환의 소재 한 장을",
					"대체할 수 있습니다",
					" ",
					"이 카드를 {C:attention}소재{}로 한 {C:joy_normal}사이버스족{}",
					"카드는 아래의 효과를 얻습니다:",
					"{s:0.9,C:attention}블라인드{s:0.9}의 요구 점수를 {s:0.9,C:red}#1#%{s:0.9} 낮춥니다",
				},
				joy_transfer_ability = {
					"{C:attention}블라인드{}의 요구 점수를 {C:red}#1#%{} 낮춥니다",
				},
			},
			j_joy_ignis_doyon = {
				name = "{C:joy_effect}드용@이그니스터",
				text = {
					"소환 시 {C:joy_normal}메인 덱 \"@이그니스터\"{}",
					"{C:attention}#1#{}장을 {C:attention}소생{}시킵니다",
					" ",
					"{C:joy_normal}사이버스족{}의 {C:attention}소재{}로 사용될 시",
					"{C:joy_spell}엑스트라 덱{}에 무작위한 {C:joy_normal}\"@이그니스터\"{}",
					"{C:attention}#2#{}장을 생성합니다",
				},
			},
			j_joy_ignis_donyoribo = {
				name = "{C:joy_effect}덩요리보@이그니스터",
				text = {
					"{C:joy_normal}\"@이그니스터\"{}를 구매할때마다",
					"{C:money}+$#1#{}를 획득합니다",
					" ",
					"이 카드를 판매해",
					"{C:attention}블라인드{}를 선택할때까지",
					"{C:joy_normal}\"@이그니스터\"{} 카드를 {C:attention}#2#{}장",
					"{C:attention}제외{}할 수 있습니다",
				},
			},
			j_joy_ignis_backup = {
				name = "{C:joy_effect}백업@이그니스터",
				text = {
					"소환 시 다른 무작위한 {C:joy_normal}사이버스족{}",
					"카드에 {C:dark_edition}네거티브{}를 부여합니다",
					" ",
					"이 카드를 {C:attention}소재{}로 한 {C:joy_normal}사이버스족{}은",
					"가능하면 {C:dark_edition}네거티브{}가 부여됩니다",
				},
			},
			j_joy_ignis_wizard = {
				name = "{C:joy_effect}위저드@이그니스터",
				text = {
					"이 카드를 {C:attention}릴리스{}해 이름이 다른",
					"{C:joy_normal}사이버스족{} 조커를 {C:attention}#1#{}장",
					"{C:attention}소생{}시킬수 있습니다",
					" ",
					"소환된 {C:joy_spell}엑스트라 덱{} {C:joy_normal}사이버스족{},",
					"조커를 보유했을경우, 추가로",
					"{C:joy_normal}\"@이그니스터\"{} 한 장을 더",
					"{C:dark_edition}네거티브{}를 부여해 {C:attention}소생{}시킵니다",
				},
			},
			j_joy_ignis_kiruku = {
				name = "{C:joy_effect}크리크링크@이그니스터",
				text = {
					"이 카드를 판매하면 현재",
					"{C:attention}보스 블라인드{} 비활성화 한뒤,",
					"소환된 {C:joy_spell}엑스트라 덱{} {C:joy_normal}사이버스족{}",
					"조커를 보유했을경우, 다음 상점에",
					"이 카드를 추가합니다",
				},
			},
			j_joy_ignis_leviathan = {
				name = "{C:joy_ritual}워터 리바이어던@이그니스터",
				text = {
					"소환 시 {C:joy_spell}엑스트라 덱{}에",
					"{C:joy_normal}\"@이그니스터\"{} 카드",
					"{C:attention}#1#{}장을 생성합니다",
					" ",
					"소환에 사용된 {C:attention}속성{}마다",
					"칩 {C:chips}+#2#{}개를 획득합니다",
					"이 획득량은 조커를 {C:joy_link}링크{} 소환",
					"할때마다 {C:chips}+#3#{}개씩 증가합니다",
					" ",
					"{C:inactive}(현재 칩 {C:chips}+#3#{C:inactive}개)",
					"이 카드를 {C:attention}소재{}로 한 {C:joy_link}링크{}",
					"조커도 이 효과를 얻습니다",
				},
				joy_transfer_ability = {
					"소환에 사용된 소재마다",
					"칩 {C:chips}+#1#{}개를 획득합니다",
					"이 획득량은 조커를 {C:joy_link}링크{} 소환",
					"할때마다 {C:chips}+#2#{}개씩 증가합니다",
					"{C:inactive}(현재 칩 {C:chips}+#3#{C:inactive}개)",
				},
				joy_summon_conditions = {
					"{C:joy_normal}사이버스족{} {C:attention}2{}장 이상",
				},
			},
			j_joy_ignis_golem = {
				name = "{C:joy_fusion}어스 골렘 @이그니스터",
				text = {
					"소환 시 {C:joy_spell}엑스트라 덱{}에",
					"{C:joy_normal}\"@이그니스터\"{} 카드",
					"{C:attention}#1#{}장을 생성합니다",
					" ",
					"소환에 사용된 {C:attention}속성{}마다",
					"조커 슬롯 {C:attention}+#2#{}개를 획득합니다",
					"{C:inactive}(현재 {C:attention}+#3#{C:inactive}개)",
					" ",
					"이 카드를 {C:attention}소재{}로 한 {C:joy_link}링크{}",
					"조커도 이 효과를 얻습니다",
				},
				joy_transfer_ability = {
					"소환에 사용된 소재마다",
					"조커 슬롯 {C:attention}+#1#{}개를 획득합니다",
					"{C:inactive}(현재 {C:attention}+#3#{C:inactive}개)",
				},
				joy_summon_conditions = {
					"{C:joy_normal}사이버스족{} {C:attention}2{}장 이상",
				},
			},
			j_joy_ignis_pegasus = {
				name = "{C:joy_synchro}윈드페가수스@이그니스터",
				text = {
					"소환 시 {C:joy_spell}엑스트라 덱{}에",
					"{C:joy_normal}\"@이그니스터\"{} 카드",
					"{C:attention}#1#{}장을 생성합니다",
					" ",
					"{C:green}#2#/#3#{} 확률로 득점한",
					"카드를 재발동시킵니다",
					"소환에 사용된 {C:attention}속성{}마다",
					"확률이 증가합니다",
					"이 카드를 {C:attention}소재{}로 한 {C:joy_link}링크{}",
					"조커도 이 효과를 얻습니다",
				},
				joy_transfer_ability = {
					"{C:green}#1#/#2#{} 확률로 득점한",
					"카드를 재발동시킵니다",
					"소환에 사용된 {C:attention}속성{}마다",
					"확률이 증가합니다",
				},
				joy_summon_conditions = {
					"{C:joy_synchro}튜너{} {C:attention}1{}장 + {C:joy_normal}사이버스족{} {C:attention}1{}장",
				},
			},
			j_joy_ignis_dragon = {
				name = "{C:joy_xyz}라이트드래곤@이그니스터",
				text = {
					"소환 시 {C:joy_spell}엑스트라 덱{}에",
					"{C:joy_normal}\"@이그니스터\"{} 카드",
					"{C:attention}#1#{}장을 생성합니다",
					" ",
					"득점한 카드는 영구히",
					"소환에 사용된 {C:attention}속성{}마다",
					"손패에 남아 있으면 {C:money}+$#2#{}를",
					"획득하는 능력을 얻습니다",
					"이 카드를 {C:attention}소재{}로 한 {C:joy_link}링크{}",
					"조커도 이 효과를 얻습니다",
				},
				joy_transfer_ability = {
					"득점한 카드는 영구히",
					"소환에 사용된 {C:attention}속성{}마다",
					"손패에 남아 있으면 {C:money}+$#2#{}를",
					"획득하는 능력을 얻습니다",
				},
				joy_summon_conditions = {
					"{C:joy_normal}사이버스족{} {C:attention}2{}장 이상",
				},
			},
			j_joy_ignis_phoenix = {
				name = "{C:joy_link}파이어피닉스@이그니스터",
				text = {
					"소환 시 {C:joy_spell}엑스트라 덱{}에",
					"{C:joy_normal}\"@이그니스터\"{} 카드",
					"{C:attention}#1#{}장을 생성합니다",
					" ",
					"{C:joy_normal}사이버스족{} 조커의 {C:attention}소재{}로",
					"사용되면 디버프된 {C:dark_edition}네거티브{}",
					"{C:joy_link}\"파이어피닉스@이그니스터\"{}",
					"{C:attention}#2#{}장을 생성합니다",
					" ",
					"득점한 카드는 영구히",
					"{X:mult,C:white}X#3#{} 배수를 획득합니다",
					"이 획득량은 조커를 {C:joy_link}링크{} 소환",
					"할때마다 {X:mult,C:white}X#3#{}씩 증가합니다",
					"{C:inactive}(현재 {X:mult,C:white}X#5#{} {C:inactive} 배수)",
					"이 카드를 {C:attention}소재{}로 한 {C:joy_link}링크{}",
					"조커도 이 효과를 얻습니다",
				},
				joy_transfer_ability = {
					"득점한 카드는 영구히",
					"{X:mult,C:white}X#1#{} 배수를 획득합니다",
					"이 획득량은 조커를 {C:joy_link}링크{} 소환",
					"할때마다 {C:chips}+#2#{}개씩 증가합니다",
					"{C:inactive}(현재 {X:mult,C:white}X#5#{} {C:inactive} 배수)",
				},
				joy_summon_conditions = {
					"{C:joy_normal}사이버스족{} {C:attention}2{}장 이상",
				},
			},
			j_joy_ignis_accode = {
				name = "{C:joy_link}어코드 토커@이그니스터",
				text = {
					"각 {C:joy_link}링크{} 조커마다",
					"{X:mult,C:white}X#1#{} 배수를 획득합니다",
					"{C:inactive}(현재 {X:mult,C:white}X#2#{} {C:inactive}배수)",
					" ",
					"소환 시 {C:joy_link}링크{} 조커",
					"{C:attention}#3#{}장을 {C:attention}소생{}시킵니다",
				},
				joy_summon_conditions = {
					"{C:joy_link}링크{} 조커 {C:attention}5{}장 이상",
				},
			},
			j_joy_ignis_infant = {
				name = "{C:joy_link}다크인펀트 @이그니스터",
				text = {
					"소환 시 {C:joy_spell}\"이그니스터 AI랜드\"{}를",
					"{C:attention}#1#{}장 생성합니다",
					"{C:inactive}(공간이 있어야 합니다){}",
					" ",
					"{C:joy_link}링크{} 소환의 소재 한 장을",
					"대체할 수 있으며 임의의 {C:attention}속성{}을",
					"대체할 수 있습니다",
				},
				joy_summon_conditions = {
					"{C:joy_normal}사이버스족{} {C:attentoin}1{}장",
				},
			},
			j_joy_ignis_templar = {
				name = "{C:joy_link}다크나이트@이그니스터",
				text = {
					"소환 시 가능한 만큼 이름이 다른",
					"{C:joy_normal}\"@이그니스터\"{} 조커들을",
					"{C:dark_edition}네거티브{}를 부여해",
					"디버프된 채로 {C:attention}소생{}시킵니다",
					" ",
					"{C:joy_normal}사이버스족{} 조커의 {C:attention}소재{}로 사용될 시",
					"{C:joy_normal}메인덱 사이버스족{} 조커를",
					"{C:attention}#1#{}장 {C:attention}소생{}시킵니다",
				},
				joy_summon_conditions = {
					"{C:joy_normal}\"@이그니스터\"{} {C:attention}3{}장",
				},
			},
			j_joy_ignis_arrival = {
				name = "{C:joy_link}디 어라이벌 사이버스@이그니스터",
				text = {
					"소환에 사용된 {C:joy_link}속성{} 하나마다",
					"{X:mult,C:white}X#1#{} 배수를 획득합니다",
					"{C:inactive}(현재 {X:mult,C:white}X#2#{} {C:inactive}배수)",
					" ",
					"{C:attention}소재{}의 {C:joy_link}속성{}에 따라 아래의 효과를 얻습니다",
					"{V:1}빛{V:3}: 라운드 종료시 {V:2}+$#3#{V:3}를 획득합니다",
					"{V:4}어둠{V:7}: 라운드 종료시 {{V:6}유령{V:7} 카드",
					"{V:5}#4#{V:7}장을 획득합니다 {s:0.8,C:inactive}(공간이 있어야 합니다)",
					"{V:8}물{V:10}: 칩 {V:9}+#5#{V:10}개",
					"{V:11}화염{V:13}: {V:12}+#6#{V:13} 배수",
					"{V:14}바람{V:17}: {V:15}#7#/#8#{V:17}의 확률로 소모품을 사용할 때",
					"{V:16}네거티브{V:17}로 복제해 생성합니다",
					"{V:18}땅{V:20}: 손패 {V:19}+#9#{V:20}장",
				},
				joy_summon_conditions = {
					"{C:joy_normal}사이버스{}족 {C:attention}5{}장",
				},
			},
			j_joy_ignis_ailand = {
				name = "{C:joy_spell}이그니스터 AI랜드",
				text = {
					"{C:joy_normal}\"@이그니스터\"{} 카드가 소재로 사용될 시",
					"상점에 {C:joy_normal}메인 덱 \"@이그니스터\"{}",
					"카드 {C:attention}#1#{}장을 추가합니다",
					" ",
					"{C:attention}속성{}이 다른 {C:attention}조커{}를 {C:attention}#2#{}장 보유할 경우",
					"라운드의 끝에 {C:attention}블라인드{}를 선택할때 까지",
					"모든 {C:joy_normal}사이버스족{} 조커를 {C:attention}제외{}합니다",
				},
			},
			--#endregion
			--#region Solfachord
			j_joy_solfa_cutia = {
				name = "{C:joy_pendulum_effect}도도레미코드 큐티아",
				joy_consumable = {
					"선택한 카드 최대",
					"{C:attention}#1#{}장을 {C:attention}8{}으로 바꾸며",
					"{C:attention}풀 하우스{}, {C:attention}스트레이트{}, 그리고",
					"{C:attention}투페어{}의 레벨을 {C:attention}#1#{} 올립니다",
				},
				text = {
					"{C:joy_normal}\"도레미코드\"{} 한 장마다",
					"짝수 카드가 득점할 때",
					"{C:mult}+#2#{} 배수를 획득합니다",
					"{C:inactive}(현재{} {C:mult}+#3#{} {C:inactive}배수){}",
					" ",
					"{C:joy_pendulum}펜듈럼{} 조커를 {C:attention}#5#{}장 소모할때마다",
					"한 라운드에 한 번, {C:joy_pendulum}펜듈럼{} {C:joy_normal}\"도레미코드\"{}",
					"카드를 {C:attention}#4#{}장 생성합니다",
					"{C:inactive}(#6#/#5#) (공간이 있어야 합니다){}",
				},
			},
			j_joy_solfa_dreamia = {
				name = "{C:joy_pendulum_effect}레도레미코드 드리미아",
				joy_consumable = {
					"선택한 카드 최대",
					"{C:attention}#1#{}장을 {C:attention}7{}으로 바꾸며",
					"{C:attention}풀 하우스{}, {C:attention}스트레이트{}, 그리고",
					"{C:attention}투페어{}의 레벨을 {C:attention}#1#{} 올립니다",
				},
				text = {
					"{C:joy_normal}\"도레미코드\"{} 한 장마다",
					"홀수 카드가 득점할 때",
					"{C:mult}+#2#{} 배수를 획득합니다",
					"{C:inactive}(현재{} {C:mult}+#3#{} {C:inactive}배수){}",
					" ",
					"{C:joy_pendulum}펜듈럼{} 조커 보유시 무료",
				},
			},
			j_joy_solfa_eliteia = {
				name = "{C:joy_pendulum_effect}미도레미코드 엘리티아",
				joy_consumable = {
					"선택한 카드 최대",
					"{C:attention}#1#{}장을 {C:attention}6{}으로 바꾸며",
					"{C:attention}풀 하우스{}, {C:attention}스트레이트{}, 그리고",
					"{C:attention}투페어{}의 레벨을 {C:attention}#1#{} 올립니다",
				},
				text = {
					"짝수 카드가 득점할 때마다",
					"이 조커의 칩 획득량이",
					"{C:chips}+#2#{}개 증가합니다",
					"{C:inactive}(현재 칩{} {C:chips}+#3#{} {C:inactive}개){}",
					" ",
					"짝수 카드가 {C:attention}#5#{}번 득점하면",
					"{C:joy_spell}엑스트라 덱{}에 {C:joy_normal}\"도레미코드\"{}",
					"카드 {C:attention}#4#{}장을 생성합니다",
					"{C:inactive}(#6#/#5#) (공간이 있어야 합니다){}",
				},
			},
			j_joy_solfa_fancia = {
				name = "{C:joy_pendulum_effect}파도레미코드 팬시아",
				joy_consumable = {
					"선택한 카드 최대",
					"{C:attention}#1#{}장을 {C:attention}5{}로 바꾸며",
					"{C:attention}풀 하우스{}, {C:attention}스트레이트{}, 그리고",
					"{C:attention}투페어{}의 레벨을 {C:attention}#1#{} 올립니다",
				},
				text = {
					"홀수 카드가 득점할 때마다",
					"이 조커의 칩 획득량이",
					"{C:chips}+#2#{}개 증가합니다",
					"{C:inactive}(현재 칩{} {C:chips}+#3#{} {C:inactive}개){}",
					" ",
					"홀수 카드가 {C:attention}#5#{}번 득점하면",
					"{C:joy_spell}엑스트라 덱{}에 {C:joy_normal}\"도레미코드\"{}",
					"카드 {C:attention}#4#{}장을 생성합니다",
					"{C:inactive}(#6#/#5#) (공간이 있어야 합니다){}",
				},
			},
			j_joy_solfa_gracia = {
				name = "{C:joy_pendulum_effect}솔도레미코드 그레이시아",
				joy_consumable = {
					"선택한 카드 최대",
					"{C:attention}#1#{}장을 {C:attention}4{}로 바꾸며",
					"{C:attention}풀 하우스{}, {C:attention}스트레이트{}, 그리고",
					"{C:attention}투페어{}의 레벨을 {C:attention}#1#{} 올립니다",
				},
				text = {
					"짝수 카드를 {C:attention}#2#{}번",
					"재발동시킵니다",
					" ",
					"짝수 카드가 {C:attention}#4#{}번 득점하면",
					"{C:joy_spell}\"도레미코드 하르모니아\"{}",
					"{C:attention}#3#{}장을 생성합니다",
					"{C:inactive}(#5#/#4#) (공간이 있어야 합니다){}",
				},
			},
			j_joy_solfa_angelia = {
				name = "{C:joy_pendulum_effect}라도레미코드 엔제리아",
				joy_consumable = {
					"선택한 카드 최대",
					"{C:attention}#1#{}장을 {C:attention}3{}으로 바꾸며",
					"{C:attention}풀 하우스{}, {C:attention}스트레이트{}, 그리고",
					"{C:attention}투페어{}의 레벨을 {C:attention}#1#{} 올립니다",
				},
				text = {
					"홀수 카드를 {C:attention}#2#{}번",
					"재발동시킵니다",
					" ",
					"홀수 카드가 {C:attention}#4#{}번 득점하면",
					"{C:joy_normal}\"도레미코드\"{} {C:attention}#3#{}장을",
					"{C:attention}소생{}시킵니다",
					"{C:inactive}(#5#/#4#){}",
				},
			},
			j_joy_solfa_beautia = {
				name = "{C:joy_pendulum_effect}시도레미코드 뷰티아",
				joy_consumable = {
					"선택한 카드 최대",
					"{C:attention}#1#{}장을 {C:attention}2{}으로 바꾸며",
					"{C:attention}풀 하우스{}, {C:attention}스트레이트{}, 그리고",
					"{C:attention}투페어{}의 레벨을 {C:attention}#1#{} 올립니다",
				},
				text = {
					"{C:joy_normal}\"도레미코드\"{} 한 장마다",
					"짝수 카드가 득점할 때",
					"칩 {X:chips,C:white}X#2#{}개를 획득합니다",
					"{C:inactive}(현재 칩 {X:chips,C:white}X#3#{}{C:inactive}개)",
					" ",
					"라운드의 끝에 {C:attention}블라인드{}를 선택할 때 까지",
					"{C:joy_pendulum}펜듈럼{} 카드를 {C:attention}#4#{}장 {C:attention}제외{}시킵니다",
				},
			},
			j_joy_solfa_coolia = {
				name = "{C:joy_pendulum_effect}도도레미코드 쿨리아",
				joy_consumable = {
					"선택한 카드 최대",
					"{C:attention}#1#{}장을 {C:attention}에이스{}로 바꾸며",
					"{C:attention}풀 하우스{}, {C:attention}스트레이트{}, 그리고",
					"{C:attention}투페어{}의 레벨을 {C:attention}#1#{} 올립니다",
				},
				text = {
					"{C:joy_normal}\"도레미코드\"{} 한 장마다",
					"홀수 카드가 득점할 때",
					"{X:mult,C:white}X#2#{} 배수를 획득합니다",
					"{C:inactive}(현재 {X:mult,C:white}X#3#{} {C:inactive}배수)",
					" ",
					"{C:joy_normal}\"도레미코드\"{}의 효과를 처리할때",
					"{C:attention}묘지{}의 {C:attention}조커{}들도 보유한 것으로 취급됩니다",
				},
			},
			j_joy_solfa_musecia = {
				name = "{C:joy_link}그랜도레미코드 뮤제시아",
				text = {
					"{C:joy_normal}\"도레미코드\"{}의 소모품 효과의",
					"대상이 된 카드는 가능하다면",
					"무작위한 에디션을 얻습니다",
					" ",
					"{C:joy_pendulum}펜듈럼{} 조커를 {C:attention}#2#{}장 소모하면",
					"한 라운드에 한 번, {C:joy_pendulum}펜듈럼{} {C:joy_normal}\"도레미코드\"{}를",
					"{C:dark_edition}네거티브{}를 부여해 생성합니다",
					"{C:inactive}(#3#/#2#)",
					" ",
					"짝수와 홀수 카드가 같이 득점할 경우",
					"{C:joy_normal}\"도레미코드\"{}의 효과를 처리 할때",
					"모든 득점하는 카드가 동시에",
					"짝수와 홀수인것으로 취급됩니다",
					" ",
					"{C:joy_normal}\"도레미코드\"{}의 효과를 처리 할때",
					"보유한 모든 {C:joy_pendulum}펜듈럼{} 카드를",
					"보유한 {C:joy_normal}\"도레미코드\"{}로 취급합니다",
				},
				joy_summon_conditions = {
					"{C:joy_pendulum}펜듈럼{} 조커 {C:attention}2{}장",
				},
			},
			j_joy_solfa_grancoolia = {
				name = "{C:joy_link}그랜도레미코드 쿨리아",
				text = {
					"각 {C:joy_pendulum}펜듈럼{} 조커마다",
					"칩 {C:chips}+#1#{}개를 획득합니다",
					"{C:inactive}(현재 칩 {C:chips}+#2#{} {C:inactive}개)",
					" ",
					"{C:joy_normal}\"도레미코드\"{}의 소모품 효과의",
					"대상이 된 카드는 가능하다면",
					"무작위한 인장을 얻습니다",
					" ",
					"{C:joy_pendulum}펜듈럼{} 조커를 {C:attention}#4#{}장 소모하면",
					"{C:money}+$#3#{}를 획득합니다",
					"{C:inactive}(#5#/#4#)",
					" ",
					"짝수와 홀수 카드가 같이 득점할 경우",
					"{C:joy_normal}\"도레미코드\"{}의 효과를 처리 할때",
					"손패에 남은 카드도",
					"득점한 것으로 취급됩니다",
				},
				joy_summon_conditions = {
					"{C:pendulum}펜듈럼{} 조커를 포함한 {C:attention}조커 3{}장",
				},
			},
			j_joy_solfa_harmonia = {
				name = "{C:joy_spell}도레미코드 하르모니아",
				text = {
					"{C:attention}블라인드{}를 선택할 시 {C:joy_normal}\"도레미코드\"{}",
					"(한 장도 없을경우 {C:joy_pendulum}펜듈럼{})",
					"카드 {C:attention}#1#{}장을 {C:attention}소생{}시킵니다",
					" ",
					"{C:joy_pendulum}펜듈럼{} 조커를 소모 시",
					"{C:attention}힘{} {C:tarot}타로{} 카드를",
					"{C:attention}#2#{}장 생성합니다",
					"{C:inactive}(공간이 있어야 합니다){}",
					" ",
					"서로 이름이 다른 {C:joy_normal}\"도레미코드\"{}를",
					"{C:attention}#3#{}장 보유했을 경우 득점 후",
					"짝수 카드는 {C:attention}황금{} 카드가 되며",
					"홀수 카드는 {C:attention}강철{} 카드가 됩니다",
				},
			},
			--#endregion
			--#region Witchcrafter
			j_joy_witch_genni = {
				name = "{C:joy_effect}위치크래프트 제니",
				text = {
					"소환 시 {C:tarot}타로{} 카드를",
					"{C:attention}#1#{}장 생성합니다",
					"{C:inactive}(공간이 있어야 합니다){}",
					" ",
					"이 카드와 {C:tarot}타로{} 카드",
					"{C:attention}#2#{}장을 {C:attention}릴리스{}해",
					"{C:joy_effect}\"위치크래프트 포트리\"{}",
					"{C:attention}#1#{}장을 생성할수 있습니다",
					"{C:inactive}(공간이 있어야 합니다){}",
				},
			},
			j_joy_witch_potterie = {
				name = "{C:joy_effect}위치크래프트 포트리",
				text = {
					"소환 시 소모품을 보유하고",
					"있지 않다면 {C:tarot}타로{} 카드를",
					"{C:attention}#1#{}장 생성합니다",
					"{C:inactive}(공간이 있어야 합니다){}",
					" ",
					"라운드 종료 시 {C:attention}블라인드{}를",
					"선택할 때까지 이 카드와 {C:tarot}타로{}",
					"카드 {C:attention}#2#{}장을 {C:attention}제외{}합니다",
					" ",
					"이 카드와 {C:tarot}타로{} 카드",
					"{C:attention}#3#{}장을 {C:attention}릴리스{}해",
					"{C:joy_effect}\"위치크래프트 피또레\"{}",
					"{C:attention}#4#{}장을 생성할수 있습니다",
					"{C:inactive}(공간이 있어야 합니다){}",
				},
			},
			j_joy_witch_pittore = {
				name = "{C:joy_effect}위치크래프트 피또레",
				text = {
					"이 라운드 도중 {C:attention}릴리스{}한 {C:tarot}타로{} 카드",
					"한 장 마다 칩 {C:chips}+#1#{}개를 획득합니다",
					"{C:inactive}(현재 칩 {C:chips}+#2#{C:inactive}개)",
					" ",
					"한 라운드 당 한번까지,",
					"소모품을 {C:attention}#4#{}번 사용하면",
					"{C:tarot}타로{} 카드를 {C:attention}#3#{}장 생성합니다",
					"{C:inactive}(#5#/#4#) (공간이 있어야 합니다){}",
					" ",
					"이 카드와 {C:tarot}타로{} 카드",
					"{C:attention}#6#{}장을 {C:attention}릴리스{}해",
					"{C:joy_effect}\"위치크래프트 슈미타\"{}",
					"{C:attention}#7#{}장을 생성할수 있습니다",
					"{C:inactive}(공간이 있어야 합니다){}",
				},
			},
			j_joy_witch_schmietta = {
				name = "{C:joy_effect}위치크래프트 슈미타",
				text = {
					"이 라운드 도중 {C:attention}릴리스{}한 {C:tarot}타로{} 카드",
					"한 장 마다 {C:mult}+#1#{} 배수를 획득합니다",
					"{C:inactive}(현재 {C:mult}+#2#{} {C:inactive}배수)",
					" ",
					"라운드의 첫 핸드를 플레이 한 후",
					"{C:tarot}타로{} 카드를 {C:attention}#3#{}장 생성합니다",
					"{C:inactive}(공간이 있어야 합니다){}",
					" ",
					"이 카드와 {C:tarot}타로{} 카드",
					"{C:attention}#4#{}장을 {C:attention}릴리스{}해",
					"{C:joy_effect}\"위치크래프트 에델\"{}",
					"{C:attention}#5#{}장을 생성할수 있습니다",
					"{C:inactive}(공간이 있어야 합니다){}",
				},
			},
			j_joy_witch_edel = {
				name = "{C:joy_effect}위치크래프트 에델",
				text = {
					"한 라운드 당 한번까지,",
					"핸드를 {C:attention}#2#{}번 플레이 하면",
					"{C:joy_effect}\"위치크래프트 제니\"{}를",
					"{C:attention}#1#{}장 생성합니다",
					"{C:inactive}(#3#/#2#) (공간이 있어야 합니다){}",
					" ",
					"이 카드와 {C:tarot}타로{} 카드",
					"{C:attention}#4#{}장을 {C:attention}릴리스{}해",
					"{C:joy_effect}\"위치크래프트 하이네\"{}",
					"{C:attention}#5#{}장을 생성할수 있습니다",
					"{C:inactive}(공간이 있어야 합니다){}",
				},
			},
			j_joy_witch_haine = {
				name = "{C:joy_effect}위치크래프트 하이네",
				text = {
					"소환 시 이 라운드 도중",
					"{C:attention}릴리스{}한 {C:tarot}타로{} 카드",
					"한 장 마다 {C:money}+$#1#{}를 획득합니다",
					" ",
					"{C:attention}마지막 핸드{}를 내면",
					"{C:dark_edition}네거티브 {C:tarot}타로{} 카드를",
					"{C:attention}#2#{}장 생성합니다",
					" ",
					"이 카드와 {C:tarot}타로{} 카드",
					"{C:attention}#3#{}장을 {C:attention}릴리스{}해",
					"{C:joy_effect}\"위치크래프트마스터 베르\"{}",
					"{C:attention}#4#{}장을 생성할수 있습니다",
					"{C:inactive}(공간이 있어야 합니다){}",
				},
			},
			j_joy_witch_verre = {
				name = "{C:joy_effect}위치크래프트마스터 베르",
				text = {
					"소환 시 이 라운드 도중 {C:attention}릴리스{}한",
					"{C:tarot}타로{} 카드들을 모두 {C:dark_edition}네거티브{}로",
					"복제해 생성합니다",
					" ",
					"이 라운드 도중 {C:attention}릴리스{}한 {C:tarot}타로{} 카드",
					"한 장 마다 {X:mult,C:white}X#1#{} 배수를 획득합니다",
					"{C:inactive}(현재 {X:mult,C:white}X#2#{} {C:inactive}배수)",
				},
			},
			j_joy_witch_aruru = {
				name = "{C:joy_effect}위치크래프트골렘 아루루",
				text = {
					"이 라운드 도중 {C:attention}릴리스{}한 {C:tarot}타로{} 카드",
					"한 장 마다 {C:mult}+#1#{} 배수를 획득합니다",
					"{C:inactive}(현재 {C:mult}+#2#{} {C:inactive}배수)",
					" ",
					"이 카드를 보유한 동안 사용된 {C:tarot}타로{}",
					"카드는 {C:attention}릴리스{}된 것으로 취급됩니다",
					" ",
					"{C:joy_normal}\"위치크래프트\"{} 보유시 무료",
				},
			},
			j_joy_witch_vicemadame = {
				name = "{C:joy_fusion}위치크래프트 바이스마스터",
				text = {
					"{C:tarot}아르카나 팩{}이 무료가 됩니다",
					" ",
					"{C:joy_normal}\"위치크래프트\"{} 카드들의",
					"칩과 배수 획득량이",
					"라운드가 끝나도",
					"계속 유지됩니다",
					" ",
					"한 라운드 당 한번까지,",
					"{C:tarot}타로{} 카드를 {C:attention}#2#{}장 사용하면",
					"{C:joy_effect}\"위치크래프트 제니\"{}를",
					"{C:attention}#1#{}장 생성합니다",
					"{C:inactive}(#3#/#2#) (공간이 있어야 합니다){}",
				},
				joy_summon_conditions = {
					"{C:joy_normal}마법사족{} 조커 {C:attention}2{}장",
				},
			},
			--#endregion
			--#region Shaddoll
			j_joy_shaddoll_beast = {
				name = "{C:joy_effect}Shaddoll Beast",
				text = {
					"{C:attention}Flips{} at end of round {C:inactive}(even if face-down)",
					" ",
					"{C:joy_effect}FLIP{}: {C:attention}+#1#{} hand size this round,",
					"{C:attention}revive #2#{} {C:joy_normal}\"Shaddoll\"{} if any",
					"and send {C:attention}#3#{} {C:joy_normal}\"Shaddoll\"{} to the {C:attention}GY{}",
					" ",
					"Turn {C:attention}#4#{} random cards in deck to",
					"{C:attention}Blue Seal Wild{} cards when used as {C:attention}material{} for a {C:joy_fusion}Fusion",
				},
			},
			j_joy_shaddoll_dragon = {
				name = "{C:joy_effect}Shaddoll Dragon",
				text = {
					"{C:attention}Flips{} at end of round {C:inactive}(even if face-down)",
					" ",
					"{C:joy_effect}FLIP{}: {C:blue}+#1#{} Hand this round,",
					"{C:attention}revive #2#{} {C:joy_normal}\"Shaddoll\"{} if any",
					"and send {C:attention}#3#{} {C:joy_normal}\"Shaddoll\"{} to the {C:attention}GY{}",
					" ",
					"Turn {C:attention}#4#{} random cards in deck to",
					"{C:attention}Gold Seal Glass{} cards when used as {C:attention}material{} for a {C:joy_fusion}Fusion",
				},
			},
			j_joy_shaddoll_falco = {
				name = "{C:joy_effect}Shaddoll Falco",
				text = {
					"{C:attention}Flips{} at end of round {C:inactive}(even if face-down)",
					" ",
					"{C:joy_effect}FLIP{}: {C:attention}Revive #1#{} {C:joy_effect}Flip{} {C:attention}Joker{} face-down if any,",
					"{C:attention}revive #2#{} {C:joy_normal}\"Shaddoll\"{} if any",
					"and send {C:attention}#3#{} {C:joy_normal}\"Shaddoll\"{} to the {C:attention}GY{}",
					" ",
					"Create {C:attention}#4#{} face-down {C:dark_edition}Negative {C:joy_effect}\"Shaddoll Falco\"",
					"when used as {C:attention}material{} for a {C:joy_fusion}Fusion",
				},
			},
			j_joy_shaddoll_hedgehog = {
				name = "{C:joy_effect}Shaddoll Hedgehog",
				text = {
					"{C:attention}Flips{} at end of round {C:inactive}(even if face-down)",
					" ",
					"{C:joy_effect}FLIP{}: Create {C:attention}#1#{} {C:tarot}Tarot{} {C:inactive}(공간이 있어야 합니다){},",
					"{C:attention}revive #2#{} {C:joy_normal}\"Shaddoll\"{} if any",
					"and send {C:attention}#3#{} {C:joy_normal}\"Shaddoll\"{} to the {C:attention}GY{}",
					" ",
					"Create {C:attention}#4#{} {C:spectral}Spectral",
					"when used as {C:attention}material{} for a {C:joy_fusion}Fusion",
					"{C:inactive}(공간이 있어야 합니다)",
				},
			},
			j_joy_shaddoll_hound = {
				name = "{C:joy_effect}Shaddoll Hound",
				text = {
					"{C:attention}Flips{} at end of round {C:inactive}(even if face-down)",
					" ",
					"{C:joy_effect}FLIP{}: {C:money}+$#1#{},",
					"{C:attention}revive #2#{} {C:joy_normal}\"Shaddoll\"{} if any",
					"and send {C:attention}#3#{} {C:joy_normal}\"Shaddoll\"{} to the {C:attention}GY{}",
					" ",
					"{C:attention}Flip{} all {C:attention}Jokers{} face-up",
					"when used as {C:attention}material{} for a {C:joy_fusion}Fusion",
				},
			},
			j_joy_shaddoll_squamata = {
				name = "{C:joy_effect}Shaddoll Squamata",
				text = {
					"{C:attention}Flips{} at end of round {C:inactive}(even if face-down)",
					" ",
					"{C:joy_effect}FLIP{}: {C:red}+#1#{} Discard this round,",
					"{C:attention}revive #2#{} {C:joy_normal}\"Shaddoll\"{} if any",
					"and send {C:attention}#3#{} {C:joy_normal}\"Shaddoll\"{} to the {C:attention}GY{}",
					" ",
					"Turn {C:attention}#4#{} random cards in deck to",
					"{C:attention}Purple Seal Steel{} cards when used as {C:attention}material{} for a {C:joy_fusion}Fusion",
				},
			},
			j_joy_shaddoll_core = {
				name = "{C:joy_trap}Shaddoll Core",
				text = {
					"{C:joy_effect}FLIP{}: {X:mult,C:white}X#1#{} 배수 this round,",
					"{C:attention}revive #2#{} {C:joy_normal}\"Shaddoll\"{} if any",
					"and send {C:attention}#3#{} {C:joy_normal}\"Shaddoll\"{} to the {C:attention}GY{}",
					" ",
					"Can be used as any {C:attention}material{} for a {C:joy_fusion}Fusion",
					" ",
					"Create {C:attention}#4#{} {C:joy_spell}\"Curse of the Shadow Prison\"",
					"when used as {C:attention}material{} for a {C:joy_fusion}Fusion",
					"{C:inactive}(공간이 있어야 합니다)",
				},
			},
			j_joy_shaddoll_ariel = {
				name = "{C:joy_effect}Naelshaddoll Ariel",
				text = {
					"{C:attention}Flips{} at end of round {C:inactive}(even if face-down)",
					" ",
					"{C:joy_effect}FLIP{}: {C:attention}Banish #1#{} other {C:attention}Joker{} at end of round",
					"until {C:attention}Blind{} is selected",
					" ",
					"A {C:joy_fusion}Fusion{} summoned using this card as {C:attention}material{} gains this ability:",
					"{s:0.9,C:attention}Banish{} {s:0.9}this card at end of round",
					"{s:0.9}until {s:0.9,C:attention}Blind{} {s:0.9}is selected",
				},
			},
			j_joy_shaddoll_genius = {
				name = "{C:joy_effect}Nehshaddoll Genius",
				text = {
					"{C:attention}Flips{} at end of round {C:inactive}(even if face-down)",
					" ",
					"{C:joy_effect}FLIP{}: You can {C:attention}flip #1#{} {C:attention}Joker{} this round",
					" ",
					"A {C:joy_fusion}Fusion{} summoned using this card as {C:attention}material{} gains this ability:",
					"{s:0.9}Can't be debuffed",
				},
			},
			j_joy_shaddoll_keios = {
				name = "{C:joy_effect}Qadshaddoll Keios",
				text = {
					"{C:attention}Flips{} at end of round {C:inactive}(even if face-down)",
					" ",
					"{C:joy_effect}FLIP{}: Add {C:attention}#1#{} {C:joy_normal}\"Shaddoll\"{} to the {C:joy_spell}Extra Deck",
					"{C:inactive}(공간이 있어야 합니다)",
					" ",
					"A {C:joy_fusion}Fusion{} summoned using this card as {C:attention}material{} gains this ability:",
					"{s:0.9,C:mult}+#2#{s:0.9} 배수 for each {s:0.9,C:joy_normal}\"Shaddoll\"{s:0.9} or {s:0.9,C:joy_normal}Spellcaster{s:0.9} in the {s:0.9,C:attention}GY",
				},
			},
			j_joy_shaddoll_wendi = {
				name = "{C:joy_effect}Reeshaddoll Wendi",
				text = {
					"{C:attention}Flips{} at end of round {C:inactive}(even if face-down)",
					" ",
					"{C:joy_effect}FLIP{}: Create {C:attention}#1#{} {C:joy_normal}Main Deck \"Shaddoll\"{}",
					"{C:inactive}(공간이 있어야 합니다)",
					" ",
					"A {C:joy_fusion}Fusion{} summoned using this card as {C:attention}material{} gains this ability:",
					"{s:0.9,C:attention}Revive #2#{s:0.9,C:joy_effect} Flip {s:0.9,C:attention}Joker{s:0.9} as {s:0.9,C:dark_edition}Negative{s:0.9} when {s:0.9,C:attention}Boss Blind{s:0.9} is selected",
				},
			},
			j_joy_shaddoll_hollow = {
				name = "{C:joy_effect}Helshaddoll Hollow",
				text = {
					"{C:attention}Flips{} at end of round {C:inactive}(even if face-down)",
					" ",
					"{C:joy_effect}FLIP{}: Send {C:attention}#1#{} {C:joy_normal}Main Deck \"Shaddoll\"{} to the {C:attention}GY",
					" ",
					"A {C:joy_fusion}Fusion{} summoned using this card as {C:attention}material{} gains this ability:",
					"{s:0.9}Send {s:0.9,C:attention}#2#{} {s:0.9,C:joy_normal}Main Deck \"Shaddoll\"{s:0.9} to the {s:0.9,C:attention}GY{s:0.9} when {s:0.9,C:attention}Blind{s:0.9} is selected",
				},
			},
			j_joy_shaddoll_anoya = {
				name = "{C:joy_fusion}El Shaddoll Anoyatyllis",
				text = {
					"{C:chips}+#1#{} Chips for each {C:joy_normal}\"Shaddoll\"{} in the {C:attention}GY",
					"{C:inactive}(현재 {C:chips}+#2#{} {C:inactive}Chips)",
					" ",
					"Add {C:attention}#3#{} {C:joy_normal}\"Shaddoll\"{} to the {C:joy_spell}Extra Deck",
					"when used as {C:attention}material",
					"{C:inactive}(공간이 있어야 합니다)",
					" ",
					"A {C:joy_fusion}Fusion{} summoned using this card as {C:attention}material{} gains this ability:",
					"{s:0.9,C:chips}+#1#{s:0.9} Chips for each {s:0.9,C:joy_normal}\"Shaddoll\"{s:0.9} in the {s:0.9,C:attention}GY",
				},
			},
			j_joy_shaddoll_apka = {
				name = "{C:joy_fusion}El Shaddoll Apkallone",
				text = {
					"{C:joy_normal}\"Shaddoll\"{} {C:joy_fusion}Fusions{} can't be debuffed or {C:attention}flipped{} face-down",
					" ",
					"Add {C:attention}#1#{} {C:joy_normal}\"Shaddoll\"{} to the {C:joy_spell}Extra Deck",
					"when used as {C:attention}material",
					"{C:inactive}(공간이 있어야 합니다)",
					" ",
					"A {C:joy_fusion}Fusion{} summoned using this card as {C:attention}material{} gains this ability:",
					"{s:0.9,C:joy_normal}\"Shaddoll\"{} {s:0.9,C:joy_fusion}Fusions{s:0.9} can't be debuffed or {s:0.9,C:attention}flipped{s:0.9} face-down",
				},
			},
			j_joy_shaddoll_winda = {
				name = "{C:joy_fusion}El Shaddoll Winda",
				text = {
					"{X:mult,C:white}X#1#{} 배수 for each {C:joy_normal}\"Shaddoll\"{}, face-down {C:attention}Joker{} or empty {C:attention}Joker{} slot",
					"{C:inactive}(현재 {X:mult,C:white}X#2#{} {C:inactive}배수)",
					" ",
					"Add {C:attention}#3#{} {C:joy_normal}\"Shaddoll\"{} to the {C:joy_spell}Extra Deck",
					"when used as {C:attention}material",
					"{C:inactive}(공간이 있어야 합니다)",
					" ",
					"A {C:joy_fusion}Fusion{} summoned using this card as {C:attention}material{} gains this ability:",
					"{s:0.9,X:mult,C:white}X#1#{s:0.9} 배수 for each {s:0.9,C:joy_normal}\"Shaddoll\"{s:0.9}, face-down {s:0.9,C:attention}Joker{s:0.9} or empty {s:0.9,C:attention}Joker{s:0.9} slot",
				},
			},
			j_joy_shaddoll_elconstruct = {
				name = "{C:joy_fusion}El Shaddoll Construct",
				text = {
					"Send {C:attention}#1# {C:joy_normal}\"Shaddoll\"{} to the {C:attention}GY{} when {C:attention}Blind{} is selected",
					" ",
					"Add {C:attention}#2#{} {C:joy_normal}\"Shaddoll\"{} to the {C:joy_spell}Extra Deck",
					"when used as {C:attention}material",
					"{C:inactive}(공간이 있어야 합니다)",
					" ",
					"A {C:joy_fusion}Fusion{} summoned using this card as {C:attention}material{} gains this ability:",
					"{s:0.9}Send {s:0.9,C:attention}#1# {s:0.9,C:joy_normal}\"Shaddoll\"{s:0.9} to the {s:0.9,C:attention}GY{s:0.9} when {s:0.9,C:attention}Blind{s:0.9} is selected",
				},
			},
			j_joy_shaddoll_grysta = {
				name = "{C:joy_fusion}El Shaddoll Grysta",
				text = {
					"{X:chips,C:white}X#1#{} Chips for each {C:joy_normal}\"Shaddoll\"{} in the {C:attention}GY",
					"{C:inactive}(현재 {X:chips,C:white}X#2#{} {C:inactive}Chips)",
					" ",
					"Add {C:attention}#3#{} {C:joy_normal}\"Shaddoll\"{} to the {C:joy_spell}Extra Deck",
					"when used as {C:attention}material",
					"{C:inactive}(공간이 있어야 합니다)",
					" ",
					"A {C:joy_fusion}Fusion{} summoned using this card as {C:attention}material{} gains this ability:",
					"{s:0.9,X:chips,C:white}X#1#{s:0.9} Chips for each {s:0.9,C:joy_normal}\"Shaddoll\"{s:0.9} in the {s:0.9,C:attention}GY",
				},
			},
			j_joy_shaddoll_shekh = {
				name = "{C:joy_fusion}El Shaddoll Shekhinaga",
				text = {
					"Disables effect of every {C:attention}Boss Blind",
					" ",
					"Add {C:attention}#1#{} {C:joy_normal}\"Shaddoll\"{} to the {C:joy_spell}Extra Deck",
					"when used as {C:attention}material",
					"{C:inactive}(공간이 있어야 합니다)",
					" ",
					"A {C:joy_fusion}Fusion{} summoned using this card as {C:attention}material{} gains this ability:",
					"{s:0.9}Disables effect of every {s:0.9,C:attention}Boss Blind",
				},
			},
			j_joy_shaddoll_wendigo = {
				name = "{C:joy_fusion}El Shaddoll Wendigo",
				text = {
					"{C:joy_normal}\"Shaddoll\"{} {C:joy_effect}Flip{} {C:attention}Jokers{} don't {C:attention}flip{} face-down and keep their {C:joy_effect}FLIP{} abilities",
					" ",
					"Add {C:attention}#1#{} {C:joy_normal}\"Shaddoll\"{} to the {C:joy_spell}Extra Deck",
					"when used as {C:attention}material",
					"{C:inactive}(공간이 있어야 합니다)",
					" ",
					"A {C:joy_fusion}Fusion{} summoned using this card as {C:attention}material{} gains this ability:",
					"{s:0.9,C:joy_normal}\"Shaddoll\"{} {s:0.9,C:joy_effect}Flip{} {s:0.9,C:attention}Jokers{s:0.9} don't {s:0.9,C:attention}flip{s:0.9} face-down and keep their {s:0.9,C:joy_effect}FLIP{s:0.9} abilities",
				},
			},
			j_joy_shaddoll_construct = {
				name = "{C:joy_link}Shaddoll Construct",
				text = {
					"Can be treated as any {C:attention}material{} for a {C:joy_fusion}Fusion",
					" ",
					"Add {C:attention}#1#{} {C:joy_normal}\"Shaddoll\"{} to the {C:joy_spell}Extra Deck",
					"when used as {C:attention}material",
					"{C:inactive}(공간이 있어야 합니다)",
					" ",
					"A {C:joy_fusion}Fusion{} summoned using this card as {C:attention}material{} gains this ability:",
					"{s:0.9}Can be treated as any {s:0.9,C:attention}material{s:0.9} for a {s:0.9,C:joy_fusion}Fusion",
				},
			},
			j_joy_shaddoll_prison = {
				name = "{C:joy_spell}Curse of the Shadow Prison",
				text = {
					"Each time a {C:joy_normal}\"Shaddoll\"{}, {C:joy_normal}Spellcaster{} or {C:joy_effect}Flip{} {C:attention}Joker",
					"is sent to the {C:attention}GY{}, add {C:attention}#1#{} {C:joy_token}Counter{} to this card",
					" ",
					"{C:chips}+#2#{} Chips for each {C:joy_token}Counter{}",
					" ",
					"Remove {C:attention}#3#{} {C:joy_token}Counters{} to {C:attention}revive #4#{} {C:joy_fusion}Fusion",
				},
			},
			--#endregion
			--#region Paleozoic
			j_joy_paleo_canadia = {
				name = "{C:joy_trap}Paleozoic Canadia",
				text = {
					"Gains {C:mult}+#1#{} 배수 for each {C:attention}Joker{} {C:attention}flipped",
					"{s:0.9,C:inactive}(Even while face-down)",
					"{C:inactive}(현재 {C:mult}+#2# {C:inactive}배수)",
					" ",
					"{C:joy_effect}FLIP{}: {C:attention}Revive #3#{} {C:joy_normal}\"Paleozoic\"",
					" ",
					"Can't be debuffed",
				},
			},
			j_joy_paleo_dino = {
				name = "{C:joy_trap}Paleozoic Dinomischus",
				text = {
					"{C:joy_effect}FLIP{}: This card and {C:attention}#1#{} other {C:joy_trap}Trap{} {C:attention}banish{} at end of round",
					"until {C:attention}Blind{} is selected and {C:attention}revive #2#{} {C:joy_normal}\"Paleozoic\"",
					" ",
					"Can't be debuffed",
				},
			},
			j_joy_paleo_eldonia = {
				name = "{C:joy_trap}Paleozoic Eldonia",
				text = {
					"{C:joy_effect}FLIP{}: {C:chips}+#1#{} Chips this round",
					"and {C:attention}revive #2#{} {C:joy_normal}\"Paleozoic\"",
					" ",
					"Can't be debuffed",
				},
			},
			j_joy_paleo_hallu = {
				name = "{C:joy_trap}Paleozoic Hallucigenia",
				text = {
					"{C:joy_effect}FLIP{}: {C:mult}+#1#{} 배수 this round",
					"and {C:attention}revive #2#{} {C:joy_normal}\"Paleozoic\"",
					" ",
					"Can't be debuffed",
				},
			},
			j_joy_paleo_lean = {
				name = "{C:joy_trap}Paleozoic Leanchoilia",
				text = {
					"Gains {C:chips}+#1#{} Chips for each {C:attention}Joker{} {C:attention}flipped",
					"{s:0.9,C:inactive}(Even while face-down)",
					"{C:inactive}(현재 {C:chips}+#2# {C:inactive}Chips)",
					" ",
					"{C:joy_effect}FLIP{}: {C:attention}Revive #3#{} {C:joy_normal}\"Paleozoic\"",
					" ",
					"Can't be debuffed",
				},
			},
			j_joy_paleo_marrella = {
				name = "{C:joy_trap}Paleozoic Marrella",
				text = {
					"{C:joy_effect}FLIP{}: {C:attention}Revive #1#{} {C:joy_normal}\"Paleozoic\" ",
					"and send {C:attention}#2#{} {C:joy_trap}Trap{} {C:joy_normal}\"Paleozoic\"{} to the {C:attention}GY",
					" ",
					"Can't be debuffed",
				},
			},
			j_joy_paleo_oleno = {
				name = "{C:joy_trap}Paleozoic Olenoides",
				text = {
					"{C:joy_effect}FLIP{}: {C:red}+#1#{} Discard this round",
					"and {C:attention}revive #2#{} {C:joy_normal}\"Paleozoic\"",
					" ",
					"Can't be debuffed",
				},
			},
			j_joy_paleo_pikaia = {
				name = "{C:joy_trap}Paleozoic Pikaia",
				text = {
					"{C:joy_effect}FLIP{}: {C:attention}+#1#{} hand size this round",
					"and {C:attention}revive #2#{} {C:joy_normal}\"Paleozoic\"",
					" ",
					"Can't be debuffed",
				},
			},
			j_joy_paleo_cambro = {
				name = "{C:joy_link}Paleozoic Cambroraster",
				text = {
					"Add {C:attention}#1#{} {C:joy_xyz}Xyz{} {C:joy_normal}\"Paleozoic\"{} to the {C:joy_spell}Extra Deck{} when summoned",
					" ",
					"{C:joy_normal}\"Paleozoic\"{} {C:attention}revive{} other cards as {C:dark_edition}Negative",
					" ",
					"Can't be debuffed",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:joy_normal}\"Paleozoic\"{}",
				},
			},
			j_joy_paleo_anomalo = {
				name = "{C:joy_xyz}Paleozoic Anomalocaris",
				text = {
					"{C:joy_xyz}Detach{} {C:attention}#1#{}: Gains {X:mult,C:white}X#2#{} 배수 this round",
					"{C:inactive}(현재 {X:mult,C:white}X#3#{} {C:inactive}배수)",
					" ",
					"Attach {C:attention}#4# {C:joy_xyz}material{} to this card when a {C:joy_trap}Trap{} is flipped face-up",
					" ",
					"Can't be debuffed",
				},
				joy_summon_conditions = {
					"{C:attention}3+{} {C:joy_trap}Traps{}",
				},
			},
			j_joy_paleo_opa = {
				name = "{C:joy_xyz}Paleozoic Opabinia",
				text = {
					"{C:joy_xyz}Detach{} {C:attention}#1#{}: Create {C:attention}#2#{} {C:joy_normal}Main Deck \"Paleozoic\"{}",
					" ",
					"{C:joy_trap}Traps{} are {C:attention}flipped{} face-up when {C:attention}Blind{} is selected",
					" ",
					"Can't be debuffed",
				},
				joy_summon_conditions = {
					"{C:attention}2{} {C:joy_water}Water{} {C:attention}Jokers{}",
				},
			},
			--#endregion
			--#region Invoked
			j_joy_invoked_aleister = {
				name = "{C:joy_effect}Aleister the Invoker",
				text = {
					"You can {C:attention}tribute #1#{} other {C:attention}Joker",
					"to {C:attention}transform{} this card into an {C:joy_normal}\"Invoked\"",
					"{C:inactive}(This is treated as a fusion)",
					" ",
					"A {C:joy_fusion}Fusion{} summoned using this card as {C:attention}material{} gains this ability:",
					"{s:0.9,C:chips}+#2#{} {s:0.9}Chips for each {s:0.9,C:joy_fusion}Fusion{} {s:0.9}summoned this run",
				},
				joy_transfer_ability = {
					"{C:chips}+#1#{} Chips for each {C:joy_fusion}Fusion{} summoned this run",
					"{C:inactive}(현재 {C:chips}+#2#{} {C:inactive}Chips)",
				},
			},
			j_joy_invoked_madness = {
				name = "{C:joy_link}Aleister the Invoker of Madness",
				text = {
					"You can {C:attention}tribute #1#{} other {C:attention}Joker",
					"to {C:attention}transform{} this card into an {C:joy_normal}\"Invoked\"",
					"{C:inactive}(This is treated as a fusion)",
					" ",
					"Create {C:attention}#2#{} {C:joy_spell}\"Magical Meltdown\"{} when used as {C:attention}material{} for a {C:joy_fusion}Fusion{}",
					"{C:inactive}(공간이 있어야 합니다)",
					" ",
					"A {C:joy_fusion}Fusion{} summoned using this card as {C:attention}material{} gains this ability:",
					"{s:0.9,C:mult}+#3#{} {s:0.9}배수 for each {s:0.9,C:joy_fusion}Fusion{} {s:0.9}summoned this run",
				},
				joy_summon_conditions = {
					"{C:attention}2 Jokers{} with",
					"different {C:attention}Types",
					"and {C:attention}Attributes",
				},
				joy_transfer_ability = {
					"{C:mult}+#1#{} 배수 for each {C:joy_fusion}Fusion{} summoned this run",
					"{C:inactive}(현재 {C:mult}+#2#{} {C:inactive}배수)",
				},
			},
			j_joy_invoked_caliga = {
				name = "{C:joy_fusion}Invoked Caliga",
				text = {
					"You can {C:attention}tribute #1#{} other {C:attention}Joker",
					"to {C:attention}transform{} this card into {C:joy_effect}\"Aleister the Invoker\"",
					" ",
					"Gains {X:mult,C:white}X#2#{} 배수 for each {C:attention}Joker{} {C:attention}tributed{} this run",
					"{C:inactive}(현재{} {X:mult,C:white}X#3#{} {C:inactive}배수){}",
					" ",
					"Reduce price of {C:joy_effect}Monster Packs{} by {C:money}$#4#",
				},
				joy_summon_conditions = {
					"{C:attention}Tribute 1{} {C:joy_dark}DARK {C:attention}Joker{}",
					"{s:0.8,C:inactive}(Random chance when tributing",
					"{s:0.8,C:inactive}a non-Monster)",
				},
				joy_transfer_ability = {
					"Gains {X:mult,C:white}X#1#{} 배수 for each {C:attention}Joker{} {C:attention}tributed{} this run",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
					" ",
					"Reduce price of {C:joy_effect}Monster Packs{} by {C:money}$#3#",
				},
			},
			j_joy_invoked_raidjin = {
				name = "{C:joy_fusion}Invoked Raidjin",
				text = {
					"You can {C:attention}tribute #1#{} other {C:attention}Joker",
					"to {C:attention}transform{} this card into {C:joy_effect}\"Aleister the Invoker\"",
					" ",
					"Gains {X:mult,C:white}X#2#{} 배수 for each {C:attention}Joker{} {C:attention}flipped{} this run",
					"{C:inactive}(현재{} {X:mult,C:white}X#3#{} {C:inactive}배수){}",
					" ",
					"{C:attention}Flip #4#{} other random {C:attention}Joker{} face-up when {C:attention}Blind{} is selected",
					"{C:attention}Flip #4#{} other random {C:attention}Joker{} face-down at end of round",
				},
				joy_summon_conditions = {
					"{C:attention}Tribute 1{} {C:joy_wind}WIND {C:attention}Joker{}",
					"{s:0.8,C:inactive}(Random chance when tributing",
					"{s:0.8,C:inactive}a non-Monster)",
				},
				joy_transfer_ability = {
					"Gains {X:mult,C:white}X#1#{} 배수 for each {C:attention}Joker{} {C:attention}flipped{} this run",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
					" ",
					"{C:attention}Flip #3#{} other random {C:attention}Joker{} face-up when {C:attention}Blind{} is selected",
					"{C:attention}Flip #3#{} other random {C:attention}Joker{} face-down at end of round",
				},
			},
			j_joy_invoked_cocytus = {
				name = "{C:joy_fusion}Invoked Cocytus",
				text = {
					"You can {C:attention}tribute #1#{} other {C:attention}Joker",
					"to {C:attention}transform{} this card into {C:joy_effect}\"Aleister the Invoker\"",
					" ",
					"Reduce {C:attention}Blind{}'s requirement by {C:red}#2#%",
				},
				joy_summon_conditions = {
					"{C:attention}Tribute 1{} {C:joy_water}WATER {C:attention}Joker{}",
					"{s:0.8,C:inactive}(Random chance when tributing",
					"{s:0.8,C:inactive}a non-Monster)",
				},
				joy_transfer_ability = {
					"Reduce {C:attention}Blind{}'s requirement by {C:red}#1#%",
				},
			},
			j_joy_invoked_purgatorio = {
				name = "{C:joy_fusion}Invoked Purgatrio",
				text = {
					"You can {C:attention}tribute #1#{} other {C:attention}Joker",
					"to {C:attention}transform{} this card into {C:joy_effect}\"Aleister the Invoker\"",
					" ",
					"Each {C:joy_fusion}Fusion{} gives {X:mult,C:white}X#2#{} 배수",
				},
				joy_summon_conditions = {
					"{C:attention}Tribute 1{} {C:joy_fire}FIRE {C:attention}Joker{}",
					"{s:0.8,C:inactive}(Random chance when tributing",
					"{s:0.8,C:inactive}a non-Monster)",
				},
				joy_transfer_ability = {
					"Each {C:joy_fusion}Fusion{} gives {X:mult,C:white}X#1#{} 배수",
				},
			},
			j_joy_invoked_mage = {
				name = "{C:joy_fusion}Invoked Magellanica",
				text = {
					"You can {C:attention}tribute #1#{} other {C:attention}Joker",
					"to {C:attention}transform{} this card into {C:joy_effect}\"Aleister the Invoker\"",
					" ",
					"{C:mult}+#2#{} 배수",
				},
				joy_summon_conditions = {
					"{C:attention}Tribute 1{} {C:joy_earth}EARTH {C:attention}Joker{}",
					"{s:0.8,C:inactive}(Random chance when tributing",
					"{s:0.8,C:inactive}a non-Monster)",
				},
				joy_transfer_ability = {
					"{C:mult}+#1#{} 배수",
				},
			},
			j_joy_invoked_mechaba = {
				name = "{C:joy_fusion}Invoked Mechaba",
				text = {
					"You can {C:attention}tribute #1#{} other {C:attention}Joker",
					"to {C:attention}transform{} this card into {C:joy_effect}\"Aleister the Invoker\"",
					" ",
					"Disables effect of {C:attention}Boss Blind{} after {C:attention}#2#{} cards are sold this round",
					"{C:inactive}(#3#/#2#)",
				},
				joy_summon_conditions = {
					"{C:attention}Tribute 1{} {C:joy_light}LIGHT {C:attention}Joker{}",
					"{s:0.8,C:inactive}(Random chance when tributing",
					"{s:0.8,C:inactive}a non-Monster)",
				},
				joy_transfer_ability = {
					"Disables effect of {C:attention}Boss Blind{} after {C:attention}#1#{} cards are sold this round",
					"{C:inactive}(#2#/#1#)",
				},
			},
			j_joy_invoked_augo = {
				name = "{C:joy_fusion}Invoked Augoeides",
				text = {
					"You can {C:attention}tribute #1#{} other {C:attention}Joker",
					"to {C:attention}transform{} this card into {C:joy_effect}\"Aleister the Invoker\"",
					" ",
					"Gains {X:mult,C:white}X#2#{} 배수 for each {C:joy_fusion}Fusion{} in the {C:attention}GY{}",
					"{C:inactive}(현재{} {X:mult,C:white}X#3#{} {C:inactive}배수){}",
					" ",
					"Send {C:attention}#4#{} non-{C:joy_normal}\"Invoked\"{} {C:joy_fusion}Fusion{} to the {C:attention}GY{}",
					"when {C:attention}Blind{} is selected",
				},
				joy_summon_conditions = {
					"{C:attention}Tribute 1{} {C:joy_fusion}Fusion",
					"{s:0.8,C:inactive}(Supersedes other conditions)",
				},
				joy_transfer_ability = {
					"Gains {X:mult,C:white}X#1#{} 배수 for each {C:joy_fusion}Fusion{} in the {C:attention}GY{}",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
					" ",
					"Send {C:attention}#3#{} non-{C:joy_normal}\"Invoked\"{} {C:joy_fusion}Fusion{} to the {C:attention}GY{}",
					"when {C:attention}Blind{} is selected",
				},
			},
			j_joy_invoked_elysium = {
				name = "{C:joy_fusion}Invoked Elysium",
				text = {
					"You can {C:attention}tribute #1#{} other {C:attention}Joker",
					"to {C:attention}transform{} this card into {C:joy_effect}\"Aleister the Invoker\"",
					" ",
					"Gains abilities of each different {C:joy_normal}\"Invoked\"{} in the {C:attention}GY{}",
					" ",
					"Treated as any {C:attention}material{} for a {C:joy_fusion}Fusion",
					"and as any {C:attention}Attribute{} while owned",
				},
				joy_summon_conditions = {
					"{C:attention}Tribute 1{} summoned",
					"non-{C:joy_fusion}Fusion",
					"{s:0.8,C:inactive}(Supersedes other conditions)",
				},
			},
			j_joy_invoked_meltdown = {
				name = "{C:joy_spell}Magical Meltdown",
				text = {
					"You can {C:attention}tribute #1#{} {C:joy_fusion}Fusions{} to create {C:attention}#2#{} {C:joy_effect}\"Aleister the Invoker\"",
					" ",
					"Gains {X:mult,C:white}X#3#{} 배수 for each {C:joy_fusion}fusion{} summoned this run",
					"{C:inactive}(현재{} {X:mult,C:white}X#4#{} {C:inactive}배수){}",
					" ",
					"{C:joy_fusion}Fusions{} can't be flipped or debuffed",
				},
			},
			--#endregion
			--#region Danger!
			j_joy_danger_jack = {
				name = "{C:joy_effect}Danger!? Jackalope?",
				text = {
					"Gains {C:chips}+#1#{} Chips when {C:attention}Blind{} is selected",
					"{C:inactive}(현재 {C:chips}+#2# {C:inactive}Chips)",
					" ",
					"Destroys a random {C:attention}Joker{} when {C:attention}Blind{} is selected {C:inactive}(itself included)",
					" ",
					"Creates {C:attention}#3#{} {C:joy_normal}\"Danger!\"",
					"when destroyed by a {C:joy_normal}\"Danger!\"{} ability",
					"{C:inactive}(공간이 있어야 합니다){}",
				},
			},
			j_joy_danger_tsuch = {
				name = "{C:joy_effect}Danger!? Tsuchinoko?",
				text = {
					"Gains {C:mult}+#1#{} 배수 when {C:attention}Blind{} is selected",
					"{C:inactive}(현재 {C:mult}+#2# {C:inactive}배수)",
					" ",
					"Destroys a random {C:attention}Joker{} when {C:attention}Blind{} is selected {C:inactive}(itself included)",
					" ",
					"Creates {C:attention}#3#{} {C:joy_normal}\"Danger!\"",
					"when destroyed by a {C:joy_normal}\"Danger!\"{} ability",
					"{C:inactive}(공간이 있어야 합니다){}",
				},
			},
			j_joy_danger_chup = {
				name = "{C:joy_effect}Danger! Chupacabra!",
				text = {
					"{C:money}+$#1#{} at end of round",
					"Increases by {C:money}#2#{} when {C:attention}Blind{} is selected",
					" ",
					"Destroys a random {C:attention}Joker{} when {C:attention}Blind{} is selected {C:inactive}(itself included)",
					" ",
					"{C:attention}Revives #3#{} {C:joy_normal}\"Danger!\"",
					"when destroyed by a {C:joy_normal}\"Danger!\"{} ability",
				},
			},
			j_joy_danger_moth = {
				name = "{C:joy_effect}Danger! Mothman!",
				text = {
					"{C:red}+#1#{} Discards",
					"Increases by {C:red}#2#{} when {C:attention}Blind{} is selected",
					" ",
					"Destroys a random {C:attention}Joker{} when {C:attention}Blind{} is selected {C:inactive}(itself included)",
					" ",
					"{C:attention}Revives #3#{} {C:joy_normal}\"Danger!\"",
					"when destroyed by a {C:joy_normal}\"Danger!\"{} ability",
				},
			},
			j_joy_danger_dog = {
				name = "{C:joy_effect}Danger! Dogman!",
				text = {
					"Reduces {C:attention}Blind{}'s requirements by {C:red}#1#%{}",
					"Increases by {C:red}#2#%{} when {C:attention}Blind{} is selected",
					"{s:0.9,C:inactive}(Max. 25%)",
					" ",
					"Destroys a random {C:attention}Joker{} when {C:attention}Blind{} is selected {C:inactive}(itself included)",
					" ",
					"Add {C:attention}#3#{} {C:joy_normal}\"Danger!\"{} to the shop",
					"when destroyed by a {C:joy_normal}\"Danger!\"{} ability",
				},
			},
			j_joy_danger_ness = {
				name = "{C:joy_effect}Danger! Nessie!",
				text = {
					"{C:attention}+#1#{} hand size",
					"Increases by {C:attention}#2#{} when {C:attention}Blind{} is selected",
					" ",
					"Destroys a random {C:attention}Joker{} when {C:attention}Blind{} is selected {C:inactive}(itself included)",
					" ",
					"Add {C:attention}#3#{} {C:joy_normal}\"Danger!\"{} to the shop",
					"when destroyed by a {C:joy_normal}\"Danger!\"{} ability",
				},
			},
			j_joy_danger_big = {
				name = "{C:joy_effect}Danger! Bigfoot!",
				text = {
					"Gains {X:mult,C:white}X#1#{} 배수 when {C:attention}Blind{} is selected",
					"{C:inactive}(현재 {X:mult,C:white}X#2#{} {C:inactive}배수)",
					" ",
					"Destroys a random {C:attention}Joker{} when {C:attention}Blind{} is selected {C:inactive}(itself included)",
					" ",
					"Destroy all other {C:attention}Jokers{}",
					"when destroyed by a {C:joy_normal}\"Danger!\"{} ability",
				},
			},
			j_joy_danger_ogo = {
				name = "{C:joy_effect}Danger! Ogopogo!",
				text = {
					"{C:chips}+#1#{} Chips for each {C:joy_normal}\"Danger!\"{} in the {C:attention}GY{}",
					"{C:inactive}(현재 {C:chips}+#2# {C:inactive}Chips)",
					" ",
					"Destroys a random {C:attention}Joker{} when {C:attention}Blind{} is selected {C:inactive}(itself included)",
					" ",
					"Sends {C:attention}#3#{} {C:joy_normal}\"Danger!\"{} to the {C:attention}GY{}",
					"when destroyed by a {C:joy_normal}\"Danger!\"{} ability",
					"{C:inactive}(공간이 있어야 합니다){}",
				},
			},
			j_joy_danger_thunder = {
				name = "{C:joy_effect}Danger! Thunderbird!",
				text = {
					"Gains {X:chips,C:white}X#1#{} Chips when {C:attention}Blind{} is selected",
					"{C:inactive}(현재 {X:chips,C:white}X#2#{} {C:inactive}Chips)",
					" ",
					"Destroys a random {C:attention}Joker{} when {C:attention}Blind{} is selected {C:inactive}(itself included)",
					" ",
					"Destroy {C:attention}#3#{} other {C:attention}Joker{} and all {C:attention}Consumables",
					"when destroyed by a {C:joy_normal}\"Danger!\"{} ability",
				},
			},
			j_joy_danger_realm = {
				name = "{C:joy_spell}Realm of Danger!",
				text = {
					"Destroys a random {C:attention}Joker{} when {C:attention}Blind{} is selected",
					"and gives {C:money}+$#1#{}",
					" ",
					"{C:joy_normal}\"Danger!\"{} {C:attention}revive{} and create cards as {C:dark_edition}Polychrome{}",
				},
			},
			j_joy_danger_disorder = {
				name = "{C:joy_spell}Danger! Disturbance! Disorder!",
				text = {
					"{C:mult}+#1#{} 배수 for each {C:joy_normal}\"Danger!\"{} in the {C:attention}GY{}",
					"{C:inactive}(현재 {C:mult}+#2# {C:inactive}배수)",
					" ",
					"Creates {C:attention}#3#{} {C:joy_normal}\"Danger!\"{}",
					"when {C:attention}Blind{} is selected",
					"{C:inactive}(공간이 있어야 합니다){}",
					" ",
					"All non-{C:joy_normal}\"Danger!\"{} are debuffed",
				},
			},
			--#endregion
			--#region Adamancipator
			j_joy_adaman_analyzer = {
				name = "Adamancipator Analyzer",
				text = { "TBD" },
			},
			j_joy_adaman_researcher = {
				name = "Adamancipator Researcher",
				text = { "TBD" },
			},
			j_joy_adaman_seeker = {
				name = "Adamancipator Seeker",
				text = { "TBD" },
			},
			j_joy_adaman_crysdragite = {
				name = "Adamancipator Crystal - Dragite",
				text = { "TBD" },
			},
			j_joy_adaman_crysraptite = {
				name = "Adamancipator Crystal - Raptite",
				text = { "TBD" },
			},
			j_joy_adaman_crysleonite = {
				name = "Adamancipator Crystal - Leonite",
				text = { "TBD" },
			},
			j_joy_adaman_dragite = {
				name = "Adamancipator Risen - Dragite",
				text = { "TBD" },
			},
			j_joy_adaman_leonite = {
				name = "Adamancipator Risen - Leonite",
				text = { "TBD" },
			},
			j_joy_adaman_raptite = {
				name = "Adamancipator Risen - Raptite",
				text = { "TBD" },
			},
			j_joy_adaman_laputite = {
				name = "Adamancipator Laputite",
				text = { "TBD" },
			},
			--#endregion

			--#endregion
			--#region Miscellaneous
			--#region Effect
			j_joy_boarder = {
				name = "{C:joy_effect}인스펙트 보더",
				text = {
					"소환돼 있는 {C:joy_spell}엑스트라 덱{} 조커",
					"한 장마다 {X:mult,C:white}X#1#{} 배수를 얻습니다",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
					" ",
					"핸드 수는 보유한 {C:joy_spell}엑스트라 덱{} 몬스터",
					"종류의 수에 1을 더한 값이 됩니다",
					" ",
					"한 라운드 도중 플레이한 핸드 유형을",
					"그 라운드 동안 다시 플레이할 수 없습니다",
					" ",
					"보유한 모든 {C:joy_normal}메인 덱{} 조커는 디버프됩니다",
					"{C:inactive}({C:joy_effect}\"인스펙트 보더\"{}{C:inactive} 제외){}",
				},
			},
			j_joy_grenmaju = {
				name = "{C:joy_effect}붉은 마수 다 이자",
				text = {
					"이 런에서 {C:attention}제외{}됬던 카드마다",
					"칩 {C:chips}+#1#{}개를 획득합니다",
					"{C:inactive}(현재 칩{} {C:chips}+#2#{} {C:inactive}개){}",
				},
			},
			j_joy_heavenlyprison = {
				name = "Lord of the Heavenly Prison",
				text = { "TBD" },
			},
			j_joy_rhino = {
				name = "마주사이의 전사",
				text = {
					"소환의 {C:attention}소재{}로 사용될 경우",
					"{C:attention}묘지{}에 무작위한 {C:joy_normal}악마족{} 조커를 {C:attention}#1#{}장 생성한 후",
					"{C:attention}악마족{} 조커를 {C:attention}#2#{}장 {C:attention}소생{}시킵니다",
				},
			},
			j_joy_tourguide = {
				name = "마계발 현세행 데스가이드",
				text = {
					"소환 시 무작위한 {C:dark_edition}네거티브{} {C:joy_normal}메인 덱{}",
					"{C:blue}일반{} 또는 {C:green}희귀{} {C:joy_normal}악마족{}",
					"조커를 {C:attention}#1#{}장 생성합니다",
				},
			},
			j_joy_backup = {
				name = "Backup Secretary",
				text = {
					"TBD",
				},
			},
			j_joy_wizard = {
				name = "Cyberse Wizard",
				text = { "TBD" },
			},
			j_joy_zenoguitar = {
				name = "Rock Band Xenoguitar",
				text = { "TBD" },
			},
			j_joy_revgolem = {
				name = "Revival Golem",
				text = { "TBD" },
			},
			j_joy_tackcrusader = {
				name = "Tackle Crusader",
				text = { "TBD" },
			},
			j_joy_doki = {
				name = "Doki Doki",
				text = { "TBD" },
			},
			j_joy_blockdragon = {
				name = "Block Dragon",
				text = { "TBD" },
			},
			--#endregion
			--#region Trap
			j_joy_quantumcat = {
				name = "Quantum Cat",
				text = { "TBD" },
			},
			j_joy_anguish = {
				name = "Statue of Anguish Pattern",
				text = { "TBD" },
			},
			j_joy_tiki_curse = {
				name = "Tiki Curse",
				text = { "TBD" },
			},
			j_joy_tiki_soul = {
				name = "Tiki Soul",
				text = { "TBD" },
			},
			j_joy_zoma = {
				name = "Zoma the Spirit",
				text = { "TBD" },
			},
			j_joy_zoma_earthbound = {
				name = "Zoma the Earthbound Spirit",
				text = { "TBD" },
			},
			j_joy_finished = {
				name = "You're Finished",
				text = { "TBD" },
			},
			j_joy_apophis = {
				name = "Embodiment of Apophis",
				text = { "TBD" },
			},
			j_joy_azurune = {
				name = "Angel Statue - Azurune",
				text = { "TBD" },
			},
			j_joy_crukra = {
				name = "Crusadia Krawler",
				text = { "TBD" },
			},
			--#endregion
			--#region Pendulum
			j_joy_eccentrick = {
				name = "{C:joy_pendulum}익센트릭 데몬",
				joy_consumable = {
					"선택한 카드 최대",
					"{C:attention}#1#{}장을 파괴합니다{}",
				},
				text = {
					"이 런동안 파괴된 플레잉 카드",
					"마다 {C:mult}+#2#{} 배수를 획득합니다",
					"{C:inactive}(현재{} {C:mult}+#3#{} {C:inactive}배수){}",
				},
			},
			j_joy_pendulumoon = {
				name = "PenduLuMoon",
				text = { "TBD" },
			},
			j_joy_couverture = {
				name = "Patissciel Couverture",
				text = { "TBD" },
			},
			--#endregion
			--#region Ritual
			j_joy_sauravis = {
				name = "{C:joy_ritual}고성대 사우라비스",
				text = {
					"이 카드를 {C:attention}보스 블라인드{}도중 판매하면",
					"블라인드의 효과를 무효화하고 다음",
					"상점에 이 카드를 추가합니다",
					" ",
					"이 런동안 이 효과를 발동한 갯수만큼",
					"{X:mult,C:white}X#1#{} 배수를 획득합니다",
					"{C:inactive}(현재{} {X:mult,C:white}X#2#{} {C:inactive}배수){}",
				},
				joy_summon_conditions = {
					"{C:attention}조커 2{}장",
				},
			},
			--#endregion
			--#region Fusion
			j_joy_mudragon = {
				name = "{C:joy_fusion}늪지의 도로곤",
				text = {
					"이 카드는 보유한 동안",
					"모든 {C:joy_normal}속성{}으로 취급되며",
					"{C:joy_fusion}융합 소환{}에 필요한 임의의",
					"{C:attention}소재{}를 대체할 수 있습니다",
				},
				joy_summon_conditions = {
					"등급이 다른 {C:attention}조커 2{}장",
				},
			},
			j_joy_garura = {
				name = "{C:joy_fusion}공명의 날개 가루라",
				text = {
					"핸드 크기 {C:attention}+#1#{}장",
					" ",
					"소환의 {C:attention}소재{}로 사용되면",
					"영구히 핸드 크기  {C:attention}+#2#{}장",
				},
				joy_summon_conditions = {
					"등급이 같지만 이름이",
					"다른 {C:attention}조커 2{}장",
				},
			},
			--#endregion
			--#region Synchro
			j_joy_firewall_saber = {
				name = "Firewall Saber Dragon",
				text = { "TBD" },
			},
			--#endregion
			--#region Xyz
			j_joy_zeus = {
				name = "Divine Arsenal AA-ZEUS - Sky Thunder",
				text = { "TBD" },
			},
			j_joy_typhon = {
				name = "Super Starslayer TY-PHON - Sky Crisis",
				text = { "TBD" },
			},
			--#endregion
			--#region Link
			j_joy_apollousa = {
				name = "{C:joy_link}소명의 신궁－아폴로우사",
				text = {
					"소환에 사용된 {C:attention}소재{}마다",
					"+{C:mult}#1#{} 배수 획득합니다",
					"라운드 종료 시 배수 획득량이",
					"{C:mult}#2#{}씩 감소합니다",
					"{C:inactive}(현재 {} {C:mult}+#3#{} {C:inactive}배수){}",
				},
				joy_summon_conditions = {
					"이름이 다른 {C:attention}조커 2{}장 이상",
				},
			},
			j_joy_beyond = {
				name = "Beyond the Pendulum",
				text = { "TBD" },
			},
			j_joy_linkuriboh = {
				name = "Linkuriboh",
				text = { "TBD" },
			},
			j_joy_linguriboh = {
				name = "Linguriboh",
				text = { "TBD" },
			},
			--#endregion
			--#endregion
		},
		Tag = {
			tag_joy_booster = {
				name = "부스터 태그",
				text = {
					"다음 상점에",
					"{C:booster}부스터 팩{} 추가",
				},
			},
			tag_joy_monster = {
				name = "몬스터 태그",
				text = {
					"다음 상점에",
					"{V:1}#1#{}를 추가",
				},
			},
		},
		Planet = {
			c_joy_cursed_eldland = {
				name = "{C:joy_spell}저주받은 엘드란도",
			},
		},
		Other = {
			--#region Boosters
			p_joy_monster_pack = {
				name = "챔피언 팩",
				text = {
					"최대 {C:attention}#2#{}장의 {C:joy_normal}몬스터{} {C:attention}조커{} 카드 중",
					"{C:attention}#1#{}장을 선택합니다",
				},
			},
			p_joy_jumbo_monster_pack = {
				name = "터보 팩",
				text = {
					"최대 {C:attention}#2#{}장의 {C:joy_normal}몬스터{} {C:attention}조커{} 카드 중",
					"{C:attention}#1#{}장을 선택합니다",
				},
			},
			p_joy_mega_monster_pack = {
				name = "듀얼리스트 팩",
				text = {
					"최대 {C:attention}#2#{}장의 {C:joy_normal}몬스터{} {C:attention}조커{} 카드 중",
					"{C:attention}#1#{}장을 선택합니다",
				},
			},
			p_joy_extra_pack = {
				name = "아스트랄 팩",
				text = {
					"최대 {C:attention}#2#{}장의 {C:joy_spell}엑스트라 덱{} {C:attention}조커{} 카드 중",
					"{C:attention}#1#{}장을 선택합니다",
				},
			},
			p_joy_jumbo_extra_pack = {
				name = "스타 팩",
				text = {
					"최대 {C:attention}#2#{}장의 {C:joy_spell}엑스트라 덱{} {C:attention}조커{} 카드 중",
					"{C:attention}#1#{}장을 선택합니다",
				},
			},
			p_joy_mega_extra_pack = {
				name = "프리미엄 팩",
				text = {
					"최대 {C:attention}#2#{}장의 {C:joy_spell}엑스트라 덱{} {C:attention}조커{} 카드 중",
					"{C:attention}#1#{}장을 선택합니다",
				},
			},
			--#endregion
			joy_credits = {
				name = " ",
				text = {
					"{C:joy_mod}Booster Art:{} IcyEthics",
					" ",
					"{C:joy_mod}Special Thanks{} to the folks in",
					"the Balatro Discord <3",
				},
			},
			--#region Tooltips
			joy_tooltip_related = {
				name = "관련된 카드",
				text = {
					"{C:attention}d{}를 눌러 연관된",
					"카드를 볼수 있습니다",
				},
			},
			joy_tooltip_transform = {
				name = "변신",
				text = {
					"다른 {C:attention}조커{}로 바뀝니다",
					"모든 강화효과는 유지됩니다",
				},
			},
			joy_tooltip_revive = {
				name = "소생",
				text = {
					"{C:attention}묘지{}의 무작위한 조커를 소환합니다",
					"자리가 있어야 하며, 무작위한",
					"에디션이 부여될수 있습니다",
					"{s:0.9,C:inactive}(정규 절차로 소환되지 않은 {s:0.9,C:joy_spell}엑스트라 덱{}",
					"{s:0.9,C:attention}조커{s:0.9,C:inactive}는 소생 할 수 없습니다)",
					"{s:0.9,C:inactive}(소생된 조커의 판매 가치는 $1이 됩니다)",
				},
			},
			joy_tooltip_extra_deck_joker = {
				name = "엑스트라 덱 조커",
				text = {
					"{C:joy_fusion}융합{}, {C:joy_synchro}싱크로{},",
					"{C:joy_xyz}엑시즈{}, {C:joy_link}링크{} {C:attention}조커{}들",
				},
			},
			joy_tooltip_main_deck_joker = {
				name = "메인 덱 조커",
				text = {
					"{C:joy_normal}일반{}, {C:joy_effect}효과{},",
					"{C:joy_ritual}의식{} {C:attention}조커{}들",
				},
			},
			joy_tooltip_special = {
				name = "스페셜 조커",
				text = {
					"{C:joy_ritual}의식{}, {C:joy_fusion}퓨전{}, {C:joy_synchro}싱크로{},",
					"{C:joy_xyz}엑시즈{}, {C:joy_link}링크{} {C:attention}조커{}들",
				},
			},
			joy_tooltip_pendulum_joker = {
				name = "펜듈럼 조커",
				text = {
					"소모품으로 사용 가능",
				},
			},
			joy_tooltip_banish = {
				name = "제외",
				text = {
					"지정된 시간까지 사라지며",
					"대부분의 효과가 비활성화 됩니다",
					"자리가 없어도 돌아올수 있습니다",
				},
			},
			joy_tooltip_tribute = {
				name = "릴리스",
				text = {
					"카드를 파괴해 능력을 발동합니다",
				},
			},
			joy_tooltip_material = {
				name = "소재",
				text = {
					"소환에 사용되는 카드",
					"{C:joy_xyz}엑시즈 몬스터{}는 소재의 갯수만큼",
					"카운터를 가진 채로 소환됩니다",
				},
			},
			joy_tooltip_detach = {
				name = "엑시즈",
				text = {
					"엑시즈 소재 카운터를 소모해",
					"효과를 발동합니다",
				},
			},
			joy_tooltip_token = {
				name = "토큰",
				text = {
					"효과로 생성된 {C:joy_normal}몬스터{} 카드",
					"자체로는 아무런 효과도 없습니다",
				},
			},
			joy_tooltip_flip = {
				name = "리버스 효과",
				text = {
					"조커가 {C:attention}앞면으로 뒤집힐때{} 발동하며",
					"라운드가 끝날때까지 지속됩니다",
				},
			},
			joy_tooltip_trap = {
				name = "함정 조커",
				text = {
					"소환 시 혹은 라운드의",
					"종료 시 {C:attention}뒤집힙니다{}",
				},
			},
			joy_tooltip_monster = {
				name = "몬스터 조커",
				text = {
					"{C:joy_mod}JoyousSpring{} 모드가 추가하는 {C:attention}조커{}",
				},
			},
			--#endregion
			--#region Glossary
			joy_glossary_monster = {
				name = "",
				text = {
					"{C:joy_normal,s:1.3}몬스터{} {C:attention,s:1.3}조커{}: 이 모드가 추가하는 {C:attention}조커{}들",
				},
			},
			joy_glossary_gy = {
				name = "",
				text = {
					"{C:attention,s:1.3}묘지{}: 판매되거나, 파괴되거나, {C:attention}소환{} 재료로 사용된 {C:joy_normal}몬스터{} {C:attention}조커{}들이 보내집니다. 모든 강화효과는 사라집니다..",
				},
			},
			joy_glossary_revive = {
				name = "",
				text = {
					"{C:attention,s:1.3}소생{}: {C:attention}묘지{}의 무작위한 카드를 삭제한뒤 복제합니다. 자리가 있어야 하며, 무작위한 에디션이 부여될수 있습니다",
					"정규 절차로 소환되지 않은 {C:joy_spell}엑스트라 덱{} {C:attention}조커{}는 {C:inactive}소생 할 수 없습니다",
					"소생된 조커의 판매 가치는 $1이 됩니다",
				},
			},
			joy_glossary_banish = {
				name = "",
				text = {
					"{C:attention,s:1.3}제외{}: 지정된 시간까지 사라지며 대부분의 효과가 비활성화 됩니다",
					"자리가 없어도 돌아올수 있습니다",
				},
			},
			joy_glossary_transform = {
				name = "",
				text = {
					"{C:attention,s:1.3}변신{}: 다른 {C:attention}조커{}로 변화합니다. 모든 강화효과는 유지됩니다",
				},
			},
			joy_glossary_facedown = {
				name = "",
				text = {
					"{C:attention,s:1.3}뒷면{}: 뒤집힌 {C:joy_normal}몬스터{} {C:attention}조커{}는 따로 명시되지 않은 한 효과를 발동할 수 없습니다",
					"{C:joy_link}링크{} 몬스터는 뒷면으로 뒤집힐수 없습니다{}",
				},
			},
			joy_glossary_maindeck = {
				name = "",
				text = {
					"{C:joy_normal,s:1.3}메인 덱{} {C:attention,s:1.3}조커{}: {C:joy_spell}엑스트라 덱{} {C:attention}조커{}가 아닌 모든 {C:joy_normal}몬스터{} {C:attention}조커{}",
				},
			},
			joy_glossary_pendulum = {
				name = "",
				text = {
					"{C:joy_pendulum,s:1.3}펜듈럼{} {C:attention,s:1.3}조커{}: 소모품으로도 사용 가능한 {C:attention}조커{}",
				},
			},
			joy_glossary_fieldspell = {
				name = "",
				text = {
					"{C:joy_spell,s:1.3}필드 마법{}: 얻을시 {C:joy_spell}필드 존{}으로 가지만 ({C:joy_spell}엑스트라 덱{} 버튼을 눌러 확인) 평범한 {C:attention}조커{}로 취급됩니다",
				},
			},
			joy_glossary_extradeck = {
				name = "",
				text = {
					"{C:joy_spell,s:1.3}엑스트라 덱{} {C:attention,s:1.3}조커{}: 상점에서 구매할 시 {C:joy_spell}엑스트라 덱{}으로 보내집니다",
					"소환 조건에 명시된 {C:attention}조커{}들을 소재로 소모해 특수 소환을 할 수있습니다",
					"",
					"엑스트라 덱 조커들은 {C:joy_fusion}융합{}, {C:joy_synchro}싱크로{}, {C:joy_xyz}엑시즈{}, 그리고 {C:joy_link}링크{} {C:attention}조커{}들을 포함합니다",
					"",
					"명시되지 않은 한 {C:joy_xyz}엑시즈{}와 {C:joy_link}링크{} {C:attention}조커{}들은 {C:joy_synchro}싱크로{}와 {C:joy_xyz}엑시즈{} 소환의 소재로 사용할 수 없습니다",
					"명시되지 않은 한 {C:joy_token}토큰{}은 {C:joy_xyz}엑시즈{} 소환의 소재로 사용할 수 없습니다",
					"",
					"엑스트라 덱에서 특수 소환된 조커는 소재의 판매 가치의 합만큼 판매 가치를 갖습니다",
				},
			},
			joy_glossary_material = {
				name = "",
				text = {
					"{C:attention,s:1.3}소재{}: {C:attention}조커{}를 소환하기 위해 사용되는 카드들",
				},
			},
			joy_glossary_detach = {
				name = "",
				text = {
					"{C:joy_xyz,s:1.3}엑시즈{}: {C:joy_xyz}엑시즈{} {C:attention}조커{}들은 소환에 사용된 재료의 장수만큼 카운터를 가지고 소환됩니다",
					"카운터를 하나 {C:joy_xyz}엑시즈{}해 효과를 발동시킬수 있습니다",
				},
			},
			joy_glossary_ritual = {
				name = "",
				text = {
					"{C:joy_ritual,s:1.3}의식{} {C:attention,s:1.3}조커{}: {C:joy_spell}엑스트라 덱{}에 보내지지 않고, 상점에서 직접 소환되야 합니다. {C:joy_normal}메인 덱{} {C:attention}조커{}로 취급됩니다",
				},
			},
			--#endregion
		},
		JoyPokerHand = {
			phd_joy_eldlixir = {
				name = "엘드릭시르",
				text = {
					"{C:attention}황금{} 카드 5장",
				},
			},
		},
	},
	misc = {
		challenge_names = {
			c_joy_mystic_wok = "신비의 중화냄비",
			c_joy_mistake = "미스테이크",
			c_joy_monster_reborn = "죽은자의 소생",
			c_joy_domain = "진제왕영역",
		},
		v_text = {
			ch_c_joy_gy_start = {
				"{C:attention}묘지{}에 카드가 있는 채로 시작합니다",
			},
		},
		poker_hands = {
			joy_eldlixir = "엘드릭시르",
		},
		poker_hand_descriptions = {
			joy_eldlixir = {
				"골드 카드 5장",
				"(카드의 능력으로 활성화 되야합니다)",
			},
		},
		dictionary = {
			k_joy_extra_deck = "엑스트라 덱",
			k_joy_summon_conditions = "소환 조건",
			k_joy_graveyard = "묘지",
			k_joy_banishment = "제외",
			k_joy_column = "열",
			k_joy_flipped = "Flipped:",
			k_joy_banish_blind_selected = "블라인드 시작",
			k_joy_banish_end_of_round = "블라인드 끝",
			k_joy_banish_boss_selected = "보스 블라인드 시작",
			k_joy_banish_end_of_ante = "보스 블라인드 끝",
			k_joy_select_materials = "소재 선택",
			k_joy_select_tributes = "릴리스 선택",
			k_joy_summon = "소환",
			k_joy_detach = "엑시즈",
			k_joy_activate = "발동",
			k_joy_token = "토큰",
			k_joy_disable_tooltips = "용어 툴팁 비활성화",
			k_joy_disable_booster_tag = "부스터 태그",
			k_joy_only_ygo_cards = "몬스커 카드만 등장",
			k_joy_extra_ygo_booster = "모든 상점에 부스터 팩 추가",
			k_joy_splash = "첨벙!",
			k_joy_defeated = "패배!",
			k_joy_banished = "제외!",
			k_joy_flip = "뒤집기!",
			k_joy_set = "세트!",
			k_joy_revive = "소생!",
			k_joy_mill = "덩핌!!",
			k_joy_add = "추가!",
			k_joy_return = "돌아감!",
			k_joy_booster_group = "몬스터 팩",
			k_joy_related = "관련된 카드",
			k_joy_monster_tag_default = "몬스터 조커",
			k_joy_glossary = "용어 사전",
			k_joy_summon_glosary = "소환 용어 사전",
			k_joy_credits = "크레딧",
			k_joy_discord = "디스코드",
			k_joy_github = "Github",
			--#region Card types
			k_joy_Aqua = "물족",
			k_joy_Beast = "야수족",
			k_joy_BeastWarrior = "야수전사족",
			k_joy_CreatorGod = "창조신족",
			k_joy_Cyberse = "사이버스족",
			k_joy_Dinosaur = "공룡",
			k_joy_DivineBeast = "환신야수족",
			k_joy_Dragon = "용족",
			k_joy_Fairy = "천사족",
			k_joy_Fiend = "악마족",
			k_joy_Fish = "어류족",
			k_joy_Illusion = "환상마족",
			k_joy_Insect = "곤충족",
			k_joy_Machine = "기계족",
			k_joy_Plant = "식물족",
			k_joy_Psychic = "사이킥족",
			k_joy_Pyro = "화염족",
			k_joy_Reptile = "파충류족",
			k_joy_Rock = "암석족",
			k_joy_SeaSerpent = "해룡족",
			k_joy_Spellcaster = "마법사족",
			k_joy_Thunder = "번개족",
			k_joy_Warrior = "전사족",
			k_joy_WingedBeast = "비행야수족",
			k_joy_Wyrm = "환룡족",
			k_joy_Zombie = "언데드족",
			k_joy_effect = "효과",
			k_joy_normal = "일반",
			k_joy_tuner = "튜너",
			k_joy_pendulum = "펜듈럼",
			k_joy_FUSION = "융합",
			k_joy_RITUAL = "의식",
			k_joy_SYNCHRO = "싱크로",
			k_joy_XYZ = "엑시즈",
			k_joy_LINK = "링크",
			k_joy_LIGHT = "빛",
			k_joy_DARK = "어둠",
			k_joy_WATER = "물",
			k_joy_FIRE = "불",
			k_joy_EARTH = "땅",
			k_joy_WIND = "바람",
			k_joy_DIVINE = "신",
			k_joy_spell = "마법",
			k_joy_trap = "함정",
			k_joy_fieldspell = "필드 마법",
			--#endregion
			--#region Archetypes
			k_joy_archetype_dmaid = "드래곤메이드",
			k_joy_archetype_ltwin = "이빌트윈",
			k_joy_archetype_dogma = "드래그마",
			k_joy_archetype_yokai = "요괴소녀",
			k_joy_archetype_spright = "스프라이트",
			k_joy_archetype_mekk = "잭나이츠",
			k_joy_archetype_generaider = "제너레이드",
			k_joy_archetype_fish = "고티스",
			k_joy_archetype_psy = "PSY프레임",
			k_joy_archetype_runick = "루닉",
			k_joy_archetype_ba = "피안",
			k_joy_archetype_lab = "라뷰린스",
			k_joy_archetype_sub = "서브테러",
			k_joy_archetype_eld = "엘드리치",
			k_joy_archetype_ignis = "@이그니스터",
			k_joy_archetype_solfa = "도레미코드",
			k_joy_archetype_witch = "위치크래프트",
			k_joy_archetype_shaddoll = "섀도르",
			k_joy_archetype_paleo = "버제스토마",
			k_joy_archetype_invoked = "소환수",
			k_joy_archetype_danger = "미계역",
			k_joy_archetype_adaman = "아다마시아",
			k_joy_archetype_misc = "용병",
			k_joy_archetype_token = "토큰",
			--#endregion
			k_joy_arrival_text1 = ": Lowers ",
			k_joy_arrival_text2 = "Blind",
			k_joy_arrival_text3 = "'s requirement by ",
			k_joy_arrival_text4 = "50%",
		},
	},
}
