push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_brewery_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Brewery"),
    icon = dirname .. "menu.png",
    size = "medium",
    
    enhancement = {
        name = "europeans_brewery_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            grout = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            granite = 2,
            marble = 2,
            planks = 1
        }
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 60, 59 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 60, 59 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_brewer_normal = 1
    },

    inputs = {
        { name = "water", amount = 12 },
        { name = "barley", amount = 12 },
        { name = "honey", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=brew_beer",
                "call=brew_mead",
                "call=brew_strong_beer",
                "call=brew_mead_idle",
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
                "animate=working duration:70s",
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
                "animate=working duration:70s",
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
                "animate=working duration:90s",
                "produce=beer_strong:3",
                "sleep=duration:30s"
            }
        },
        brew_mead_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs beer",
                "return=skipped when economy needs beer_strong",
                "return=skipped when economy needs mead",
                "return=skipped when economy needs water",
                "consume=water:4 barley:4 honey",
                "animate=working duration:80s",
                "produce=beer",
                "sleep=duration:90s",
                "animate=working duration:90s",
                "produce=beer_strong",
                "sleep=duration:90s",
                "animate=working duration:90s",
                "produce=mead",
                "sleep=duration:120s"
            }
        }
    },
}

pop_textdomain()
