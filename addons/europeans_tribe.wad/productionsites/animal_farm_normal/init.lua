push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_animal_farm_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Animal Farm"),
    icon = dirname .. "menu.png",
    size = "big",
    
    enhancement = {
        name = "europeans_animal_farm_advanced",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            grout = 1,
            marble_column = 1
        },
        enhancement_return_on_dismantle = {
            granite = 1,
            marble = 1,
            planks = 1
        }
    },

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 81, 62 },
        },
        working = {
            basename = "idle", -- TODO(GunChleoc): No animation yet.
            hotspot = { 81, 62 },
        }
    },

    aihints = {},

    working_positions = {
        europeans_breeder_normal = 1
    },

    inputs = {
        { name = "water", amount = 6 },
        { name = "corn", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_cattle",
                "call=produce_donkey",
                "call=produce_meat",
                "return=skipped"
            }
        },
        produce_cattle = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing cattle because ...
            descname = pgettext("europeans_building", "rearing cattle"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_ox or workers need experience",
                "consume=corn water",
                "sleep=duration:10s",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:30s", -- Animation of feeding the cattle
                "recruit=europeans_carrier_ox"
            }
        },
        produce_donkey = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing donkeys because ...
            descname = pgettext("europeans_building", "rearing donkeys"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_donkey or workers need experience",
                "consume=corn water",
                "sleep=duration:10s",
                "playsound=sound/farm/donkey priority:50% allow_multiple",
                "animate=working duration:30s", -- Feeding cute little baby donkeys ;)
                "recruit=europeans_carrier_donkey"
            }
        },
        produce_meat = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "raising pigs"),
           actions = {
                "return=skipped unless economy needs meat or workers need experience",
                "consume=corn:2 water:2",
                "sleep=duration:10s",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=meat:2"
           }
        },
    },
}

pop_textdomain()