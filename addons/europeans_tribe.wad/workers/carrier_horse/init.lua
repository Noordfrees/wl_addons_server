push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_carrier_type {
    name = "europeans_carrier_horse",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Horse"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,

    ware_hotspot = {-2, 12},

    spritesheets = {
        idle = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 18, 23 }
        },
        walk = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 19, 33 }
        },
        walkload = {
            -- TODO(hessenfarmer): Make animation
            basename = "walk",
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 19, 33 }
        },
    }
}

pop_textdomain()
