push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_brewery_winery",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Brewery and Winery"),
    icon = dirname .. "menu.png",
    size = "medium",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 39, 62 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 39, 62 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_brewer_advanced = 1,
        europeans_brewer_normal = 1
    },

    inputs = {
        { name = "water", amount = 14 },
        { name = "barley", amount = 12 },
        { name = "honey", amount = 4 },
        { name = "grape", amount = 6 },
        { name = "fruit", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=brew_beer",
                "call=brew_mead",
                "call=brew_strong_beer",
                "call=making_wine",
                "call=making_wine_idle",
                "return=skipped"
            }
        },
        brew_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing beer because ...
            descname = pgettext("europeans_building", "brewing beer"),
            actions = {
                "return=skipped when economy needs water and not economy needs beer",
                "return=skipped unless economy needs beer or workers need experience",
                "return=skipped when site has honey and economy needs mead and not economy needs beer",
                "return=skipped when site has barley and economy needs beer_strong and not economy needs beer",
                "return=skipped unless site has water:4",
                "return=skipped unless site has barley:4",
                "consume=water:4 barley:4",
                "animate=working duration:60s",
                "produce=beer:4",
                "sleep=duration:30s"
            }
        },
        brew_mead = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing mead because ...
            descname = pgettext("europeans_building", "brewing mead"),
            actions = {
                "return=skipped when economy needs water and not economy needs mead",
                "return=skipped unless economy needs mead or workers need experience",
                "return=skipped when site has barley and economy needs beer and not economy needs mead",
                "return=skipped when site has barley and economy needs beer_strong and not economy needs mead",
                "return=skipped unless site has water:4",
                "return=skipped unless site has barley:4",
                "return=skipped unless site has honey:4",
                "consume=water:4 barley:4 honey:4",
                "animate=working duration:60s",
                "produce=mead:4",
                "sleep=duration:30s"
            }
        },
        brew_strong_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing strong beer because ...
            descname = pgettext("europeans_building", "brewing strong beer"),
            actions = {
                "return=skipped when economy needs water and not economy needs beer_strong",
                "return=skipped unless economy needs beer_strong or workers need experience",
                "return=skipped when site has barley and economy needs beer and not economy needs beer_strong",
                "return=skipped when site has honey and economy needs mead and not economy needs beer_strong",
                "return=skipped unless site has water:4",
                "return=skipped unless site has barley:4",
                "consume=water:4 barley:4",
                "animate=working duration:70s",
                "produce=beer_strong:3",
                "sleep=duration:30s"
            }
        },
        making_wine = {
            -- TRANSLATORS: Completed/Skipped/Did not start making wine because ...
            descname = pgettext("europeans_building", "making wine"),
            actions = {
                -- Grapes are only needed for wine, so no need to check if wine is needed
                "return=skipped when economy needs water and not economy needs wine",
                "return=skipped unless economy needs wine or workers need experience",
                "return=skipped unless site has water:2",
                "return=skipped unless site has fruit:2",
                "return=skipped unless site has grape:6",
                "consume=water:2 fruit:2 grape:6",
                "playsound=sound/empire/winebubble priority:40% allow_multiple",
                "animate=working duration:70s",
                "produce=wine:6",
                "sleep=duration:30s"
            }
        },
        making_wine_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs beer",
                "return=skipped when economy needs beer_strong",
                "return=skipped when economy needs mead",
                "return=skipped when economy needs wine",
                "return=skipped when economy needs water",
                "consume=water:5 barley:4 honey fruit grape",
                "animate=working duration:80s",
                "produce=beer",
                "sleep=duration:90s",
                "animate=working duration:90s",
                "produce=beer_strong",
                "sleep=duration:90s",
                "animate=working duration:90s",
                "produce=mead",
                "sleep=duration:90s",
                "playsound=sound/empire/winebubble priority:40% allow_multiple",
                "animate=working duration:70s",
                "produce=wine",
                "sleep=duration:120s"
            }
        }
    },
}

pop_textdomain()
