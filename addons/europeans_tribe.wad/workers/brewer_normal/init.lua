push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_brewer_normal",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Normal Brewer"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 36,
    becomes = "europeans_brewer_advanced",

    animations = {
        idle = {
            hotspot = { 8, 26 },
        }
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 15, 25 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 11, 24 }
        }
    }
}

pop_textdomain()
