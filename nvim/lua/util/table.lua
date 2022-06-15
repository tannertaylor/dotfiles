table.has_value = function(tbl, search_value)
  for _, value in pairs(tbl) do
    if (value == search_value) then
      return true
    end
  end

  return false
end
