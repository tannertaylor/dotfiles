local success, lualine = pcall(require, "lualine")
if not success then
    return
end

lualine.setup()
