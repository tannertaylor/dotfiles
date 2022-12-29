vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('', '<Space>', '<Nop>')

require('mine.globals')
require('mine.options')
require('mine.lazy')
require('mine.keymaps')
