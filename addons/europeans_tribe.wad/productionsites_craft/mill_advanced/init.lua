push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_mill_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Mill"),
    icon = dirname .. "menu.png",
    size = "medium",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 41, 87 },
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 41, 87 },
            fps = 25
        },
    },

    aihints = {},

    working_positions = {
        europeans_miller_advanced = 1,
        europeans_miller_basic = 1
    },

    inputs = {
        { name = "rye", amount = 8 },
        { name = "wheat", amount = 8 }
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
                "return=skipped unless economy needs flour",
                "return=skipped when economy needs meat and not economy needs flour",
                "return=skipped unless site has rye:4",
                "return=skipped unless site has wheat:4",
                "sleep=duration:15s",
                "consume=wheat:4 rye:4",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:60s",
                "produce=flour:7"
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