local success, autopairs = pcall(require, "nvim-autopairs")
if not success then
    return
end

autopairs.setup()
