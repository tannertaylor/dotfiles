local success, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not success then
    return
end

treesitter_configs.setup {
    ensure_installed = { "c_sharp", "lua" },
    highlight = {
        enable = true
    }
}
