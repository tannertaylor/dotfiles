return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "awk_ls",
        "bashls",
        "bufls", -- protobuf
        "docker_compose_language_service",
        "dockerls",
        "gopls",
        "graphql",
        "jsonls",
        "lua_ls",
        "marksman", -- markdown
        "nil_ls", -- nix
        "powershell_es",
        "rust_analyzer",
        "sqlls",
        "terraformls",
        "yamlls",
      },
      handlers = {
        function (server_name)
          require("lspconfig")[server_name].setup({ })
        end,
      },
    },
  },
  "neovim/nvim-lspconfig",
}
