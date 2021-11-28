push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_well_level_3",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Well Level 3"),
   icon = dirname .. "menu.png",
   size = "small",
   
   enhancement = {
        name = "europeans_well_level_4",
        enhancement_cost = {
          planks = 1,
          brick = 1,
          grout = 1,
          marble_column = 1,
          diamond = 1,
          buckets = 1
        },
        enhancement_return_on_dismantle = {
          granite = 1,
          marble = 1,
          diamond = 1,
          buckets = 1
        },
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 31, 32 },
      },
      working = {
         pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
         hotspot = { 31, 32 },
      },
   },

   aihints = {},

   working_positions = {
      europeans_carrier = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=mining_water",
            "call=mining_water_idle",
            "return=skipped"
         }
      },
      mining_water = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining water because ...
         descname = _"mining water",
         actions = {
            "return=skipped unless economy needs water or workers need experience",
            "sleep=duration:5s",
            "animate=working duration:15s",
            "mine=resource_water radius:4 yield:80% when_empty:80%",
            "produce=water:2"
         }
      },
      mining_water_idle = {
         -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
         descname = _"idle program",
         actions = {
            "return=skipped when economy needs water",
            "sleep=duration:60s",
            "animate=working duration:15s",
            "mine=resource_water radius:4 yield:80% when_empty:80%",
            "produce=water"
         }
      }
   },
   
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _"No Water",
      heading = _"Out of Water",
      message = pgettext("europeans_building", "The carrier working at this well can’t find any water in his well."),
      productivity_threshold = 25
   },
}

pop_textdomain()