local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

local map = vim.keymap.set

local on_attach = function(client, bufnr)
  map('n', 'gd', vim.lsp.buf.definition)
end

lspconfig.util.default_config = vim.tbl_extend(
  'force',
  lspconfig.util.default_config,
  {
    on_attach = on_attach
  }
)

require('lsp.sumneko_lua')
