push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "coal",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Coal"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 7, 7 },
      },
   }
}

pop_textdomain()
