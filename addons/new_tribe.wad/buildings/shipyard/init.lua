push_textdomain("new_tribe.wad", true)

dirname = path.dirname (__file__)

descriptions:new_productionsite_type {
   name = "newtribe_shipyard",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("newtribe_building", "Shipyard"),
   icon = dirname .. "menu.png",
   size = "medium",
   map_check = {"seafaring"},

   buildcost = {
      granite = 2,
      log = 3,
      reed = 2,
   },
   return_on_dismantle = {
      log = 2,
      reed = 1
   },

   spritesheets = {
      idle = {
         directory = dirname,
         basename = "idle",
         hotspot = {50, 78},
         frames = 10,
         columns = 5,
         rows = 2,
         fps = 10
      }
   },
   animations = {
      unoccupied = {
         directory = dirname,
         basename = "unoccupied",
         hotspot = {50, 58}
      }
   },

   aihints = {
      needs_water = true,
      shipyard = true,
      prohibited_till = 1050
   },

   working_positions = {
      newtribe_shipwright = 1
   },

   inputs = {
      { name = "log", amount = 10 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=ship on failure fail",
            "call=ship_preparation",
         }
      },
      ship = {
         -- TRANSLATORS: Completed/Skipped/Did not start constructing a ship because ...
         descname = _"constructing a ship",
         actions = {
            "construct=newtribe_shipconstruction worker:buildship radius:6",
            "sleep=duration:20s",
         }
      },
      ship_preparation = {
         descname = _"working",
         actions = {
            "sleep=duration:35s",
            -- no working animation yet
         }
      },
   },
}

pop_textdomain()
