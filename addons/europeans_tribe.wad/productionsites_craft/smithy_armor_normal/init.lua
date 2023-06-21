push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_armorsmithy_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Armorsmithy"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         rows = 1,
         columns = 1,
         hotspot = { 48, 65 },
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 48, 65 },
      },
      unoccupied = {
         frames = 1,
         rows = 1,
         columns = 1,
         hotspot = { 48, 65 },
      },
      working = {
         fps = 2,
         frames = 20,
         columns = 10,
         rows = 2,
         hotspot = { 48, 65 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_armorsmithy_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            marble = 1,
            marble_column = 1,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2,
            scrap_metal_mixed = 1
        },
    },

    aihints = {},

    working_positions = {
        europeans_smith_advanced = 1,
        europeans_smith_basic = 1
    },

    inputs = {
        { name = "planks", amount = 6 },
        { name = "coal", amount = 6 },
        { name = "iron", amount = 6 },
        { name = "armor", amount = 6 },
        { name = "cloth", amount = 6 },
        { name = "leather", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_armor_wooden",
                "call=produce_helmet_wooden",
                "call=produce_spear_wooden",
                "call=produce_armor_processed",
                "call=produce_boots_sturdy",
                "call=produce_helmet_mask",
                "call=produce_spear_advanced",
                "sleep=duration:15s",
                "call=produce_armor_chain",
                "call=produce_boots_swift",
                "call=produce_shield_steel",
                "call=produce_ax_broad",
                "sleep=duration:15s",
                "return=skipped"
            }
        },
        produce_armor_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden armor because ...
            descname = pgettext("europeans_building", "making a wooden armor"),
            actions = {
                "return=skipped unless economy needs armor_wooden or workers need experience",
                "return=skipped when economy needs helmet_wooden and not economy needs armor_wooden",
                "return=skipped when economy needs spear_wooden and not economy needs armor_wooden",
                "consume=planks",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:30s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=armor_wooden:2"
            }
        },
        produce_helmet_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden helmet because ...
            descname = pgettext("europeans_building", "making a wooden helmet"),
            actions = {
                "return=skipped unless economy needs helmet_wooden or workers need experience",
                "return=skipped when economy needs armor_wooden and not economy needs helmet_wooden",
                "return=skipped when economy needs spear_wooden and not economy needs helmet_wooden",
                "consume=planks",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:30s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=helmet_wooden:2"
            }
        },
        produce_spear_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a wooden spear because ...
            descname = pgettext("europeans_building", "forging a wooden spear"),
            actions = {
                "return=skipped unless economy needs spear_wooden or workers need experience",
                "return=skipped when economy needs armor_wooden and not economy needs spear_wooden",
                "return=skipped when economy needs helmet_wooden and not economy needs spear_wooden",
                "consume=planks",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:30s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_wooden:2"
            }
        },
        produce_armor_processed = {
            -- TRANSLATORS: Completed/Skipped/Did not start making processed armor because ...
            descname = pgettext("europeans_building", "making processed armor"),
            actions = {
                "return=skipped unless economy needs armor_processed or workers need experience",
                "return=skipped when economy needs armor_chain and not economy needs armor_processed",
                "consume=armor cloth",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=armor_processed:2"
            }
        },
        produce_armor_chain = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of chain armor because ...
            descname = pgettext("europeans_building", "forging a suit of chain armor"),
            actions = {
                "return=skipped unless economy needs armor_chain or workers need experience",
                "return=skipped when economy needs armor_processed and not economy needs armor_chain",
                "consume=armor:2 coal iron",
                "animate=working duration:30s",
                "produce=armor_chain:2"
            }
        },
        produce_boots_sturdy = {
            -- TRANSLATORS: Completed/Skipped/Did not start making study boots because ...
            descname = pgettext("europeans_building", "making study boots"),
            actions = {
                "return=skipped unless economy needs boots_sturdy or workers need experience",
                "return=skipped when economy needs boots_swift and not economy needs boots_sturdy",
                "consume=planks leather cloth",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=boots_sturdy:2"
            }
        },
        produce_boots_swift = {
            -- TRANSLATORS: Completed/Skipped/Did not start making swift boots because ...
            descname = pgettext("europeans_building", "making swift boots"),
            actions = {
                "return=skipped unless economy needs boots_swift or workers need experience",
                "return=skipped when economy needs boots_sturdy and not economy needs boots_swift",
                "consume=planks leather cloth",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=boots_swift:2"
            }
        },
        produce_helmet_mask = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a mask because ...
            descname = pgettext("europeans_building", "forging a mask"),
            actions = {
                "return=skipped unless economy needs helmet_mask or workers need experience",
                "return=skipped when economy needs shield_steel and not economy needs helmet_mask",
                "consume=coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=helmet_mask:2"
            }
        },
        produce_shield_steel = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a steel shield because ...
            descname = pgettext("europeans_building", "forging a steel shield"),
            actions = {
                "return=skipped unless economy needs shield_steel or workers need experience",
                "return=skipped when economy needs helmet_mask and not economy needs shield_steel",
                "consume=coal iron",
                "animate=working duration:30s",
                "produce=shield_steel:2"
            }
        },
        produce_spear_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced spear because ...
            descname = pgettext("europeans_building", "forging an advanced spear"),
            actions = {
                "return=skipped unless economy needs spear_advanced or workers need experience",
                "return=skipped when economy needs ax_broad and not economy needs spear_advanced",
                "consume=planks coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:30s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_advanced:2"
            }
        },
        produce_ax_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broad ax because ...
            descname = pgettext("europeans_building", "forging a broad ax"),
            actions = {
                "return=skipped unless economy needs ax_broad or workers need experience",
                "return=skipped when economy needs spear_advanced and not economy needs ax_broad",
                "consume=planks coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:30s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=ax_broad:2"
            }
        },
    },
}

pop_textdomain()
