push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_ironmine_level_5",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Iron Mine Level 5"),
    icon = dirname .. "menu.png",
    size = "mine",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 50, 56 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 50, 56 },
        },
        empty = {
            pictures = path.list_files(dirname .. "empty_??.png"),
            hotspot = { 50, 56 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_miner_advanced = 3
    },

    inputs = {
        { name = "meal", amount = 6 },
        { name = "wine", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining iron because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped unless economy needs ore or economy needs granite or economy needs quartz or workers need experience",
                "return=skipped when economy needs coal and not economy needs ore",
                "return=skipped unless site has meal:4",
                "return=skipped unless site has wine:4",
                "consume=meal wine",
                "call=mine_stone",
                "call=mine_ore",
                "call=mine_ore",
                "call=mine_ore",
                "sleep=duration:5s",
                "consume=meal wine",
                "call=mine_stone",
                "call=mine_ore",
                "call=mine_ore",
                "call=mine_quartz",
                "sleep=duration:5s",
                "consume=meal wine",
                "call=mine_stone",
                "call=mine_ore",
                "call=mine_ore",
                "call=mine_ore",
                "sleep=duration:5s",
                "consume=meal wine",
                "call=mine_stone",
                "call=mine_ore",
                "call=mine_ore",
                "call=mine_quartz",
                "sleep=duration:5s",
                "return=skipped"
            }
        },
        mine_ore = {
            descname = pgettext("europeans_building", "mining ore"),
            actions = {
                "animate=working duration:35s",
                "mine=resource_iron radius:12 yield:100% when_empty:20% experience_on_fail:10%",
                "produce=ore",
            }
        },
        mine_stone = {
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "animate=working duration:35s",
                "mine=resource_iron radius:12 yield:100% when_empty:20% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_quartz = {
            descname = pgettext("europeans_building", "mining quartz"),
            actions = {
                "animate=working duration:35s",
                "mine=resource_iron radius:12 yield:100% when_empty:20% experience_on_fail:10%",
                "produce=quartz",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=meal:4 wine:4",
                "produce=ore:10 granite:4 quartz:2",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Iron",
        heading = _"Main Iron Vein Exhausted",
        message =
            pgettext("europeans_building", "This iron mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider dismantling or destroying it."),
    },
}

pop_textdomain()
