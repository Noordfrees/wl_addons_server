push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_goldmine_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Gold Mine Level 3"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 51, 54 },
      },
      empty = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 51, 54 },
      },
      working = {
         fps = 10,
         frames = 10,
         columns = 10,
         rows = 1,
         hotspot = { 51, 54 },
      },
    },
    
    size = "mine",
    enhancement = {
        name = "europeans_goldmine_level_4",
        enhancement_cost = {
            planks = 4
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 1,
            marble = 1
        }
    },

    aihints = {},

    working_positions = {
        europeans_miner_advanced = 2,
        europeans_miner_basic = 1
    },

    inputs = {
        { name = "mead", amount = 4 },
        { name = "honey_bread", amount = 2 },
        { name = "meat", amount = 2 },
        { name = "fish", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining gold because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped when economy needs mead and not economy needs granite and not economy needs ore and not economy needs quartz",
                "return=skipped when economy needs honey_bread and not economy needs granite and not economy needs ore and not economy needs quartz",
                "return=skipped when economy needs coal and not economy needs ore and not economy needs quartz",
                "consume=honey_bread",
                "call=mine_stone",
                "call=mine_ore",
                "call=mine_ore",
                "call=mine_marble",
                "sleep=duration:5s",
                "consume=mead",
                "call=mine_stone",
                "call=mine_ore",
                "call=mine_ore",
                "call=mine_quartz",
                "sleep=duration:5s",
                "consume=meat,fish",
                "call=mine_stone",
                "call=mine_ore",
                "call=mine_ore",
                "call=mine_marble",
                "sleep=duration:5s",
                "consume=mead",
                "call=mine_stone",
                "call=mine_ore",
                "call=mine_ore",
                "call=mine_quartz",
            }
        },
        mine_ore = {
            descname = pgettext("europeans_building", "mining ore"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_gold radius:8 yield:80% when_empty:15% experience_on_fail:10%",
                "produce=ore",
            }
        },
        mine_stone = {
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_gold radius:8 yield:80% when_empty:15% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_marble = {
            descname = pgettext("europeans_building", "mining marble"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_gold radius:8 yield:80% when_empty:15% experience_on_fail:10%",
                "produce=marble",
            }
        },
        mine_quartz = {
            descname = pgettext("europeans_building", "mining quartz"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_gold radius:8 yield:80% when_empty:15% experience_on_fail:10%",
                "produce=quartz",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=mead:2 honey_bread meat,fish",
                "produce=ore:8 granite:4 marble:2 quartz:2",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Gold",
        heading = _"Main Gold Vein Exhausted",
        message =
            pgettext("europeans_building", "This gold mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
    },
}

pop_textdomain()