push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
    name = "rye",
    -- TRANSLATORS: This is a ware name used in lists of wares
    descname = pgettext("ware", "Rye"),
    icon = dirname .. "menu.png",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle.png"),
            hotspot = { -1, 6 },
        },
    }
}

pop_textdomain()
