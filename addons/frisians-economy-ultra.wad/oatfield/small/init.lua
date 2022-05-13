dirname = path.dirname(__file__)

push_textdomain("frisians-economy-ultra.wad", true)

wl.Descriptions():new_immovable_type {
   name = "oatfield_small",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Oat Field (small)"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:225s",
         "transform=oatfield_medium",
      }
   },
   animations = {
      idle = {
         directory = dirname,
         basename = "idle",
         hotspot = {21, 25}
      }
   }
}
pop_textdomain()
