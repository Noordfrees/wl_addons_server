push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_charcoal_kiln_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Charcoal Kiln"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 54, 60 },
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 54, 60 },
      },
    },
    
    size = "medium",

    aihints = {},

    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "scrap_wood", amount = 10 },
        { name = "log", amount = 10 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production",
                "sleep=duration:30s",
                "call=burn_wood",
                "sleep=duration:30s",
                "call=burn_log",
                "return=skipped"
            }
        },
        pausing_production = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for log"),
            actions = {
                "return=skipped when site has scrap_wood:8",
                "return=skipped when site has log:8",
                "sleep=duration:5m",
            }
        },
        burn_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
            descname = pgettext("europeans_building", "producing coal"),
            actions = {
                "return=skipped unless site has scrap_wood:8",
                "consume=scrap_wood:8",
                "animate=working duration:90s",
                "produce=coal:5"
            }
        },
        burn_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
            descname = pgettext("europeans_building", "producing coal"),
            actions = {
                "return=skipped unless economy needs coal or workers need experience",
                "return=skipped when economy needs log or economy needs blackwood or economy needs planks",
                "return=skipped unless site has log:8",
                "consume=log:8",
                "animate=working duration:90s",
                "produce=coal:5"
            }
        }
    },
}

pop_textdomain()
