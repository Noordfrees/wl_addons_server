push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_animal_farm_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Animal Farm Level 3"),
    icon = dirname .. "menu.png",
    size = "big",
    
    enhancement = {
        name = "europeans_animal_farm_level_4",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            grout = 1,
            marble_column = 1
        },
        enhancement_return_on_dismantle = {
            granite = 1,
            marble = 1
        }
    },

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

    aihints = {
    },

    working_positions = {
        europeans_breeder_advanced = 1,
        europeans_breeder_normal = 2
    },

    inputs = {
        { name = "water", amount = 8 },
        { name = "corn", amount = 4 },
        { name = "blackroot", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_meat",
                "call=produce_meat",
                "call=produce_fish",
                "call=produce_fish",
                "call=produce_cattle",
                "call=produce_donkey",
                "call=produce_meat_idle",
                "call=produce_fish_idle",
                "return=skipped"
            }
        },
        produce_cattle = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing cattle because ...
            descname = pgettext("europeans_building", "rearing cattle"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_ox or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water:3 blackroot,corn:3",
                "sleep=duration:5s",
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
                "return=skipped unless site has water:3",
                "consume=water:3 blackroot,corn:3",
                "sleep=duration:5s",
                "playsound=sound/farm/donkey priority:50% allow_multiple",
                "animate=working duration:30s", -- Feeding cute little baby donkeys ;)
                "recruit=europeans_carrier_donkey"
            }
        },
        produce_meat = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "producing meat"),
           actions = {
                "return=skipped unless economy needs meat or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water:4 blackroot,corn:4",
                "sleep=duration:5s",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=meat:3"
           }
        },
        produce_fish = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing fish because ...
           descname = pgettext("europeans_building", "breeding fish"),
            actions = {
                "return=skipped unless economy needs fish or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water:4 blackroot,corn:4",
                "sleep=duration:5s",
                "animate=working duration:30s",
                "produce=fish:3"
            }
        },
        produce_meat_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs meat",
                "return=skipped when economy needs water",
                "sleep=duration:90s",
                "consume=water:2 blackroot,corn:2",
                "animate=working duration:60s",
                "produce=meat"
            }
        },
        produce_fish_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs fish",
                "return=skipped when economy needs water",
                "sleep=duration:90s",
                "consume=water:2 blackroot,corn:2",
                "animate=working duration:60s",
                "produce=fish"
            }
        }
    },
}

pop_textdomain()
