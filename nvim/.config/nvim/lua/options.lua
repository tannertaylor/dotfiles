local options = vim.opt
local globals = vim.g

-- tab set-up
local tab_width = 4
options.tabstop = tab_width
options.softtabstop = tab_width
options.shiftwidth = tab_width
options.expandtab = true

-- line numbers
options.number = true
options.relativenumber = true

-- set theme style to dark
globals.vscode_style = "dark"

-- nerdtree settings
globals.NERDTreeShowHidden = true

-- vimspector settings
globals.vimspector_enable_mappings = "HUMAN"
