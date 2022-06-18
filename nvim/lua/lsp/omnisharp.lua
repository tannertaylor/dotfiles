local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

lspconfig['omnisharp'].setup({
  cmd = { 'omnisharp', '--languageserver', '--hostPID', tostring(vim.fn.getpid()) }
})
