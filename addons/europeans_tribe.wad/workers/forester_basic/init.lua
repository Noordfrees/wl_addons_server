push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_forester_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Forester / Ranger"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 24,
    becomes = "europeans_forester_normal",

    programs = {
        plant = {
            "findspace=size:any radius:5 avoid:field saplingsearches:5",
            "walk=coords",
            "animate=dig duration:3s500ms",
            "animate=plant duration:2s500ms",
            "plant=attrib:tree_sapling",
            "animate=water duration:2s500ms",
            "return"
        }
    },

    animations = {
        idle = {
            hotspot = { 11, 20 }
        }
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 11, 20 }
        },
        dig = {
            fps = 5,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 12, 22 }
        },
        plant = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 16, 20 }
        },
        water = {
            fps = 5,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 18, 23 }
        },
    }
}

pop_textdomain()
