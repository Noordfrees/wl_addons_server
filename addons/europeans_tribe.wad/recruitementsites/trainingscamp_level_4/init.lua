push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_trainingscamp_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Trainingscamp Level 4"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    -- TODO(Nordfriese): Make animations.
    animations = {
      idle = {
         hotspot = {51, 71}
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = {51, 71}
      },
    },

    spritesheets = {
      build = {
         hotspot = {51, 71},
         frames = 3,
         columns = 1,
         rows = 3
      }
    },

    size = "big",

    aihints = {},

    working_positions = {
        europeans_trainer_advanced = 1,
        europeans_trainer_normal = 1
    },

    inputs = {
        { name = "europeans_recruit", amount = 4 },
        { name = "coin_wood", amount = 4 },
        { name = "quartz", amount = 4 },
        { name = "diamond", amount = 4 }
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=recruit_soldier",
                "return=skipped"
            }
        },
        recruit_soldier = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting soldier"),
            actions = {
                "return=skipped unless economy needs europeans_soldier",
                "consume=europeans_recruit",
                "consume=coin_wood diamond",
                "animate=working duration:60s",
                "recruit=europeans_soldier",
                "consume=europeans_recruit",
                "consume=coin_wood quartz",
                "animate=working duration:60s",
                "recruit=europeans_soldier"
            }
        },
    },
}

pop_textdomain()
