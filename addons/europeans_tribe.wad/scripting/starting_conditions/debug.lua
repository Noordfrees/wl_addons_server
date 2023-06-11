-- =======================================================================
--              Headquarters Starting Conditions for Europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Debug Europeans Economy",
    -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
    tooltip = _"Only for AI debug purposes. No regular starting condition.",
    func =  function(player, shared_in_start)

    local map = wl.Game().map
    local sf = map.player_slots[player.number].starting_field
    if shared_in_start then
        sf = shared_in_start
    else
        player:allow_workers("all")
        player:allow_buildings("all")
    end

    if ((player.name == "Saxons") or (sf.x == 380 and sf.y == 498)) then
        hq1 = prefilled_buildings(player, { "europeans_headquarters", sf.x, sf.y,
                wares = {
                    reed = 128,
                    blackwood = 128,
                    granite = 64,
                    log = 64,
                    water = 64,
                    coal = 32,
                    cloth = 16,
                    planks = 16,
                    marble = 16,
                    marble_column = 16,
                    grout = 16,
                    brick = 16,
                    gold = 16,
                    quartz = 16,
                    diamond = 16,
                    buckets = 16,
                    basket = 16
                },
                workers = {
                    europeans_carrier = 32,
                    europeans_farmer_basic = 16,
                    europeans_builder = 8,
                    europeans_lumberjack_basic = 8,
                    europeans_forester_basic = 8,
                    europeans_miner_basic = 8,
                    europeans_stonecutter_basic = 8,
                    europeans_carpenter_basic = 4,
                    europeans_charcoal_burner_basic = 4,
                    europeans_stonemason_basic = 4,
                    europeans_weaver_basic = 4,
                    europeans_breeder_basic = 4,
                    europeans_brewer_basic = 4,
                    europeans_miller_basic = 4,
                    europeans_baker_basic = 4,
                    europeans_smelter_basic = 4,
                    europeans_smith_basic = 4,
                    europeans_trainer_basic = 4,
                    europeans_trader = 4,
                    europeans_claydigger_basic = 4,
                    europeans_beekeeper_basic = 4,
                    europeans_terraformer_basic = 2,
                    europeans_scout_basic = 2,
                    europeans_geologist = 1
              },
                soldiers = {
                    [{0,0,0,0}] = 16,
              }
        })
        hq2 = prefilled_buildings(player, { "europeans_headquarters", 333, 426,
                wares = {
                    log = 64,
                    reed = 64,
                    granite = 64,
                    blackwood = 64,
                    water = 64,
                    coal = 32,
                    cloth = 16,
                    planks = 16,
                    marble = 16,
                    marble_column = 16,
                    grout = 16,
                    brick = 16,
                    gold = 16,
                    quartz = 16,
                    diamond = 16,
                    buckets = 16,
                    basket = 16
                },
                workers = {
                    europeans_carrier = 32,
                    europeans_farmer_basic = 16,
                    europeans_builder = 8,
                    europeans_lumberjack_basic = 8,
                    europeans_forester_basic = 8,
                    europeans_miner_basic = 8,
                    europeans_stonecutter_basic = 8,
                    europeans_carpenter_basic = 4,
                    europeans_charcoal_burner_basic = 4,
                    europeans_stonemason_basic = 4,
                    europeans_weaver_basic = 4,
                    europeans_breeder_basic = 4,
                    europeans_brewer_basic = 4,
                    europeans_miller_basic = 4,
                    europeans_baker_basic = 4,
                    europeans_smelter_basic = 4,
                    europeans_smith_basic = 4,
                    europeans_trainer_basic = 4,
                    europeans_trader = 4,
                    europeans_claydigger_basic = 4,
                    europeans_beekeeper_basic = 4,
                    europeans_terraformer_basic = 2,
                    europeans_scout_basic = 2,
                    europeans_geologist = 1
              },
                soldiers = {
                    [{0,0,0,0}] = 16,
              }
        })
        port = prefilled_buildings(player, { "europeans_port", 350, 397,
                wares = {
                    log = 32,
                    reed = 32,
                    blackwood = 32,
                    granite = 32,
                    cloth = 16,
                    planks = 16,
                    quartz = 2,
                    diamond = 2,
                    buckets = 2,
                    basket = 2
                },
                workers = {
                    europeans_builder = 2,
                    europeans_shipwright_basic = 2
                },
                soldiers = {
                    [{0,0,0,0}] = 4,
                }
        })
        hq1.warehousename = "London"
        hq2.warehousename = "Dublin"
        port.warehousename = "Belfast"
    else
        prefilled_buildings(player, { "europeans_headquarters", sf.x, sf.y,
                wares = {
                    log = 128,
                    reed = 128,
                    granite = 128,
                    blackwood = 128,
                    water = 128,
                    coal = 64,
                    cloth = 32,
                    planks = 32,
                    marble = 32,
                    marble_column = 16,
                    grout = 16,
                    brick = 16,
                    gold = 16,
                    quartz = 16,
                    diamond = 16,
                    buckets = 32,
                    basket = 32
                },
                workers = {
                    europeans_carrier = 64,
                    europeans_farmer_basic = 48,
                    europeans_builder = 16,
                    europeans_lumberjack_basic = 16,
                    europeans_forester_basic = 16,
                    europeans_miner_basic = 16,
                    europeans_stonecutter_basic = 8,
                    europeans_carpenter_basic = 8,
                    europeans_charcoal_burner_basic = 8,
                    europeans_stonemason_basic = 8,
                    europeans_weaver_basic = 8,
                    europeans_breeder_basic = 8,
                    europeans_brewer_basic = 8,
                    europeans_miller_basic = 8,
                    europeans_baker_basic = 8,
                    europeans_smelter_basic = 8,
                    europeans_smith_basic = 8,
                    europeans_trainer_basic = 8,
                    europeans_trader = 8,
                    europeans_claydigger_basic = 4,
                    europeans_beekeeper_basic = 4,
                    europeans_shipwright_basic = 4,
                    europeans_terraformer_basic = 2,
                    europeans_scout_basic = 2,
                    europeans_geologist = 1
              },
                soldiers = {
                    [{0,0,0,0}] = 32,
              }
        })
    end
    
    player:forbid_buildings("all")
    player:allow_buildings{"europeans_guardhouse", "europeans_tower", "europeans_castle", }

    for i = 0, 1000 do
        -- Time-dependent activation (gametime)
        -- Build material production
        if i == 1 then
            player:allow_buildings{"europeans_lumberjacks_house_basic", }
        end
        if i == 2 then
            player:allow_buildings{"europeans_well_basic", "europeans_well_level_1", }
        end
        if i == 3 then
            player:allow_buildings{"europeans_farm_medium_basic", }
        end
        if i == 4 then
            player:allow_buildings{"europeans_quarry_basic", }
        end
        if i == 5 then
            player:allow_buildings{"europeans_foresters_house_basic", }
        end
        if i == 6 then
            player:allow_buildings{"europeans_sawmill_basic", }
        end
        if i == 7 then
            player:allow_buildings{"europeans_charcoal_kiln_basic", }
        end
        if i == 8 then
            player:allow_buildings{"europeans_stonemasons_house_basic", }
        end
        if i == 9 then
            player:allow_buildings{"europeans_clay_pit_basic", }
        end
        if i == 10 then
            player:allow_buildings{"europeans_weaving_mill_basic", }
        end
        if i == 11 then
            player:allow_buildings{"europeans_lumberjacks_house_normal", "europeans_lumberjacks_house_advanced", }
        end
        if i == 12 then
            player:allow_buildings{"europeans_well_level_2", "europeans_well_level_3", }
        end
        if i == 13 then
            player:allow_buildings{"europeans_farm_medium_normal", }
        end
        if i == 14 then
            player:allow_buildings{"europeans_quarry_normal", }
        end
        if i == 15 then
            player:allow_buildings{"europeans_foresters_house_normal", "europeans_foresters_house_advanced", }
        end
        if i == 16 then
            player:allow_buildings{"europeans_sawmill_normal", "europeans_sawmill_advanced", }
        end
        if i == 17 then
            player:allow_buildings{"europeans_charcoal_kiln_normal", "europeans_charcoal_kiln_advanced", }
        end
        if i == 18 then
            player:allow_buildings{"europeans_stonemasons_house_normal", }
        end
        if i == 19 then
            player:allow_buildings{"europeans_clay_pit_normal", "europeans_clay_pit_advanced", }
        end
        if i == 20 then
            player:allow_buildings{"europeans_weaving_mill_normal", "europeans_weaving_mill_advanced", }
        end
        if i == 21 then
            player:allow_buildings{"europeans_well_level_4", "europeans_well_level_5", }
        end
        if i == 22 then
            player:allow_buildings{"europeans_farm_medium_advanced", }
        end
        if i == 23 then
            player:allow_buildings{"europeans_quarry_advanced", }
        end
        if i == 24 then
            player:allow_buildings{"europeans_stonemasons_house_advanced", }
        end
        -- Agricultur and Food production
        if i == 25 then
            player:allow_buildings{"europeans_farm_basic", "europeans_well_level_6", }
        end
        if i == 26 then
            player:allow_buildings{"europeans_beekeepers_house_basic", }
        end
        if i == 27 then
            player:allow_buildings{"europeans_farm_level_1", }
        end
        if i == 28 then
            player:allow_buildings{"europeans_farm_level_2", }
        end
        if i == 29 then
            player:allow_buildings{"europeans_farm_level_3", }
        end
        if i == 30 then
            player:allow_buildings{"europeans_farm_level_4", }
        end
        if i == 31 then
            player:allow_buildings{"europeans_farm_level_5", }
        end
        if i == 32 then
            player:allow_buildings{"europeans_beekeepers_house_normal", "europeans_beekeepers_house_advanced", }
        end
        if i == 33 then
            player:allow_buildings{"europeans_animal_farm_basic", }
        end
        if i == 34 then
            player:allow_buildings{"europeans_animal_farm_level_1", }
        end
        if i == 35 then
            player:allow_buildings{"europeans_animal_farm_level_2", }
        end
        if i == 36 then
            player:allow_buildings{"europeans_animal_farm_level_3", }
        end
        if i == 37 then
            player:allow_buildings{"europeans_animal_farm_level_4", }
        end
        if i == 38 then
            player:allow_buildings{"europeans_animal_farm_level_5", }
        end
        if i == 39 then
            player:allow_buildings{"europeans_brewery_basic", }
        end
        if i == 40 then
            player:allow_buildings{"europeans_brewery_normal", }
        end
        if i == 41 then
            player:allow_buildings{"europeans_brewery_advanced", }
        end
        if i == 42 then
            player:allow_buildings{"europeans_brewery_winery", }
        end
        if i == 43 then
            player:allow_buildings{"europeans_mill_basic", "europeans_mill_normal", "europeans_mill_advanced", }
        end
        if i == 44 then
            player:allow_buildings{"europeans_tavern_basic", }
        end
        if i == 45 then
            player:allow_buildings{"europeans_tavern_level_1", }
        end
        if i == 46 then
            player:allow_buildings{"europeans_tavern_level_2", }
        end
        if i == 47 then
            player:allow_buildings{"europeans_inn_level_1", }
        end
        if i == 48 then
            player:allow_buildings{"europeans_inn_level_2", }
        end
        -- Metal production
        if i == 49 then
            player:allow_buildings{"europeans_coalmine_basic", "europeans_ironmine_basic", "europeans_goldmine_basic", }
        end
        if i == 50 then
            player:allow_buildings{"europeans_coalmine_level_1", "europeans_ironmine_level_1", "europeans_goldmine_level_1", }
        end
        if i == 51 then
            player:allow_buildings{"europeans_smelting_works_basic", }
        end
        if i == 52 then
            player:allow_buildings{"europeans_coalmine_level_2", "europeans_ironmine_level_2", "europeans_goldmine_level_2", }
        end
        if i == 53 then
            player:allow_buildings{"europeans_coalmine_level_3", "europeans_ironmine_level_3", "europeans_goldmine_level_3", }
        end
        if i == 54 then
            player:allow_buildings{"europeans_smelting_works_normal", }
        end
        if i == 55 then
            player:allow_buildings{"europeans_coalmine_level_4", "europeans_ironmine_level_4", "europeans_goldmine_level_4", }
        end
        if i == 56 then
            player:allow_buildings{"europeans_coalmine_level_5", "europeans_ironmine_level_5", "europeans_goldmine_level_5", }
        end
        if i == 57 then
            player:allow_buildings{"europeans_smelting_works_advanced", }
        end
        -- Money production
        if i == 58 then
            player:allow_buildings{"europeans_scouts_house_basic", }
        end
        if i == 59 then
            player:allow_buildings{"europeans_scouts_house_normal", "europeans_scouts_house_advanced", }
        end
        if i == 60 then
            player:allow_buildings{"europeans_market", "europeans_trading_post", }
        end
        -- Tools and Armor production
        if i == 61 then
            player:allow_buildings{"europeans_toolsmithy_basic", }
        end
        if i == 62 then
            player:allow_buildings{"europeans_toolsmithy_normal", }
        end
        if i == 63 then
            player:allow_buildings{"europeans_toolsmithy_advanced", }
        end
        if i == 64 then
            player:allow_buildings{"europeans_armorsmithy_basic", }
        end
        if i == 65 then
            player:allow_buildings{"europeans_armorsmithy_normal", }
        end
        if i == 66 then
            player:allow_buildings{"europeans_armorsmithy_advanced", }
        end
        -- Carrier and Worker Recruitement
        if i == 67 then
            player:allow_buildings{"europeans_ferry_yard_basic", }
        end
        if i == 68 then
            player:allow_buildings{"europeans_ferry_yard_normal", }
        end
        if i == 69 then
            player:allow_buildings{"europeans_ferry_yard_advanced", }
        end
        if i == 70 then
            player:allow_buildings{"europeans_recruitement_center_basic", }
        end
        if i == 71 then
            player:allow_buildings{"europeans_recruitement_center_normal", }
        end
        if i == 72 then
            player:allow_buildings{"europeans_recruitement_center_advanced", }
        end
        -- Soldier Recruitement and Training
        if i == 73 then
            player:allow_buildings{"europeans_battlearena_basic", }
        end
        if i == 74 then
            player:allow_buildings{"europeans_trainingscamp_basic", }
        end
        if i == 75 then
            player:allow_buildings{"europeans_battlearena_level_1", }
        end
        if i == 76 then
            player:allow_buildings{"europeans_trainingscamp_level_1", }
        end
        if i == 77 then
            player:allow_buildings{"europeans_battlearena_level_2", }
        end
        if i == 78 then
            player:allow_buildings{"europeans_trainingscamp_level_2", }
        end
        if i == 79 then
            player:allow_buildings{"europeans_battlearena_level_3", }
        end
        if i == 80 then
            player:allow_buildings{"europeans_trainingscamp_level_3", }
        end
        if i == 81 then
            player:allow_buildings{"europeans_battlearena_level_4", }
        end
        if i == 82 then
            player:allow_buildings{"europeans_trainingscamp_level_4", }
        end
        if i == 83 then
            player:allow_buildings{"europeans_store", }
        end

        -- Map-dependent activation (seafaring / terraforming)
        if ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) and (i == 24) then
            player:allow_buildings{"europeans_port", "europeans_shipyard_basic", "europeans_shipyard_normal", "europeans_shipyard_advanced", }
            place_ship_random(player, 64)
            place_ship_random(player, 64)
        end
        if ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) and (i == 48) then
            place_ship_random(player, 64)
            place_ship_random(player, 64)
        end
        if ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) and (i == 72) then
            place_ship_random(player, 64)
            place_ship_random(player, 64)
        end
        if ((map.allows_seafaring == false) or (map.number_of_port_spaces == 0)) and (i == 28) then
            player:allow_buildings{"europeans_headquarters", "europeans_warehouse_basic", "europeans_warehouse_normal", "europeans_warehouse_advanced", }
        end
        if ((map.allows_seafaring == false) or (map.number_of_port_spaces == 0)) and (i == 64) then
            player:allow_buildings{"europeans_terraformers_house_basic", "europeans_terraformers_house_normal", "europeans_terraformers_house_advanced", }
        end
        -- Delay of 10 min between actions
        sleep(600000)
    end
end
}

pop_textdomain()
return init
