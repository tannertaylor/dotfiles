-- define keymaps per mode
local normal_keymaps = {
  -- general keymaps
  ['<c-s>'] = '<cmd>w<CR>',
  ['<c-z>'] = 'u',

  -- window keymaps
  ['<c-h>'] = '<c-w>h',
  ['<c-j>'] = '<c-w>j',
  ['<c-k>'] = '<c-w>k',
  ['<c-l>'] = '<c-w>l'
}

local insert_keymaps = {
  -- general keymaps
  ['<c-s>'] = '<cmd>w<CR>',
  ['<c-z>'] = '<Esc>ua'
}

-- apply keymaps
local options = { noremap = true }

for keymap, target in pairs(normal_keymaps) do
  vim.api.nvim_set_keymap('n', keymap, target, options)
end

for keymap, target in pairs(insert_keymaps) do
  vim.api.nvim_set_keymap('i', keymap, target, options)
end
