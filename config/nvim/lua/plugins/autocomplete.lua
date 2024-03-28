return {
    "hrsh7th/cmp-nvim-lsp",
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-k>'] = cmp.mapping.select_prev_item()
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }
                })
            })
        end
    },
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip"
}
