-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('', '<Space>', '<Nop>')

require('mine.utils.mapper').map({
    n = {
        -- window navigation
        ['<C-h>'] = '<C-w>h',
        ['<C-j>'] = '<C-w>j',
        ['<C-k>'] = '<C-w>k',
        ['<C-l>'] = '<C-w>l',

        -- moving text
        ['<A-j>'] = ':move .+1<CR>==',
        ['<A-k>'] = ':move .-2<CR>=='
    },
    i = {
        -- delete previous word
        ['<C-BS>'] = '<C-W>'
    },
    v = {
        -- stay in 'tab' mode
        ['<Tab>'] = '>gv',
        ['<S-Tab>'] = '<gv',
        p = '"_dP', -- when putting text, don't yank the current text, delete it (into a register) and THEN put

        ['<A-j>'] = ':move \'>+1<CR>gv=gv',
        ['<A-k>'] = ':move \'<-2<CR>gv=gv'
    }
})
