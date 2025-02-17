--- GHOST GIRLS
SMODS.Atlas({
    key = "joy_MekkKnight",
    path = "06MekkKnight.png",
    px = 71,
    py = 95
})

-- -- Mekk-Knight Avram
-- SMODS.Joker({
--     key = "mekk_avram",
--     atlas = 'MekkKnight',
--     pos = { x = 0, y = 0 },
--     rarity = 1,
--     discovered = true,
--     blueprint_compat = false,
--     eternal_compat = true,
--     cost = 1,
--     generate_ui = JoyousSpring.generate_info_ui,
--     config = {
--         extra = {
--             joyous_spring = {
--                 is_main_deck = true,
--                 summon_type = "NORMAL",
--                 is_effect = false,
--                 attribute = "LIGHT",
--                 monster_type = "Psychic",
--                 monster_archetypes = { ["MekkKnight"] = true },
--             },
--         },
--     },
--     in_pool = function(self, args)
--         return args.source and args.source == "JoyousSpring" or false
--     end,
-- })


JoyousSpring.collection_pool[#JoyousSpring.collection_pool + 1] = {
    keys = { "mekk" },
    label = "b_joy_archetype_mekk"
}