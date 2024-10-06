vim.diagnostic.config({
  underline = {
    vim.diagnostic.severity.WARN,
    vim.diagnostic.severity.ERROR,
  },
  update_in_insert = true,
  virtual_text = false,
})
