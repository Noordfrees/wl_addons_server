push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_trainingscamp_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Trainingscamp Level 3"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 55, 59 },
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = { 55, 59 },
      },
    },
    
    size = "big",
    enhancement = {
        name = "europeans_trainingscamp_level_4",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            marble_column = 2,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2,
            scrap_metal_mixed = 1
        },
    },

    aihints = { },

    working_positions = {
        europeans_trainer_normal = 1
    },

    inputs = {
        { name = "europeans_recruit", amount = 4 },
        { name = "coin_wood", amount = 4 },
        { name = "spear_wooden", amount = 4 },
        { name = "armor", amount = 4 },
        { name = "quartz", amount = 4 },
        { name = "diamond", amount = 4 }
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=recruit_soldier",
                "call=recruit_trainer",
                "return=skipped"
            }
        },
        recruit_soldier = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting soldier"),
            actions = {
                "return=skipped unless economy needs europeans_soldier",
                "consume=europeans_recruit",
                "consume=armor spear_wooden coin_wood diamond",
                "animate=working duration:70s",
                "recruit=europeans_soldier",
                "consume=europeans_recruit",
                "consume=armor spear_wooden coin_wood quartz",
                "animate=working duration:70s",
                "recruit=europeans_soldier"
            }
        },
         recruit_trainer= {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting trainer"),
            actions = {
                "return=skipped unless economy needs europeans_trainer_normal",
                "consume=europeans_recruit",
                "consume=armor spear_wooden coin_wood quartz,diamond",
                "animate=working duration:140s",
                "recruit=europeans_trainer_normal"
            }
        },
    },
}

pop_textdomain()
