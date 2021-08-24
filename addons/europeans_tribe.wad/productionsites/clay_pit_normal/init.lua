push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_clay_pit_normal",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Normal Clay Pit"),
   icon = dirname .. "menu.png",
   size = "small",

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 34, 42 },
      },
      working = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 34, 42 },
      },
   },

   aihints = {},

   working_positions = {
      europeans_claydigger_normal = 1
   },

   inputs = {
      { name = "water", amount = 4 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "callworker=check_dig",
            "call=making_pond",
            "callworker=check_dig",
            "call=diging_clay",
            "callworker=check_dike",
            "call=diking_clay",
            "return=skipped"
         }
      },
      making_pond = {
         -- TRANSLATORS: Completed/Skipped/Did not start making pond because ...
         descname = _"making fish pond",
         actions = {
            "return=skipped unless economy needs fish",
            "return=skipped when economy needs clay",
            "return=failed unless site has water",
            "callworker=dig",
            "consume=water",
            "sleep=duration:10s",
            "animate=working duration:15s",
         },
      },
      diging_clay = {
         -- TRANSLATORS: Completed/Skipped/Did not start diging clay because ...
         descname = _"diging clay",
         actions = {
            "return=skipped unless economy needs clay",
            "return=failed unless site has water",
            "callworker=dig",
            "consume=water",
            "sleep=duration:10s",
            "animate=working duration:15s",
            "sleep=duration:1s",
            "produce=clay"
         },
      },
      diking_clay = {
         -- TRANSLATORS: Completed/Skipped/Did not start diking clay because ...
         descname = _"diking clay",
         actions = {
            "return=skipped unless economy needs clay",
            "callworker=dike",
            "sleep=duration:10s",
            "animate=working duration:15s",
            "sleep=duration:1s",
            "produce=clay"
         },
      },
   },
}

pop_textdomain()
