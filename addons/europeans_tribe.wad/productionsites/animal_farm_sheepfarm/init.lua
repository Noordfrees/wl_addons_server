push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_sheepfarm",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Sheep Farm"),
    icon = dirname .. "menu.png",
    size = "big",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 73, 60 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 73, 60 },
        },
    },

    aihints = {},

    working_positions = {
          europeans_breeder_advanced = 1,
          europeans_breeder_basic = 1
    },

    inputs = {
        { name = "water", amount = 8 },
        { name = "corn", amount = 8 },
        { name = "blackroot", amount = 8 }
    },

    programs = {
       main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_cattle",
                "call=produce_meat",
                "call=produce_donkey",
                "call=produce_meat",
                "call=produce_horse",
                "call=produce_wool",
                "call=produce_meat",
                "return=skipped"
            }
        },
        produce_cattle = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing cattle because ...
            descname = pgettext("europeans_building", "rearing cattle"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_ox or workers need experience",
                "consume=corn blackroot water",
                "sleep=duration:10s",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:20s", -- Animation of feeding the cattle
                "recruit=europeans_carrier_ox"
            }
        },
        produce_donkey = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing donkeys because ...
            descname = pgettext("europeans_building", "rearing donkeys"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_donkey or workers need experience",
                "consume=corn blackroot water",
                "sleep=duration:10s",
                "playsound=sound/farm/donkey priority:50% allow_multiple",
                "animate=working duration:20s", -- Feeding cute little baby donkeys ;)
                "recruit=europeans_carrier_donkey"
            }
        },
        produce_horse = {
            -- TRANSLATORS: Completed/Skipped/Did not start breeding horses because ...
            descname = pgettext("europeans_building", "breeding horses"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_horse or workers need experience",
                "consume=corn blackroot water",
                "sleep=duration:10s",
                "playsound=sound/farm/horse priority:50% allow_multiple",
                "animate=working duration:20s", -- Feeding cute little foals ;)
                "recruit=europeans_carrier_horse"
            }
        },
        produce_meat = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "raising pigs"),
           actions = {
                "return=skipped unless economy needs meat or workers need experience",
                "consume=corn:2 blackroot:2 water:2",
                "sleep=duration:10s",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=meat:3"
           }
        },
        produce_wool = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "raising pigs"),
           actions = {
                "return=skipped unless economy needs wool or workers need experience",
                "consume=corn:2 blackroot:2 water:2",
                "sleep=duration:10s",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=wool:3"
           }
        },
    },
}

pop_textdomain()