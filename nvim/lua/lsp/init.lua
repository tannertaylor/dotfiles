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

local on_attach = function(client, bufnr)
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true
  })

  local map = vim.keymap.set
  map('n', 'gs', '<cmd>Telescope lsp_workspace_symbols<cr>')
  map('n', 'gr', '<cmd>Telescope lsp_references<cr>')
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

lspconfig['csharp_ls'].setup({ })

require('lsp.sumneko_lua')
-- require('lsp.omnisharp')
