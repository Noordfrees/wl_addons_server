push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_farm_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Farm Level 4"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 89, 82 },
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 89, 82 },
      },
    },

    size = "big",
    enhancement = {
        name = "europeans_farm_level_5",
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

    aihints = {},

    working_positions = {
        europeans_farmer_advanced = 2,
        europeans_farmer_normal = 1
    },
    
    inputs = {
        { name = "water", amount = 12 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=plant_idle",
                "call=plant_berrybush",
                "call=plant_grape",
                "call=plant_blackroot",
                "call=plant_corn",
                "call=plant_barley",
                "call=plant_rye",
                "call=plant_wheat",
                "call=harvest_berry",
                "call=harvest_grape",
                "call=harvest_blackroot",
                "call=harvest_corn",
                "call=harvest_barley",
                "call=harvest_rye",
                "call=harvest_wheat",
                "return=skipped"
            }
        },
        plant_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs barley or economy needs rye or economy needs wheat or economy needs corn or economy needs blackroot or economy needs fruit or economy needs grape",
                "return=skipped when economy needs water",
                "consume=water:6",
                "callworker=plant_barley",
                "animate=working duration:3s",
                "callworker=plant_rye",
                "animate=working duration:3s",
                "callworker=plant_wheat",
                "animate=working duration:3s",
                "callworker=plant_corn",
                "animate=working duration:3s",
                "callworker=plant_blackroot",
                "animate=working duration:3s",
                "callworker=plant_berrybush",
                "animate=working duration:3s",
                "callworker=plant_grape",
                "animate=working duration:3s",
                "sleep=duration:30s"
            }
        },
        plant_barley = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting barley because ...
            descname = pgettext("europeans_building", "planting barley"),
            actions = {
                "return=skipped unless economy needs barley or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water",
                "callworker=plant_barley",
                "animate=working duration:3s",
                "consume=water",
                "callworker=plant_barley",
                "animate=working duration:3s"
            }
        },
        plant_berrybush = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting berrybush because ...
            descname = pgettext("europeans_building", "planting berry bushes"),
            actions = {
                "return=skipped unless economy needs fruit or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water:2",
                "callworker=plant_berrybush",
                "animate=working duration:3s"
            }
        },
        plant_blackroot = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting blackroot because ...
            descname = pgettext("europeans_building", "planting blackroot"),
            actions = {
                "return=skipped unless economy needs blackroot or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water",
                "callworker=plant_blackroot",
                "animate=working duration:3s",
                "consume=water",
                "callworker=plant_blackroot",
                "animate=working duration:3s"
            }
        },
        plant_corn = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting corn because ...
            descname = pgettext("europeans_building", "planting corn"),
            actions = {
                "return=skipped unless economy needs corn or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water",
                "callworker=plant_corn",
                "animate=working duration:3s",
                "consume=water",
                "callworker=plant_corn",
                "animate=working duration:3s"
            }
        },
        plant_grape = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting grape because ...
            descname = pgettext("europeans_building", "planting grapes"),
            actions = {
                "return=skipped unless economy needs grape or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water:2",
                "callworker=plant_grape",
                "animate=working duration:3s"
            }
        },
        plant_rye = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting rye because ...
            descname = pgettext("europeans_building", "planting rye"),
            actions = {
                "return=skipped unless economy needs rye or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water",
                "callworker=plant_rye",
                "animate=working duration:3s",
                "consume=water",
                "callworker=plant_rye",
                "animate=working duration:3s"
            }
        },
        plant_wheat = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting wheat because ...
            descname = pgettext("europeans_building", "planting wheat"),
            actions = {
                "return=skipped unless economy needs wheat or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water",
                "callworker=plant_wheat",
                "animate=working duration:3s",
                "consume=water",
                "callworker=plant_wheat",
                "animate=working duration:3s"
            }
        },
        harvest_barley = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting barley because ...
            descname = pgettext("europeans_building", "harvesting barley"),
            actions = {
                "return=skipped unless economy needs barley or workers need experience",
                "callworker=harvest_barley",
                "animate=working duration:3s",
                "produce=barley",
                "callworker=harvest_barley",
                "animate=working duration:3s",
                "produce=barley"
            }
        },
        harvest_berry = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting berry because ...
            descname = pgettext("europeans_building", "harvesting berries"),
            actions = {
                "return=skipped unless economy needs fruit or workers need experience",
                "callworker=harvest_berrybush",
                "animate=working duration:3s",
                "produce=fruit"
            }
        },
        harvest_blackroot = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting blackroot because ...
            descname = pgettext("europeans_building", "harvesting blackroot"),
            actions = {
                "return=skipped unless economy needs blackroot or workers need experience",
                "callworker=harvest_blackroot",
                "animate=working duration:3s",
                "produce=blackroot",
                "callworker=harvest_blackroot",
                "animate=working duration:3s",
                "produce=blackroot"
            }
        },
        harvest_corn = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting corn because ...
            descname = pgettext("europeans_building", "harvesting corn"),
            actions = {
                "return=skipped unless economy needs corn or workers need experience",
                "callworker=harvest_corn",
                "animate=working duration:3s",
                "produce=corn",
                "callworker=harvest_corn",
                "animate=working duration:3s",
                "produce=corn"
            }
        },
        harvest_grape = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting grape because ...
            descname = pgettext("europeans_building", "harvesting grapes"),
            actions = {
                "return=skipped unless economy needs grape or workers need experience",
                "callworker=harvest_grape",
                "animate=working duration:3s",
                "produce=grape"
            }
        },
        harvest_rye = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting rye because ...
            descname = pgettext("europeans_building", "harvesting rye"),
            actions = {
                "return=skipped unless economy needs rye or workers need experience",
                "callworker=harvest_rye",
                "animate=working duration:3s",
                "produce=rye",
                "callworker=harvest_rye",
                "animate=working duration:3s",
                "produce=rye"
            }
        },
        harvest_wheat = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting wheat because ...
            descname = pgettext("europeans_building", "harvesting wheat"),
            actions = {
                "return=skipped unless economy needs wheat or workers need experience",
                "callworker=harvest_wheat",
                "animate=working duration:3s",
                "produce=wheat",
                "callworker=harvest_wheat",
                "animate=working duration:3s",
                "produce=wheat"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Fields",
        heading = _"Out of Fields",
        message = pgettext("europeans_building", "The farmer working at this farm has no cleared soil to plant his seeds."),
        productivity_threshold = 30
    },
}

pop_textdomain()
