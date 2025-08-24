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
        "docker_compose_language_service",
        "dockerls",
        "graphql",
        "jsonls",
        "lua_ls",
        "marksman", -- markdown
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
