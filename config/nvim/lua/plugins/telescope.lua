return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = "move_selection_next",
                            ["<C-k>"] = "move_selection_previous"
                        }
                    }
                }
            })

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "ff", builtin.find_files, {})
            vim.keymap.set("n", "fa", builtin.live_grep, {})
            vim.keymap.set("n", "gr", builtin.lsp_references, {})
            vim.keymap.set("n", "gt", builtin.lsp_workspace_symbols, {})
        end
    }
}
