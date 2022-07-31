push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_scouts_house_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Scout’s House"),
    icon = dirname .. "menu.png",
    size = "small",

    enhancement = {
        name = "europeans_scouts_house_advanced",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            marble = 1
        }
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 41, 44 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 41, 44 },
        }
    },

    aihints = {},

    working_positions = {
        europeans_scout_normal = 1
    },

    inputs = {
        { name = "snack", amount = 2 },
        { name = "mead", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start scouting because ...
            descname = pgettext("europeans_building", "scouting"),
            actions = {
                "consume=snack mead",
                "sleep=duration:30s",
                "callworker=scout"
            }
        },
        targeted_scouting = {
            descname = pgettext("europeans_building", "scouting"),
            actions = {
                "consume=snack mead",
                "callworker=targeted_scouting"
            }
        },
    },
}

pop_textdomain()
