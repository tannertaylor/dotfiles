-- functions
local function set_normal_keymap(keymap, target)
  vim.api.nvim_set_keymap('n', keymap, target, { noremap = true })
end

local function set_insert_keymap(keymap, target)
  vim.api.nvim_set_keymap('i', keymap, target, { noremap = true })
end

-- keymaps
-- general keymaps
set_normal_keymap('<c-s>', ':w<CR>')
set_insert_keymap('<c-s>', '<Esc>:w<CR>a')
set_normal_keymap('<c-z>', 'u')
set_insert_keymap('<c-z>', '<Esc>ua')

-- pane keymaps
set_normal_keymap('<c-j>', '<c-w>j')
set_normal_keymap('<c-k>', '<c-w>k')
set_normal_keymap('<c-h>', '<c-w>h')
set_normal_keymap('<c-l>', '<c-w>l')
