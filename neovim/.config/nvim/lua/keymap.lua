local map_key = vim.api.nvim_set_keymap
local options = { noremap = true }

-- map leader key
vim.g.mapleader = " "

-- map normal-mode keys
map_key("n", "<C-n>", ":NERDTreeToggle<CR>", options)
map_key("n", "<C-w><Bslash>", ":vsp<CR>", options)
map_key("n", "<C-w>-", ":sp<CR>", options)
map_key("n", "<C-kPoint>", ":Telescope lsp_code_actions", options)
map_key("n", "gd", ":lua vim.lsp.buf.definition()<CR>", options)

-- map insert-mode keys
map_key("i", "", "<C-w>", options) -- convert ctrl+backspace to delete previous word

-- map command-mode keys
map_key("c", "", "<C-w>", options) -- convert ctrl+backspace to delete previous word in command mode
