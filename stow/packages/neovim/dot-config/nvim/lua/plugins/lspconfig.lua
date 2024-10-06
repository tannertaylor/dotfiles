return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function() tt.lsp.load_lspconfigs() end,
  }
}
