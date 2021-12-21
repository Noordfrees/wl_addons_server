push_textdomain("tribes")

dirname = path.dirname(__file__)

descriptions:new_carrier_type {
    name = "europeans_carrier_donkey",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Donkey"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,

    ware_hotspot =  { -2, 8 },

    spritesheets = {
        idle = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 14, 20 }
        },
        walk = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 14, 25 }
        },
        walkload = {
            -- TODO(hessenfarmer): Make animation
            basename = "walk",
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 14, 25 }
        },
    }
}

pop_textdomain()
