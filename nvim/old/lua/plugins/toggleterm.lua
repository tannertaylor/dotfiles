local success, toggleterm = pcall(require, "toggleterm")
if not success then
    return
end

toggleterm.setup({
    direction = "float",
    open_mapping = "<C-t>",
    insert_mappings = true
})
