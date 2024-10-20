push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
    name = "ryefield_tiny",
    -- TRANSLATORS: This is an immovable name used in lists of immovables
    descname = pgettext("immovable", "Rye Field (tiny)"),
    icon = dirname .. "menu.png",
    size = "small",
    programs = {
        main = {
            "animate=idle duration:30s",
            "transform=ryefield_small",
        }
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 32, 21 },
        },
    }
}

pop_textdomain()
