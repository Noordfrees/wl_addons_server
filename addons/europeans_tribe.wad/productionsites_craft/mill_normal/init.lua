push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_mill_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Mill"),
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_mill_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            grout = 2,
            marble = 2,
            cloth = 2
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
            hotspot = { 58, 61 },
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 58, 61 },
            fps = 25
        }
    },

    aihints = {},

    working_positions = {
        europeans_miller_normal = 1
    },

    inputs = {
        { name = "rye", amount = 6 },
        { name = "wheat", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_mixed_flour",
                "call=produce_mixed_flour_idle",
                "return=skipped"
            }
        },
        produce_mixed_flour = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding rye and wheat because ...
            descname = pgettext("europeans_building", "grinding rye and wheat"),
            actions = {
                "return=skipped unless economy needs flour or workers need experience",
                "return=skipped when economy needs meat and not economy needs flour",
                "return=skipped unless site has rye:3",
                "return=skipped unless site has wheat:3",
                "sleep=duration:25s",
                "consume=wheat:3 rye:3",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:60s",
                "produce=flour:5"
            }
        },
        produce_mixed_flour_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs flour",
                "sleep=duration:120s",
                "consume=wheat rye",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:60s",
                "produce=flour"
            }
        }
    },
}

pop_textdomain()