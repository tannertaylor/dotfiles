-- Customize Mason plugins

---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer",
    opts = {
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "jsonls",
        "dockerls",
        "yamlls",
        "prettier",
        "stylua",
        "gopls",
        "html-lsp",
        "htmx-lsp",
      },
    },
  },
}
