push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__) .. "../"

include(dirname .. "../terrain_affinity.lua")
include(dirname .. "../spritesheets.lua")

wl.Descriptions():new_immovable_type{
   name = "rubber_amazons_sapling",
   -- TRANSLATORS:  This is an Amazon rare tree.
   descname = _("Rubber Tree (Sapling)"),
   size = "small",
   terrain_affinity = terrain_affinity,
   programs = {
      main = {
         "animate=idle duration:55s",
         "remove=chance:13.67%",
         "grow=rubber_amazons_pole",
      },
      grow = {
         "animate=idle duration:28s",
         "grow=rubber_amazons_pole",
      },
   },
   icon = dirname .. "menu_sapling.png",
   animation_directory = dirname,
   spritesheets = spritesheet_sapling
}

pop_textdomain()
