local success, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not success then
    return
end

treesitter_configs.setup {
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "c_sharp",
        "css",
        "dockerfile",
        "javascript",
        "json",
        "lua",
        "make",
        "typescript",
        "vim",
        "yaml"
    },
    highlight = {
        enable = true
    }
}
