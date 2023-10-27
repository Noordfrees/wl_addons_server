push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_lumberjacks_house_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Lumberjack's House"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 42, 48 },
      },
    },
    
    size = "small",
    enhancement = {
        name = "europeans_lumberjacks_house_advanced",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            marble = 1
        },
    },

    aihints = {},

    working_positions = {
        europeans_lumberjack_normal = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "callworker=check_trees",
                "call=pausing_production_for_outputs",
                "call=felling_trees",
                "return=skipped"
            }
        },
        pausing_production_for_outputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production because output not needed yet"),
            actions = {
                "return=skipped when economy needs log",
                "sleep=duration:10m",
            }
        },
        felling_trees = {
            -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
            descname = pgettext("europeans_building", "felling trees"),
            actions = {
                "return=skipped unless economy needs log or workers need experience",
                "callworker=harvest",
                "produce=log"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Trees",
        heading = _"Out of Trees",
        message = pgettext("europeans_building", "The woodcutter working at this woodcutter’s house can’t find any trees in his work area. You should consider enhancing it to increase its working area or building a forester’s house."),
        productivity_threshold = 60
    },
}

pop_textdomain()
