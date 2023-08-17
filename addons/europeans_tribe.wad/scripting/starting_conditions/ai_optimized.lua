-- =======================================================================
--              Headquarters Starting Conditions for Europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"
include "addons/europeans_tribe.wad/scripting/debug_europeans.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "AI optimized starting condition, not for human player",
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

    prefilled_buildings(player, { "europeans_headquarters", sf.x, sf.y,
        wares = {
            log = 128,
            reed = 128,
            granite = 128,
            blackwood = 64,
            cloth = 64,
            grout = 64,
            planks = 32,
            brick = 32,
            marble = 32,
            marble_column = 24,
            quartz = 24,
            diamond = 16,
            water = 64,
            coal = 64,
            ore = 16,
            iron = 4,
            gold = 4,
            buckets = 16,
            basket = 16
        },
        workers = {
            europeans_geologist = 1,
            europeans_carrier = 32,
            europeans_builder = 32,
            europeans_farmer_basic = 32,
            europeans_lumberjack_basic = 12,
            europeans_miner_basic = 12,
            europeans_trader = 10,
            europeans_carpenter_basic = 6,
            europeans_stonemason_basic = 6,
            europeans_breeder_basic = 6,
            europeans_trainer_basic = 6,
            europeans_weaver_basic = 4,
            europeans_stonecutter_basic = 4,
            europeans_charcoal_burner_basic = 4,
            europeans_brewer_basic = 4,
            europeans_miller_basic = 4,
            europeans_baker_basic = 4,
            europeans_smelter_basic = 4,
            europeans_smith_basic = 4,
            europeans_tailor_basic = 4,
            europeans_shoemaker_basic = 4,
            europeans_claydigger_basic = 4,
            europeans_forester_basic = 4,
            europeans_shipwright_basic = 4
      },
        soldiers = {
            [{0,0,0,0}] = 32,
      }
    })
    
    player:forbid_buildings("all")
    player:allow_buildings{"europeans_guardhouse", "europeans_tower", "europeans_barrier", "europeans_castle", }
    player:allow_buildings{"europeans_tower_small", "europeans_tower_high", "europeans_outpost", "europeans_fortress", }
    player:allow_buildings{"europeans_sentry", "europeans_advanced_tower", "europeans_advanced_barrier", "europeans_advanced_castle", }

    -- Delay of 10 min between actions
    local time_min = 10
    
    for i = 0, 1024 do
        -- Time-dependent activation (gametime)
        -- Basic Buildings
        if i == 1 then
            player:allow_buildings{"europeans_lumberjacks_house_basic", "europeans_sawmill_basic", }
        elseif i == 2 then
            player:allow_buildings{"europeans_well_basic", "europeans_well_level_1", "europeans_farm_medium_basic", }
        elseif i == 3 then
            player:allow_buildings{"europeans_quarry_basic", "europeans_stonemasons_house_basic", }
        elseif i == 4 then
            player:allow_buildings{"europeans_charcoal_kiln_basic", }
        elseif i == 5 then
            player:allow_buildings{"europeans_foresters_house_basic", }  
        elseif i == 6 then
            player:allow_buildings{"europeans_weaving_mill_basic", }
        elseif i == 7 then
            player:allow_buildings{"europeans_farm_basic", "europeans_beekeepers_house_basic", }
        elseif i == 8 then
            player:allow_buildings{"europeans_animal_farm_basic", }
        elseif i == 9 then
            player:allow_buildings{"europeans_brewery_basic", "europeans_mill_basic", }
        elseif i == 10 then
            player:allow_buildings{"europeans_bakery_basic", }
        elseif i == 11 then
            player:allow_buildings{"europeans_market_small", }
        elseif i == 12 then
            player:allow_buildings{"europeans_clay_pit_basic", }
            player:allow_buildings{"europeans_coalmine_basic", "europeans_ironmine_basic", "europeans_goldmine_basic", }
            player:allow_buildings{"europeans_coalmine_level_1", "europeans_ironmine_level_1", "europeans_goldmine_level_1", }
        elseif i == 13 then
            player:allow_buildings{"europeans_smelting_works_basic", }
        elseif i == 14 then
            player:allow_buildings{"europeans_toolsmithy_basic", }
        elseif i == 15 then
            player:allow_buildings{"europeans_recruitement_center_basic", }
        elseif i == 16 then
            player:allow_buildings{"europeans_tailors_house_basic", "europeans_shoemakers_house_basic", "europeans_weaponsmithy_basic", }
        elseif i == 17 then
            player:allow_buildings{"europeans_trainingscamp_basic", "europeans_battlearena_basic", }
        elseif i == 18 then
            player:allow_buildings{"europeans_scouts_house_basic", }
        end
        -- Normal Buildings
        if i == 19 then
            player:allow_buildings{"europeans_lumberjacks_house_normal", "europeans_sawmill_normal", }
        elseif i == 20 then
            player:allow_buildings{"europeans_well_level_2", "europeans_well_level_3", "europeans_farm_medium_normal", }
        elseif i == 21 then
            player:allow_buildings{"europeans_quarry_normal", "europeans_stonemasons_house_normal", }
        elseif i == 22 then
            player:allow_buildings{"europeans_charcoal_kiln_normal", }
        elseif i == 23 then
            player:allow_buildings{"europeans_foresters_house_normal", }
        elseif i == 24 then
            player:allow_buildings{"europeans_weaving_mill_normal", }
        elseif i == 25 then
            player:allow_buildings{"europeans_farm_normal", "europeans_beekeepers_house_normal", }
        elseif i == 26 then
            player:allow_buildings{"europeans_animal_farm_normal", }
        elseif i == 27 then
            player:allow_buildings{"europeans_brewery_normal", "europeans_mill_normal", }
        elseif i == 28 then
            player:allow_buildings{"europeans_bakery_normal", }
        elseif i == 29 then
            player:allow_buildings{"europeans_market_big", }
        elseif i == 30 then
            player:allow_buildings{"europeans_clay_pit_normal", }
            player:allow_buildings{"europeans_coalmine_level_2", "europeans_ironmine_level_2", "europeans_goldmine_level_2", }
            player:allow_buildings{"europeans_coalmine_level_3", "europeans_ironmine_level_3", "europeans_goldmine_level_3", }
        elseif i == 31 then
            player:allow_buildings{"europeans_smelting_works_normal", }
        elseif i == 32 then
            player:allow_buildings{"europeans_toolsmithy_normal", }
        elseif i == 33 then
            player:allow_buildings{"europeans_recruitement_center_normal", }
        elseif i == 34 then
            player:allow_buildings{"europeans_tailors_house_normal", "europeans_shoemakers_house_normal", "europeans_weaponsmithy_normal", }
        elseif i == 35 then
            player:allow_buildings{"europeans_trainingscamp_normal", "europeans_battlearena_level_1", }
        elseif i == 36 then
            player:allow_buildings{"europeans_scouts_house_normal", "europeans_store_small", }
        end
        -- Advanced Buildings
        if i == 37 then
            player:allow_buildings{"europeans_lumberjacks_house_advanced", "europeans_sawmill_advanced", }
        elseif i == 38 then
            player:allow_buildings{"europeans_well_level_4", "europeans_well_level_5", "europeans_well_level_6", "europeans_farm_medium_advanced", }
        elseif i == 39 then
            player:allow_buildings{"europeans_quarry_advanced", "europeans_stonemasons_house_advanced", }
        elseif i == 40 then
            player:allow_buildings{"europeans_charcoal_kiln_advanced", }
        elseif i == 41 then
            player:allow_buildings{"europeans_foresters_house_advanced", }
        elseif i == 42 then
            player:allow_buildings{"europeans_weaving_mill_advanced", }
        elseif i == 43 then
            player:allow_buildings{"europeans_farm_advanced", "europeans_beekeepers_house_advanced", }
        elseif i == 44 then
            player:allow_buildings{"europeans_animal_farm_advanced", "europeans_animal_farm_big", }
        elseif i == 45 then
            player:allow_buildings{"europeans_brewery_advanced", "europeans_brewery_winery", "europeans_mill_advanced", }
        elseif i == 46 then
            player:allow_buildings{"europeans_bakery_advanced", }
        elseif i == 47 then
            player:allow_buildings{"europeans_trading_post", }
        elseif i == 48 then
            player:allow_buildings{"europeans_clay_pit_advanced", }
            player:allow_buildings{"europeans_coalmine_level_4", "europeans_ironmine_level_4", "europeans_goldmine_level_4", }
            player:allow_buildings{"europeans_coalmine_level_5", "europeans_ironmine_level_5", "europeans_goldmine_level_5", }
        elseif i == 49 then
            player:allow_buildings{"europeans_smelting_works_advanced", }
        elseif i == 50 then
            player:allow_buildings{"europeans_toolsmithy_advanced", }
        elseif i == 51 then
            player:allow_buildings{"europeans_recruitement_center_advanced", }
        elseif i == 52 then
            player:allow_buildings{"europeans_tailors_house_advanced", "europeans_shoemakers_house_advanced", "europeans_weaponsmithy_advanced", }
        elseif i == 53 then
            player:allow_buildings{"europeans_trainingscamp_advanced", "europeans_battlearena_level_2", "europeans_battlearena_level_3", }
        elseif i == 54 then
            player:allow_buildings{"europeans_scouts_house_advanced", "europeans_store_big", }
        end
        
       -- Map-depend and Time-depend activation (gametime)
        if (map.waterway_max_length > 0) and (i == 18) then
            player:allow_buildings{"europeans_ferry_yard_basic", }
            place_ship_random(player, 64)
        elseif (map.waterway_max_length > 0) and (i == 36) then
            player:allow_buildings{"europeans_ferry_yard_normal", }
            place_ship_random(player, 64)
        elseif (map.waterway_max_length > 0) and (i == 54) then
            player:allow_buildings{"europeans_ferry_yard_advanced", }
            place_ship_random(player, 64)
        end
        if ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) and (i == 18) then
            player:allow_buildings{"europeans_port", "europeans_shipyard_basic", }
            place_ship_random(player, 64)
        elseif ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) and (i == 36) then
            player:allow_buildings{"europeans_shipyard_normal", }
            place_ship_random(player, 64)
        elseif ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) and (i == 54) then
            player:allow_buildings{"europeans_shipyard_advanced", }
            place_ship_random(player, 64)
        end
        if ((map.allows_seafaring == false) or (map.number_of_port_spaces == 0)) and (i == 18) then
            player:allow_buildings{"europeans_warehouse", "europeans_terraformers_house_basic", }
        elseif ((map.allows_seafaring == false) or (map.number_of_port_spaces == 0)) and (i == 36) then
            player:allow_buildings{"europeans_terraformers_house_normal", }
        elseif ((map.allows_seafaring == false) or (map.number_of_port_spaces == 0)) and (i == 54) then
            player:allow_buildings{"europeans_headquarters", "europeans_terraformers_house_advanced", }
        end
        
       -- Experimental actions
        if (i >= 54) and (i % 6 == 3) then
            balance_warehouse_wares(player)
            balance_workerhouse_workers(player)
        elseif (i >= 54) and (i % 6 == 0) then
            reset_warehouse_policy(player)
        end
        
        if (i >= 54) and (i % 6 == 1) then
            for j, building in ipairs(player:get_buildings("europeans_guardhouse")) do
                if (j == 1) then
                    building:enhance(true)
                end
            end
            for j, building in ipairs(player:get_buildings("europeans_castle")) do
                if (j == 1) then
                    building:enhance(true)
                end
            end
        elseif (i >= 54) and (i % 6 == 2) then
            for j, building in ipairs(player:get_buildings("europeans_barrier")) do
                if (j == 1) then
                    building:enhance(true)
                end
            end
        elseif (i >= 54) and (i % 6 == 3) then
            for j, building in ipairs(player:get_buildings("europeans_tower")) do
                if (j == 1) then
                    building:enhance(true)
                end
            end
        elseif (i >= 54) and (i % 6 == 4) then
            for j, building in ipairs(player:get_buildings("europeans_tower_small")) do
                if (j == 1) then
                    building:enhance(true)
                end
            end
            for j, building in ipairs(player:get_buildings("europeans_fortress")) do
                if (j == 1) then
                    building:enhance(true)
                end
            end
        elseif (i >= 54) and (i % 6 == 5) then
            for j, building in ipairs(player:get_buildings("europeans_tower_high")) do
                if (j == 1) then
                    building:enhance(true)
                end
            end
        elseif (i >= 54) and (i % 6 == 0) then
            for j, building in ipairs(player:get_buildings("europeans_outpost")) do
                if (j == 1) then
                    building:enhance(true)
                end
            end
        end
        
        sleep(time_min * 60000)
    end
end
}

pop_textdomain()
return init
