return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        keys = {
            { "<Leader>e", "<cmd>NvimTreeToggle<CR>", desc = "NvimTree" }
        },
        config = function()
            require("nvim-tree").setup()
        end
    }
}
