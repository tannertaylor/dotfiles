local map_key = vim.api.nvim_set_keymap
local options = { noremap = true }

-- map normal-mode keys
map_key("n", "<C-w><Bslash>", ":vsp<CR>", options)
map_key("n", "<C-w>-", ":sp<CR>", options)

-- map insert-mode keys
map_key("i", "", "<C-w>", options) -- convert ctrl+backspace to delete previous word
