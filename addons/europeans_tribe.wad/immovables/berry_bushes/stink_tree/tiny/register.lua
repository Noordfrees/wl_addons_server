N = (get_build_id():find("1.0") ~= 1)

if N then
    return {
       berry_bush_stink_tree_tiny = { "seed_berrybush", "__replace_if_exists" },
    }
else
    return {}
end
