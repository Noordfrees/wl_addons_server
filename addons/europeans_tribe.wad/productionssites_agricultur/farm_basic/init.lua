push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_farm_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Farm"),
    icon = dirname .. "menu.png",
    size = "big",

    enhancement = {
        name = "europeans_farm_level_1",
        enhancement_cost = {
            blackwood = 3,
            cloth = 3
        },
        enhancement_return_on_dismantle = {
            blackwood = 2
        },
    },

    buildcost = {
        log = 4,
        reed = 4,
        granite = 3
    },
    return_on_dismantle = {
        log = 3,
        granite = 2
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 69, 76 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 69, 76 },
        },
        unoccupied = {
            pictures = path.list_files(dirname .. "unoccupied_??.png"),
            hotspot = { 69, 76 },
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 69, 76 },
        },
    },

    aihints = {
        space_consumer = true,
        basic_amount = 4,
        prohibited_till = 600,
        forced_after = 1200
    },

    working_positions = {
        europeans_farmer_basic = 2
    },
    
    inputs = {
        { name = "water", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=plant_idle",
                "call=plant_barley",
                "call=plant_rye",
                "call=plant_wheat",
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
                "return=skipped when economy needs barley or economy needs rye or economy needs wheat",
                "return=skipped when economy needs water",
                "consume=water:3",
                "callworker=plant_barley",
                "animate=working duration:6s",
                "callworker=plant_rye",
                "animate=working duration:6s",
                "callworker=plant_wheat",
                "animate=working duration:6s",
                "sleep=duration:30s"
            }
        },
        plant_barley = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting barley because ...
            descname = pgettext("europeans_building", "planting barley"),
            actions = {
                "return=skipped unless economy needs barley or workers need experience",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_barley",
                "animate=working duration:6s",
                "consume=water",
                "callworker=plant_barley",
                "animate=working duration:6s"
            }
        },
        plant_rye = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting rye because ...
            descname = pgettext("europeans_building", "planting rye"),
            actions = {
                "return=skipped unless economy needs rye",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_rye",
                "animate=working duration:6s",
                "consume=water",
                "callworker=plant_rye",
                "animate=working duration:6s"
            }
        },
        plant_wheat = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting wheat because ...
            descname = pgettext("europeans_building", "planting wheat"),
            actions = {
                "return=skipped unless economy needs wheat",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_wheat",
                "animate=working duration:6s",
                "consume=water",
                "callworker=plant_wheat",
                "animate=working duration:6s"
            }
        },
        harvest_barley = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting barley because ...
            descname = pgettext("europeans_building", "harvesting barley"),
            actions = {
                "return=skipped unless economy needs barley or workers need experience",
                "callworker=harvest_barley",
                "animate=working duration:6s",
                "produce=barley",
                "callworker=harvest_barley",
                "animate=working duration:6s",
                "produce=barley"
            }
        },
        harvest_rye = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting rye because ...
            descname = pgettext("europeans_building", "harvesting rye"),
            actions = {
                "return=skipped unless economy needs rye",
                "callworker=harvest_rye",
                "animate=working duration:6s",
                "produce=rye",
                "callworker=harvest_rye",
                "animate=working duration:6s",
                "produce=rye"
            }
        },
        harvest_wheat = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting wheat because ...
            descname = pgettext("europeans_building", "harvesting wheat"),
            actions = {
                "return=skipped unless economy needs wheat",
                "callworker=harvest_wheat",
                "animate=working duration:6s",
                "produce=wheat",
                "callworker=harvest_wheat",
                "animate=working duration:6s",
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
