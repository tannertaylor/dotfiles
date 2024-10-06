return {
  {
    "hrsh7th/nvim-cmp",

    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lua",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },

    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "calc" },
        { name = "path" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua" },
        { name = "luasnip" },
      },

      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end
      },

      completion = {
        completeopt = "menu,menuone",
      },
    },

    config = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = {
        ["<cr>"] = cmp.mapping.close(),
        ["<tab>"] = cmp.mapping.confirm({ select = true }),
        ["<c-j>"] = cmp.mapping.select_next_item(),
        ["<c-k>"] = cmp.mapping.select_prev_item(),
      }

      cmp.setup(opts)
    end
  }
}
