push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "scrap_wood",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Scrap wood"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",

   animations = {
      idle = {
         hotspot = { 8, 7 },
      }
   },
}

pop_textdomain()
