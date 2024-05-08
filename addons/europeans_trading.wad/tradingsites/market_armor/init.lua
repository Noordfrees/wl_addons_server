push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_market_cloth_armor",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Cloth and Armor Market"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 87, 113 }
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 87, 113 }
      }
    },

    size = "big",
    destructible = true,
    
    buildcost = {
        planks = 4,
        brick = 4,
        marble = 4,
        marble_column = 2,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 4,
        marble = 5,
        quartz = 1,
        diamond = 1
    },
    
    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 2,
    },

    working_positions = {
        europeans_carrier_1 = 1,
        europeans_carrier_2 = 1,
        europeans_carrier_3 = 1,
        europeans_trader = 2
    },

    inputs = {
        { name = "gold", amount = 4 },
        { name = "cloth", amount = 12 },
        { name = "armor", amount = 12 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trading_for_copper",
                "sleep=duration:30s",
                "call=trading_for_silver",
                "sleep=duration:30s",
                "call=trading_for_gold"
            }
        },
        trading_for_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for copper coins"),
            actions = {
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "call=pausing_production_for_gold",
                "sleep=duration:10s",
                "call=trade_cloth_copper",
                "sleep=duration:10s",
                "call=trade_armor_copper"
            }
        },
        trading_for_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for silver coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "call=pausing_production_for_gold",
                "sleep=duration:10s",
                "call=trade_cloth_silver",
                "sleep=duration:10s",
                "call=trade_armor_silver"
            }
        },
        trading_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for gold coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "call=pausing_production_for_gold",
                "sleep=duration:10s",
                "call=trade_cloth_gold",
                "sleep=duration:10s",
                "call=trade_armor_gold"
            }
        },
        pausing_production_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing trading of gold"),
            actions = {
                "return=skipped when site has gold:4",
                "sleep=duration:15m",
            }
        },
        trade_cloth_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has cloth:4",
                "return=skipped unless site has gold",
                "consume=cloth:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:3",
                "sleep=duration:30s",
            }
        },
        trade_cloth_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has cloth:6",
                "return=skipped unless site has gold",
                "consume=cloth:6 gold",
                "animate=working duration:30s",
                "produce=coin_silver:3",
                "sleep=duration:30s",
            }
        },
        trade_cloth_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has cloth:8",
                "return=skipped unless site has gold",
                "consume=cloth:8 gold",
                "animate=working duration:30s",
                "produce=coin_gold:3",
                "sleep=duration:30s",
            }
        },
        trade_armor_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has armor:4",
                "return=skipped unless site has gold",
                "consume=armor:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_armor_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has armor:4",
                "return=skipped unless site has gold",
                "consume=armor:4 gold",
                "animate=working duration:30s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_armor_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has armor:6",
                "return=skipped unless site has gold",
                "consume=armor:6 gold",
                "animate=working duration:30s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
