--- GHOST GIRLS
SMODS.Atlas({
    key = "joy_Generaider",
    path = "07Generaider.png",
    px = 71,
    py = 95
})

JoyousSpring.token_pool["generaider"] = {
    name = "j_joy_token_generaider",
    atlas = "joy_Generaider",
    sprite_pos = { x = 1, y = 3 },
    attribute = "LIGHT",
    monster_type = "Fairy",
    monster_archetypes = {["Generaider"] = true}
}