local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

lspconfig['omnisharp'].setup({
  cmd = {
    '/opt/omnisharp/omnisharp-roslyn/OmniSharp',
    '--languageserver',
    '--hostPID',
    tostring(vim.fn.getpid())
  }
})
