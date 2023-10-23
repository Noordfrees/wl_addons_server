push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_brewery_winery",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Brewery and Winery"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 42, 66 },
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 42, 66 },
      },
    },
    
    size = "medium",

    aihints = {},

    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_normal = 1
    },

    inputs = {
        { name = "water", amount = 6 },
        { name = "barley", amount = 6 },
        { name = "honey", amount = 2 },
        { name = "fruit", amount = 2 },
        { name = "grape", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production_for_inputs",
                "sleep=duration:15s",
                "call=pausing_production_for_outputs",
                "sleep=duration:15s",
                "call=making_wine",
                "sleep=duration:15s",
                "call=brew_strong_beer",
                "sleep=duration:15s",
                "call=brew_mead",
                "sleep=duration:15s",
                "call=brew_beer",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for water and barley"),
            actions = {
                "return=skipped when site has water:4 and site has barley:4",
                "sleep=duration:5m",
            }
        },
        pausing_production_for_outputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production because output not needed yet"),
            actions = {
                "return=skipped when economy needs beer",
                "return=skipped when economy needs mead",
                "return=skipped when economy needs beer_strong",
                "return=skipped when economy needs wine",
                "sleep=duration:30m",
            }
        },
        brew_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing beer because ...
            descname = pgettext("europeans_building", "brewing beer"),
            actions = {
                "return=skipped when economy needs mead and not economy needs beer",
                "return=skipped when economy needs beer_strong and not economy needs beer",
                "consume=water barley",
                "animate=working duration:60s",
                "produce=beer:4"
            }
        },
        brew_mead = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing mead because ...
            descname = pgettext("europeans_building", "brewing mead"),
            actions = {
                "return=skipped when site has barley and economy needs beer and not economy needs mead",
                "return=skipped when site has barley and economy needs beer_strong and not economy needs mead",
                "return=skipped unless site has honey",
                "consume=water barley honey",
                "animate=working duration:60s",
                "produce=mead"
            }
        },
        brew_strong_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing strong beer because ...
            descname = pgettext("europeans_building", "brewing strong beer"),
            actions = {
                "return=skipped when economy needs beer and not economy needs beer_strong",
                "return=skipped when economy needs mead and not economy needs beer_strong",
                "return=skipped unless site has fruit",
                "consume=water barley fruit",
                "animate=working duration:60s",
                "produce=beer_strong"
            }
        },
        making_wine = {
            -- TRANSLATORS: Completed/Skipped/Did not start making wine because ...
            descname = pgettext("europeans_building", "making wine"),
            actions = {
                -- Grapes are only needed for wine, so no need to check if wine is needed
                "return=skipped when economy needs grape and not economy needs wine",
                "consume=grape:2",
                "playsound=sound/empire/winebubble priority:40% allow_multiple",
                "animate=working duration:60s",
                "produce=wine"
            }
        }
    },
}

pop_textdomain()
