-- define options
local tab_width = 2
local buffer_options = {
  ['tabstop'] = tab_width,
  ['shiftwidth'] = tab_width,
  ['expandtab'] = true,
  ['omnifunc'] = 'v:lua.vim.lsp.omnifunc'
}

local window_options = {
  ['number'] = true,
  ['relativenumber'] = true
}

local global_options = {
  ['splitbelow'] = true,
  ['splitright'] = true
}

-- apply options
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function(args)
    for option, value in pairs(buffer_options) do
      vim.api.nvim_buf_set_option(args.buf, option, value)
    end
  end
})

for option, value in pairs(window_options) do
  vim.api.nvim_win_set_option(0, option, value)
end

for option, value in pairs(global_options) do
  vim.api.nvim_set_option(option, value)
end
