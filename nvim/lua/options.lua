local tab_width = 4

local options = {
    backup = false,
    cursorline = true,
    expandtab = true,
    fileencoding = "utf-8",
    ignorecase = true,
    mouse = "a",
    number = true,
    relativenumber = true,
    shiftwidth = tab_width,
    showmode = false,
    showtabline = tab_width,
    signcolumn = "yes",
    smartcase = true,
    smartindent = true,
    softtabstop = tab_width,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = tab_width,
    undofile = true,
    updatetime = 750,
    writebackup = false
}

for key, value in pairs(options) do
    vim.opt[key] = value
end

local globals = vim.g

-- nerdtree settings
globals.NERDTreeShowHidden = true

-- vimspector settings
globals.vimspector_enable_mappings = "HUMAN"
