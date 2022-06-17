local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

local ok, lspsaga_codeaction = pcall(require, 'lspsaga.codeaction')
if not ok then
  return
end

local ok, lspsaga_hover = pcall(require, 'lspsaga.hover')
if not ok then
  return
end

local map = vim.keymap.set

local on_attach = function(client, bufnr)
  map('n', 'gd', vim.lsp.buf.definition)
  map('n', 'gh', lspsaga_hover.render_hover_doc)
  map('n', 'ca', lspsaga_codeaction.code_action)
end

lspconfig.util.default_config = vim.tbl_extend(
  'force',
  lspconfig.util.default_config,
  {
    on_attach = on_attach
  }
)

require('lsp.sumneko_lua')
