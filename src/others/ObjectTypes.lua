SMODS.ObjectType({
    key = "joy_monster",
    default = "j_joy_eccentrick",
    cards = {},
})

SMODS.ObjectType({
    key = "joy_extra",
    default = "j_joy_garura",
    cards = {},
})

SMODS.ObjectType({
    key = "joy_field",
    default = "j_joy_runick_fountain",
    cards = {},
})

local SMODS_injectItems_ref = SMODS.injectItems
function SMODS.injectItems()
    SMODS_injectItems_ref()
    for k, v in pairs(G.P_CENTERS) do
        if k ~= "j_joy_token" and k:sub(1, 5) == "j_joy" then
            SMODS.ObjectTypes["joy_monster"]:inject_card(v)
            local monster_card_properties = v.config and v.config.extra and
                type(v.config.extra) == "table" and
                v.config.extra.joyous_spring
            if monster_card_properties and not monster_card_properties.is_main_deck then
                if monster_card_properties.is_field_spell then
                    SMODS.ObjectTypes["joy_field"]:inject_card(v)
                else
                    SMODS.ObjectTypes["joy_extra"]:inject_card(v)
                end
            end
            if monster_card_properties and monster_card_properties.summon_type == "RITUAL" then
                SMODS.ObjectTypes["joy_extra"]:inject_card(v)
            end
        end
    end
end
