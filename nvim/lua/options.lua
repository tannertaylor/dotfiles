-- functions
local function set_global_option(option, value)
  vim.api.nvim_set_option(option, value)
end

local function set_window_option(option, value)
  vim.api.nvim_win_set_option(0, option, value)
end

local function set_buffer_option(option, value)
  vim.api.nvim_buf_set_option(0, option, value)
end

-- tabs
local tab_width = 2
set_buffer_option('tabstop', tab_width)
set_buffer_option('shiftwidth', tab_width)
set_buffer_option('expandtab', true)

-- line numbers
set_window_option('number', true)
set_window_option('relativenumber', true)
