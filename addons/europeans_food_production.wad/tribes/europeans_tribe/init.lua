-- This file contains the basic information for the Europeans tribe that is
-- needed before a game is loaded or the editor has been started.

dirname = path.dirname(__file__)
push_textdomain("europeans_tribe.wad", true)

local init_europeans = {
    -- Basic information for the Europeans tribe
    name = "europeans",
    author = _"Mark McWire",
    -- TRANSLATORS: This is a tribe name
    descname = _"Europeans (Food Addon)",
    tooltip = _"This is the culture of the Europeans.",
    icon = dirname .. "images/icon.png",
    script = dirname .. "units.lua",

    starting_conditions = {
        "addons/europeans_food_production.wad/scripting/starting_conditions/headquarters_food.lua";
        "addons/europeans_food_production.wad/scripting/starting_conditions/discovery_food.lua";
    }
}
pop_textdomain()
return init_europeans

