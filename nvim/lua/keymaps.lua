local function map(mode, source, target)
    vim.keymap.set(mode, source, target, { silent = true })
end

-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
map('', '<Space>', '<Nop>')

-- [NORMAL]
-- window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- explorer
map('n', '<Leader>e', ':Lex 20<CR>')

-- resizing
map('n', '<C-Up>', ':resize +2<CR>')
map('n', '<C-Down>', ':resize -2<CR>')
map('n', '<C-Left>', ':vertical resize +2<CR>')
map('n', '<C-Right>', ':vertical resize -2<CR>')

-- moving text
map('n', '<A-j>', ':move .+1<CR>==')
map('n', '<A-k>', ':move .-2<CR>==')

-- telescope
--map('n', 'gf', ':Telescope find_files<CR>')
--map('n', 'ga', ':Telescope live_grep<CR>')
--map('n', 'gh', ':Telescope help_tags<CR>')

-- [INSERT]
-- switch to normal mode
map('i', 'jk', '<Esc>')

-- [VISUAL]
-- stay in 'tab' mode
map('v', '<Tab>', '>gv')
map('v', '<S-Tab>', '<gv')
map('v', 'p', '"_dP') -- when putting text, don't yank the current text, delete it (into a register) and THEN put

-- moving text
map('v', '<A-j>', ':move \'>+1<CR>gv=gv')
map('v', '<A-k>', ':move \'<-2<CR>gv=gv')
