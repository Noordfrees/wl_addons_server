push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
    name = "ryefield_small",
    -- TRANSLATORS: This is an immovable name used in lists of immovables
    descname = pgettext("immovable", "Rye Field (small)"),
    icon = dirname .. "menu.png",
    size = "small",
    programs = {
        main = {
            "animate=idle duration:40s",
            "transform=ryefield_medium",
        }
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 31, 24 },
        },
    }
}

pop_textdomain()
