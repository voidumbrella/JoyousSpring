-- CHALLENGES

JoyousSpring.get_challenge_colour = function (challenge)
    if challenge and challenge.joy_colour then return challenge.joy_colour end
    return nil
end

-- Mystic Wok
SMODS.Challenge({
    key = "mystic_wok",
    rules = {
        custom = {
            { id = "no_interest" }
        }
    },
    jokers = {
        { id = "j_joy_yokai_sister", eternal = true },
        { id = "j_joy_yokai_sister", eternal = true },
    },
    consumeables = {
        { id = "c_fool" },
        { id = "c_hermit" },
    },
    restrictions = {
        banned_cards =
        {
            {
                id = "j_joy_runick_fountain",
                ids = { "j_joy_runick_munin", "j_joy_runick_hugin", "j_joy_runick_geri",
                    "j_joy_runick_freki", "j_joy_runick_sleipnir" }
            },
            { id = "j_joy_fish_snopios" },
            { id = "j_joy_psy_zeta" },
        }
    },
    unlocked = function(self)
        return true
    end,
    joy_colour = G.C.JOY.SPELL
})

-- Mistake
SMODS.Challenge({
    key = "mistake",
    rules = {
        modifiers = {
            { id = "hands", value = 3 },
            { id = "discards", value = 2 },
            { id = "joker_slots", value = 3 },
            { id = "dollars", value = 8 },
        }
    },
    jokers = {
        { id = "j_joy_yokai_ash", eternal = true },
        { id = "j_joy_yokai_ash", eternal = true },
        { id = "j_joy_yokai_ash", eternal = true },
    },
    vouchers = {
        { id = "v_planet_merchant" },
    },
    restrictions = {
        banned_cards =
        {
            { id = "v_wasteful" },
            { id = "v_grabber" },
            { id = "j_merry_andy" },
            { id = "j_drunkard" },
            { id = "j_burglar" },
            { id = "j_juggler" },
            { id = "j_turtle_bean" },
        }
    },
    unlocked = function(self)
        return true
    end,
    joy_colour = G.C.JOY.SPELL
})
