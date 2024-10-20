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
         basename = "idle", -- TODO(GunChleoc): No animation yet.
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
        europeans_weaver_normal = 1,
        europeans_weaver_basic = 1
    },

    inputs = {
        { name = "reed", amount = 4 },
        { name = "wool", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_cloth",
                "call=produce_tabard",
                "call=produce_armor",
                "call=produce_armor_idle",
                "return=skipped"
            }
        },
        produce_cloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
            descname = pgettext("europeans_building", "weaving cloth"),
            actions = {
                "return=skipped when economy needs reed and not economy needs cloth",
                "return=skipped unless site has reed",
                "consume=reed",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:45s",
                "produce=cloth"
            }
        },
        produce_tabard = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring a tabard because ...
           descname = pgettext("europeans_building", "tailoring a tabard"),
            actions = {
                "return=skipped when economy needs reed and not economy needs tabard",
                "return=skipped unless site has reed",
                "consume=reed",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:45s",
                "produce=tabard"
            }
        },
        produce_armor = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring an armor because ...
            descname = pgettext("europeans_building", "forging a suit of armor"),
            actions = {
                "return=skipped when economy needs wool and not economy needs armor",
                "return=skipped unless site has wool",
                "consume=wool",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:45s",
                "produce=armor"
            }
        },
        produce_armor_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs tabard",
                "return=skipped when economy needs armor",
                "return=skipped when economy needs reed and not workers need experience",
                "consume=reed",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:45s",
                "produce=tabard",
                "consume=wool",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:45s",
                "produce=armor",
                "sleep=duration:180s"
            }
        }
    },
}

pop_textdomain()
