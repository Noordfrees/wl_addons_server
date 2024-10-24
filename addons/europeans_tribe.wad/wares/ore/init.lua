push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
    name = "ore",
    -- TRANSLATORS: This is a ware name used in lists of wares
    descname = pgettext("ware", "Ore"),
    icon = dirname .. "menu.png",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle.png"),
            hotspot = { 4, 4 },
        },
    }
}

pop_textdomain()
