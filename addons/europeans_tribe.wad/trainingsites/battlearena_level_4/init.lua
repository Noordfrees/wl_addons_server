push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_trainingsite_type {
    name = "europeans_battlearena_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Battle Arena Level 4"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 91, 114 }
      }
    },

    size = "big",

    aihints = {
        trainingsites_max_percent = 20,
        very_weak_ai_limit = 0,
        weak_ai_limit = 1,
      --normal_ai_limit = 4
    },

    working_positions = {
        europeans_trainer_advanced = 2
    },

    inputs = {
        { name = "coin_copper", amount = 6 },
        { name = "coin_silver", amount = 6 },
        { name = "coin_gold", amount = 6 },
        { name = "helmet_mask", amount = 2 },
        { name = "shield_steel", amount = 2 },
        { name = "shield_advanced", amount = 2 }, 
        { name = "spear_advanced", amount = 2 },
        { name = "ax_broad", amount = 2 },
        { name = "sword_broad", amount = 2 },
        { name = "armor", amount = 2 },
        { name = "armor_chain", amount = 2 },
        { name = "armor_gilded", amount =  2 },
        { name = "tabard_golden", amount = 2 }
    },

    ["soldier health"] = {
        food = {{"coin_copper"}, {"coin_silver"}, {"coin_gold"}},
        weapons = {"armor", "tabard", "armor_chain", "armor_gilded", "tabard_golden"}
    },

    ["soldier evade"] = {
        food = {{"coin_copper"}, {"coin_silver"}, {"coin_gold"}},
    },
        
    ["soldier defense"] = {
        food = {{"coin_copper"}, {"coin_silver"}, {"coin_gold"}},
        weapons = {"helmet_mask", "shield_steel", "shield_advanced"}
    },

    ["soldier attack"] = {
        food = {{"coin_copper"}, {"coin_silver"}, {"coin_gold"}},
        weapons = {"spear_advanced", "ax_broad", "sword_broad"}
    },
  
    programs = {
        sleep = {
            -- TRANSLATORS: Completed/Skipped/Did not start sleeping because ...
            descname = _"sleeping",
            actions = {
                "sleep=duration:5s",
                "return=skipped",
            }
        },
        upgrade_soldier_health_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 0 to level 1"),
            actions = {
                "return=skipped when economy needs armor",
                "checksoldier=soldier:health level:0",
                "sleep=duration:20s",
                "checksoldier=soldier:health level:0",
                "consume=coin_copper armor",
                "train=soldier:health level:1"
            }
        },
        upgrade_soldier_health_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:health level:1",
                "sleep=duration:20s",
                "checksoldier=soldier:health level:1",
                "consume=coin_silver armor_chain",
                "train=soldier:health level:2",
                "produce=scrap_iron"
            }
        },
        upgrade_soldier_health_2 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 2 to level 3"),
            actions = {
                "checksoldier=soldier:health level:2",
                "sleep=duration:20s",
                "checksoldier=soldier:health level:2",
                "consume=coin_gold armor_gilded,tabard_golden",
                "train=soldier:health level:3",
                "produce=scrap_metal_mixed"
            }
        },
        upgrade_soldier_evade_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 0 to level 1"),
            actions = {
                "return=skipped when economy needs beer",
                "checksoldier=soldier:evade level:0",
                "sleep=duration:30s",
                "checksoldier=soldier:evade level:0",
                "consume=coin_copper:2",
                "train=soldier:evade level:1"
            }
        },
        upgrade_soldier_evade_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 1 to level 2"),
            actions = {
                "return=skipped when economy needs beer_strong and economy needs mead",
                "checksoldier=soldier:evade level:1",
                "sleep=duration:30s",
                "checksoldier=soldier:evade level:1",
                "consume=coin_silver:2",
                "train=soldier:evade level:2"
            }
        },
        upgrade_soldier_evade_2 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 2 to level 3"),
            actions = {
                "return=skipped when economy needs wine",
                "checksoldier=soldier:evade level:2",
                "sleep=duration:30s",
                "checksoldier=soldier:evade level:2",
                "consume=coin_gold:2",
                "train=soldier:evade level:3"
            }
        },
        upgrade_soldier_defense_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:defense level:0",
                "sleep=duration:20s",
                "checksoldier=soldier:defense level:0",
                "consume=coin_copper helmet_mask",
                "train=soldier:defense level:1",
                "produce=scrap_iron"
            }
        },
        upgrade_soldier_defense_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:defense level:1",
                "sleep=duration:20s",
                "checksoldier=soldier:defense level:1",
                "consume=coin_silver shield_steel",
                "train=soldier:defense level:2",
                "produce=scrap_iron"
            }
        },
        upgrade_soldier_defense_2 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 2 to level 3"),
            actions = {
                "checksoldier=soldier:defense level:2",
                "sleep=duration:20s",
                "checksoldier=soldier:defense level:2",
                "consume=coin_gold shield_advanced",
                "train=soldier:defense level:3",
                "produce=scrap_metal_mixed"
            }
        },
        upgrade_soldier_attack_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:attack level:0",
                "sleep=duration:20s",
                "checksoldier=soldier:attack level:0",
                "consume=coin_copper spear_advanced",
                "train=soldier:attack level:1",
                "produce=scrap_iron"
            }
        },
        upgrade_soldier_attack_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:attack level:1",
                "sleep=duration:20s",
                "checksoldier=soldier:attack level:1",
                "consume=coin_silver ax_broad",
                "train=soldier:attack level:2",
                "produce=scrap_iron"
            }
        },
        upgrade_soldier_attack_2 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 2 to level 3"),
            actions = {
                "checksoldier=soldier:attack level:2",
                "sleep=duration:20s",
                "checksoldier=soldier:attack level:2",
                "consume=coin_gold sword_broad",
                "train=soldier:attack level:3",
                "produce=scrap_iron"
            }
        }
    },
    
    soldier_capacity = 12,
    trainer_patience = 28,
    
    messages = {
        -- TRANSLATORS: Empire training site tooltip when it has no soldiers assigned
        no_soldier = pgettext("europeans_building", "No soldier to train!"),
        -- TRANSLATORS: Empire training site tooltip when none of the present soldiers match the current training program
        no_soldier_for_level = pgettext("europeans_building", "No soldier found for this training level!"),
    },
}

pop_textdomain()
