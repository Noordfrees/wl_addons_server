N = (get_build_id():find("1.0") ~= 1)

if N then
    return {
       cottonfield_ripe = { "field", "ripe_cotton", "__replace_if_exists" },
    }
else
    return {}
end
