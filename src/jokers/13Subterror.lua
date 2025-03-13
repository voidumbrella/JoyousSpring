--- SUBTERROR
SMODS.Atlas({
    key = "sub",
    path = "13Subterror.png",
    px = 71,
    py = 95
})


SMODS.Joker({
    key = "sub_fiendess",
    atlas = 'sub',
    pos = { x = 0, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Spellcaster",
                monster_archetypes = { ["Subterror"] = true }
            },
            flips = 1,
            revives = 1
        },
    },
    calculate = function(self, card, context)
        if JoyousSpring.can_use_abilities(card) then
            if not context.blueprint_card then
                if context.joy_activate_effect and context.joy_activated_card == card then
                    local materials = {}
                    for i, joker in ipairs(G.jokers.cards) do -- TODO: remove links and tokens
                        if joker ~= card and joker.facing == 'front' then
                            materials[#materials + 1] = joker
                        end
                    end
                    if next(materials) then
                        JoyousSpring.create_overlay_effect_selection(card, materials, card.ability.extra.flips,
                            card.ability.extra.flips, localize("k_joy_select"))
                    end
                end
                if context.joy_exit_effect_selection and context.joy_card == card and
                    #context.joy_selection == card.ability.extra.flips then
                    for _, selected_card in ipairs(context.joy_selection) do
                        selected_card:flip()
                    end
                    card:flip()
                    for i = 1, card.ability.extra.revives do
                        JoyousSpring.revive_pseudorandom(
                            { { monster_archetypes = { "Subterror" } } },
                            pseudoseed("j_joy_sub_fiendess"),
                            false,
                            { negative = true }
                        )
                    end
                end
            end
        end
    end,
    joy_can_activate = function(card)
        local faceup_joker = false
        for _, joker in ipairs(G.jokers.cards) do
            if joker ~= card and joker.facing == 'front' then
                faceup_joker = true
                break
            end
        end
        return faceup_joker
    end,

})
SMODS.Joker({
    key = "sub_defender",
    atlas = 'sub',
    pos = { x = 1, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 50, 0 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "BeastWarrior",
                monster_archetypes = { ["Subterror"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_archer",
    atlas = 'sub',
    pos = { x = 2, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Fairy",
                monster_archetypes = { ["Subterror"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_warrior",
    atlas = 'sub',
    pos = { x = 3, y = 0 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1, 2 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Warrior",
                monster_archetypes = { ["Subterror"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_guru",
    atlas = 'sub',
    pos = { x = 0, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 2, 2, 1, 1 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Dragon",
                monster_archetypes = { ["Subterror"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_stygo",
    atlas = 'sub',
    pos = { x = 1, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1.5 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "SeaSerpent",
                monster_archetypes = { ["Subterror"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_drago",
    atlas = 'sub',
    pos = { x = 2, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Zombie",
                monster_archetypes = { ["Subterror"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_uma",
    atlas = 'sub',
    pos = { x = 3, y = 1 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 2 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Reptile",
                monster_archetypes = { ["Subterror"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_phos",
    atlas = 'sub',
    pos = { x = 0, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 30, 0, 5 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Aqua",
                monster_archetypes = { ["Subterror"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_volt",
    atlas = 'sub',
    pos = { x = 1, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 50, 0 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Thunder",
                monster_archetypes = { ["Subterror"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_stala",
    atlas = 'sub',
    pos = { x = 2, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 5 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Rock",
                monster_archetypes = { ["Subterror"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_speleo",
    atlas = 'sub',
    pos = { x = 3, y = 2 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 0.1, 1 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Fiend",
                monster_archetypes = { ["Subterror"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_ultra",
    atlas = 'sub',
    pos = { x = 0, y = 3 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 200, 0 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Pyro",
                monster_archetypes = { ["Subterror"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_befiendess",
    atlas = 'sub',
    pos = { x = 2, y = 3 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 100, 50, 0, 0, 2, 1 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                attribute = "EARTH",
                monster_type = "Wyrm",
                monster_archetypes = { ["Subterror"] = true }
            },
        },
    },
})
SMODS.Joker({
    key = "sub_city",
    atlas = 'sub',
    pos = { x = 1, y = 3 },
    rarity = 1,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { 1 } }
    end,
    joy_desc_cards = {
        { "j_joy_sub_city", properties = { { monster_archetypes = { "Subterror" } } }, name = "Archetype" },
    },
    generate_ui = JoyousSpring.generate_info_ui,
    set_sprites = JoyousSpring.set_back_sprite,
    config = {
        extra = {
            joyous_spring = JoyousSpring.init_joy_table {
                is_field_spell = true,
            },
        },
    },
})

JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "sub" },
    label = "k_joy_archetype_sub"
}
