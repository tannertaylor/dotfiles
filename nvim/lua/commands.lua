vim.api.nvim_create_user_command('OpenTerm', function()
  local buffer_handle = vim.api.nvim_create_buf(false, false)
  if not buffer_handle then
    return
  end

  local window_handle = vim.api.nvim_open_win(buffer_handle, true, {
    relative = 'editor',
    width = 100,
    height = 25,
    row = 10,
    col = 10
  })

  if not window_handle then
    return
  end

  vim.api.nvim_open_term(buffer_handle, { })
end, { })
