push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_smelting_works_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Smelting Works"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 62, 76 },
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = { 62, 76 },
      }
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_smelting_works_advanced",
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
        europeans_smelter_normal = 1
    },

    inputs = {
        { name = "coal", amount = 6 },
        { name = "ore", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=smelt_gold",
                "call=smelt_iron",
                "call=smelt_iron_idle",
                "return=skipped"
            }
        },
        smelt_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
            descname = pgettext("europeans_building", "smelting iron"),
            actions = {
                "return=skipped unless economy needs iron or workers need experience",
                "return=skipped unless site has coal:2",
                "return=skipped unless site has ore:2",
                "consume=ore:2 coal:2",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=working duration:45s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron:2"
            }
        },
        smelt_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
            descname = pgettext("europeans_building", "smelting gold"),
            actions = {
                "return=skipped unless economy needs gold or workers need experience",
                "return=skipped unless site has coal:2",
                "return=skipped unless site has ore:2",
                "consume=ore:2 coal:2",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=working duration:45s",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold"
            }
        },
        smelt_iron_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs iron",
                "return=skipped when economy needs gold",
                "return=skipped when economy needs coal",
                "consume=ore:3 coal:3",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:45s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron:2",
                "sleep=duration:60s",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:45s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=gold",
                "sleep=duration:120s"
            }
        }
    },
}

pop_textdomain()
