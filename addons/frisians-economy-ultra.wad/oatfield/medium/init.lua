dirname = path.dirname(__file__)

push_textdomain("frisians-economy-ultra.wad", true)

wl.Descriptions():new_immovable_type {
   name = "oatfield_medium",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Oat Field (medium)"),
   icon = dirname .. "menu.png",
   size = "small",
   programs = {
      main = {
         "animate=idle duration:250s",
         "transform=oatfield_ripe",
      }
   },
   animations = {
      idle = {
         directory = dirname,
         basename = "idle",
         hotspot = {21, 33}
      }
   }
}
pop_textdomain()
