local default_tab_size = 2

local options = {
  number = true,
  relativenumber = true,
  statuscolumn = "%C %s %=%r ",
  ignorecase = true,
  showtabline = default_tab_size,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  expandtab = true,
  shiftwidth = default_tab_size,
  tabstop = default_tab_size,
  cursorline = true,
  signcolumn = "yes",
  scrolloff = 2,
  conceallevel = 1,
  timeout = true,
  timeoutlen = 300,
}

for k, v in pairs(options) do
  vim.o[k] = v
end
