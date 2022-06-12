local success, nvim_tree = pcall(require, "nvim-tree")
if not success then
    return
end

nvim_tree.setup()
