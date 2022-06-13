local set_buffer_option = vim.api.nvim_buf_set_option
local set_window_option = vim.api.nvim_win_set_option

local set_buffer_options = function(args)
  local bufnr = args.buf

  -- tabs
  local tab_width = 2
  set_buffer_option(bufnr, 'tabstop', tab_width)
  set_buffer_option(bufnr, 'shiftwidth', tab_width)
  set_buffer_option(bufnr, 'expandtab', true)
end

-- line numbers
set_window_option(0, 'number', true)
set_window_option(0, 'relativenumber', true)

vim.api.nvim_create_autocmd('BufEnter', {
  callback = set_buffer_options
})
