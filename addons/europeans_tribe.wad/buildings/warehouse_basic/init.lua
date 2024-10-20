push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_warehouse_type {
    name = "europeans_warehouse_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Warehouse"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         rows = 1,
         columns = 1,
         hotspot = { 60, 78 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 60, 78 }
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_warehouse_normal",
        enhancement_cost = {
            planks = 3,
            cloth = 3,
            quartz = 1,
            diamond = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            quartz = 1,
            diamond = 1
        },
    },
    buildcost = {
        blackwood = 4,
        reed = 4,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        scrap_wood = 4,
        reed = 1,
        quartz = 1,
        diamond = 1
    },

    aihints = {
        very_weak_ai_limit = 3,
        weak_ai_limit = 6,
        normal_ai_limit = 12,
        prohibited_till = 7200,
        forced_after = 7800
    },
    
    vision_range = 16,
    heal_per_second = 160,
}

pop_textdomain()
