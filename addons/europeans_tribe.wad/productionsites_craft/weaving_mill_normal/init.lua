push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_weaving_mill_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Weaving Mill"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 66, 71 },
      },
      working = {
         basename = "idle",
         hotspot = { 66, 71 },
      }
    },
   
    size = "medium",
    enhancement = {
        name = "europeans_weaving_mill_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2
        }
    },

    aihints = {},

    working_positions = {
        europeans_worker_normal = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "reed", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production",
                "sleep=duration:30s",
                "call=produce_cloth",
                "sleep=duration:30s",
                "call=produce_armor",
                "return=skipped"
            }
        },
        pausing_production = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for reed"),
            actions = {
                "return=skipped when not economy needs reed",
                "sleep=duration:5m",
            }
        },
        produce_cloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
            descname = pgettext("europeans_building", "weaving cloth"),
            actions = {
                "return=skipped unless economy needs cloth or workers need experience",
                "return=skipped when economy needs armor and not economy needs cloth",
                "return=skipped when economy needs reed and not economy needs cloth",
                "consume=reed:2",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:60s",
                "produce=cloth:2"
            }
        },
        produce_armor = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring an armor because ...
            descname = pgettext("europeans_building", "tailoring a suit of armor"),
            actions = {
                "return=skipped unless economy needs armor or workers need experience",
                "return=skipped when economy needs cloth and not economy needs armor",
                "return=skipped when economy needs reed and not economy needs armor",
                "consume=reed:2",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:60s",
                "produce=armor"
            }
        }
    },
}

pop_textdomain()
