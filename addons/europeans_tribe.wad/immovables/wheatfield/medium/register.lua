N = (get_build_id():find("1.0") ~= 1)

if N then
    return {
      wheatfield_medium = { "field", "flowering", "__replace_if_exists" }
    }
else
    return {}
end
