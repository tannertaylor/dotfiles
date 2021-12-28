-- functions
local map_key = vim.api.nvim_set_keymap
local options = { noremap = true }

local map_normal_key = function(keys, command)
    map_key("n", keys, command, options)
end

local unbind_normal_key = function(key)
    map_key("n", key, "<nop>", options)
end

local map_insert_key = function(keys, command)
    map_key("i", keys, command, options)
end

local map_command_key = function(keys, command)
    map_key("c", keys, command, options)
end

-- map normal-mode keys
-- window shortcuts
map_normal_key("<C-h>", "<C-w>h")
map_normal_key("<C-j>", "<C-w>j")
map_normal_key("<C-k>", "<C-w>k")
map_normal_key("<C-l>", "<C-w>l")

-- nvim-tree keymaps
map_normal_key("<C-n>", ":NvimTreeToggle<CR>")

-- LSP keymaps
unbind_normal_key("r")
map_normal_key("rr", ":lua vim.lsp.buf.rename()<CR>")
map_normal_key("gd", ":lua vim.lsp.buf.definition()<CR>")
map_normal_key("K", ":lua vim.lsp.buf.hover()<CR>")
map_normal_key("F", ":lua vim.lsp.buf.formatting()<CR>")

-- Telescope keymaps
map_normal_key("ca", ":Telescope lsp_code_actions<CR>")
map_normal_key("gr", ":Telescope lsp_references<CR>")
map_normal_key("gi", ":Telescope lsp_implementations<CR>")
map_normal_key("gt", ":Telescope lsp_workspace_symbols<CR>")
map_normal_key("ga", ":Telescope live_grep<CR>")
map_normal_key("gf", ":Telescope find_files<CR>")

-- map insert-mode keys
map_insert_key("", "<C-w>") -- convert ctrl+backspace to delete previous word
map_insert_key("<C-Space>", "<C-o>:lua vim.lsp.buf.signature_help()<CR>")

-- map command-mode keys
map_command_key("", "<C-w>") -- convert ctrl+backspace to delete previous word
