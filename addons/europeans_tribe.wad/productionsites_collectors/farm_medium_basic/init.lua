push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_farm_medium_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Reed Yard"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 46, 44 },
      },
      working = {
         basename = "idle",
         hotspot = { 46, 44 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_farm_medium_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 2,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2
        },
    },
    buildcost = {
        log = 3,
        reed = 3,
        granite = 3
    },
    return_on_dismantle = {
        scrap_wood = 3,
        reed = 3,
        granite = 2
    },

    aihints = {
        space_consumer = true,
        supports_seafaring = true,
        basic_amount = 4
    },

    working_positions = {
        europeans_farmer_basic = 1
    },
    
    inputs = {
        { name = "water", amount = 4 },
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "callworker=check_space",
                "return=skipped unless site has water:2",
                "call=plant_idle",
                "call=plant_reed",
                "call=harvest_reed",
                "return=skipped"
            }
        },
        plant_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs reed or economy needs water",
                "consume=water",
                "callworker=plant_reed",
                "animate=working duration:5s",
                "sleep=duration:60s"
            }
        },
        plant_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = pgettext("europeans_building", "planting reed"),
            actions = {
                "return=skipped unless economy needs reed or workers need experience",
                "consume=water",
                "callworker=plant_reed",
                "animate=working duration:5s"
            }
        },
        harvest_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = pgettext("europeans_building", "harvesting reed"),
            actions = {
                "return=skipped unless economy needs reed or workers need experience",
                "callworker=harvest_reed",
                "animate=working duration:5s",
                "produce=reed"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Fields",
        heading = _"Out of Fields",
        message = pgettext("europeans_building", "The gardener working at this reed yard has no cleared soil to plant his seeds."),
        productivity_threshold = 20
    },
}

pop_textdomain()
