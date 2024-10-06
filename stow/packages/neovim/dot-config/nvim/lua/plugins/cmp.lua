return {
  {
    "hrsh7th/nvim-cmp",
    commit = "ae644feb7b67bf1ce4260c231d1d4300b19c6f30",

    dependencies = {
      {
        "hrsh7th/cmp-nvim-lsp",
        commit = "39e2eda76828d88b773cc27a3f61d2ad782c922d",
      },
      {
        "hrsh7th/cmp-buffer",
        commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
      },
      {
        "hrsh7th/cmp-calc",
        commit = "5947b412da67306c5b68698a02a846760059be2e",
      },
      {
        "hrsh7th/cmp-path",
        commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
      },
      {
        "hrsh7th/cmp-nvim-lsp-signature-help",
        commit = "031e6ba70b0ad5eee49fd2120ff7a2e325b17fa7",
      },
      {
        "hrsh7th/cmp-nvim-lua",
        commit = "f12408bdb54c39c23e67cab726264c10db33ada8",
      },
      {
        "L3MON4D3/LuaSnip",
        commit = "e808bee352d1a6fcf902ca1a71cee76e60e24071",
      },
      {
        "saadparwaiz1/cmp_luasnip",
        commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843",
      }
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
