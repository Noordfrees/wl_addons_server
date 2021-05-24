-- This file contains the basic information for the Europeans tribe that is
-- needed before a game is loaded or the editor has been started.

dirname = path.dirname(__file__)
push_textdomain("europeans_tribe.wad", true)

local r = {
   -- Basic information for the Europeans tribe
   name = "europeans",
   author = _"Mark McWire",
   -- TRANSLATORS: This is a tribe name
   descname = _"Europeans",
   tooltip = _"This is the culture of the Europeans.",
   icon = dirname .. "images/icon.png",
   script = dirname .. "units.lua",

   starting_conditions = {
      dirname .. "starting_conditions/headquarters.lua";
      dirname .. "starting_conditions/fortified_village.lua";
      dirname .. "starting_conditions/trading_outpost.lua";
      dirname .. "starting_conditions/village.lua";
      dirname .. "starting_conditions/poor_hamlet.lua";
      dirname .. "starting_conditions/struggling_outpost.lua";
      dirname .. "starting_conditions/discovery.lua";
      dirname .. "starting_conditions/new_world.lua";
      dirname .. "starting_conditions/harbors.lua";
   }
}
pop_textdomain()
return r
