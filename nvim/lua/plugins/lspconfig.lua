vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = true
})

local map = vim.keymap.set

local on_attach = function(client, buffer_number)
  map('n', 'gs', '<cmd>Telescope lsp_workspace_symbols<cr>')
  map('n', 'gr', '<cmd>Telescope lsp_references<cr>')
  map('n', 'gd', vim.lsp.buf.definition)

  map('n', 'gh', function()
    local ok, hover = pcall(require, 'lspsaga.hover')
    if ok then
      hover.render_hover_doc()
    end
  end)
end

local lspconfig = require('lspconfig')
lspconfig.util.default_config = vim.tbl_extend(
  'force',
  lspconfig.util.default_config,
  {
    on_attach
  }
)

require('lsp.sumneko_lua')
require('lsp.omnisharp')
