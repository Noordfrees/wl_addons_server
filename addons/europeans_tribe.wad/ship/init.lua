-- RST
-- .. _lua_tribes_ships:
--
-- Ships
-- -----
--
-- Each tribe can have one ship that is used to explore the seas and transport
-- wares between ports.
--
-- Ships are defined in
-- ``data/tribes/ships/<tribe_name>/init.lua``.
--
-- .. function:: new_ship_type(table)
--
--    This function adds the definition of a ship to the engine.
--
--    :arg table: This table contains all the data that the game engine will
--                add to this ship. It contains the following entries:
--
--    **name**: A string containing the internal name of this ship.
--
--    **descname**: The translatable display name. Use ``pgettext`` to fetch the string.
--
--    **icon**: Path to the menu icon file.
--
--    **capacity**: An int defining how many wares or workers this ship can transport
--
--    **vision_range**: How far the ship can see.
--
--    **animations**: A table containing all animations for this ship.
--    Ships have an "idle", a "sinking" and a directional "sail" animation.
--
--    **names**: A list of strings with ship names presented to the user - be creative :)
--
-- For making the UI texts translateable, we also need to push/pop the correct textdomain.
--
-- Example:
--
-- .. code-block:: lua
--
--    push_textdomain("europeans_tribe.wad", true)
--
--    dirname = path.dirname(__file__)
--
--    wl.Descriptions():new_ship_type {
--       name = "europeans_ship",
--       descname = pgettext("europeans_ship", "Ship"),
--       animation_directory = dirname,
--       icon = dirname .. "menu.png",
--       capacity = 30,
--       vision_range = 4,
--
--       animations = {
--          idle = {
--             hotspot = { 89, 86 },
--             fps = 10
--          },
--          sinking = {
--             hotspot = { 89, 86 },
--             fps = 7
--          },
--          sail = {
--             hotspot = { 89, 86 },
--             fps = 10,
--             directional = true
--          }
--       },
--       names = {
--          pgettext("shipname", "Abaco"),
--          pgettext("shipname", "Agate"),
--       }
--    }
--
--    pop_textdomain()

push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_ship_type {
    name = "europeans_ship",
    -- TRANSLATORS: This is the Europeans' ship's name used in lists of units
    descname = pgettext("europeans_ship", "Ship"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    capacity = 32,
    vision_range = 4,

    animations = {
        idle = {
            hotspot = { 89, 86 },
            fps = 10
        },
        sinking = {
            hotspot = { 89, 86 },
            fps = 7
        },
        sail = {
            hotspot = { 89, 86 },
            fps = 10,
            directional = true
        }
    },

    names = {
        -- TRANSLATORS: These European ships are named after the continent or states / countries on this contintent.
        pgettext("shipname", "Europa"),
        pgettext("shipname", "Europe"),
        pgettext("shipname", "Island"),
        pgettext("shipname", "Great Britain"),
        pgettext("shipname", "Scandinavia"),
        pgettext("shipname", "Alpinia"),
        pgettext("shipname", "Iberia"),
        pgettext("shipname", "Italia"),
        pgettext("shipname", "Francia"),
        pgettext("shipname", "Germania"),
        pgettext("shipname", "Polandia"),
        pgettext("shipname", "Czechia"),
        pgettext("shipname", "Slowakia"),
        pgettext("shipname", "Hungaria"),
        pgettext("shipname", "Romania"),
        pgettext("shipname", "Bulgaria"),
        pgettext("shipname", "Ukrainia"),
        pgettext("shipname", "Georgia"),
        pgettext("shipname", "Russia"),
        pgettext("shipname", "Baltika"),
        pgettext("shipname", "Balkania"),
        pgettext("shipname", "Benelux"),
        pgettext("shipname", "Greece"),
        pgettext("shipname", "Sizilia"),
        pgettext("shipname", "Corsica"),
        pgettext("shipname", "Sardenia"),
        pgettext("shipname", "Malta"),
        pgettext("shipname", "Cypria"),
    }
}

pop_textdomain()
