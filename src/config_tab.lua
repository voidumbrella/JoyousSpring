--- MOD CONFIG

SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = { r = 0.1, minw = 8, align = "tm", padding = 0.2, colour = G.C.BLACK },
        nodes = {
            {
                n = G.UIT.R,
                config = { padding = 0.2 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "cm" },
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = { align = "cm", padding = 0.01 },
                                nodes = {
                                    create_toggle({
                                        label = localize('b_joy_disable_booster_tag'),
                                        ref_table = JoyousSpring.config,
                                        ref_value = 'disable_booster_tag'
                                    })
                                }
                            },
                        }
                    },
                }
            },
        }
    }
end