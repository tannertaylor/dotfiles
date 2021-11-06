local map_key = vim.api.nvim_set_keymap
local options = { noremap = true }

map_key("n", "<C-w><Bslash>", ":vsp<CR>", options)
map_key("n", "<C-w>-", ":sp<CR>", options)
