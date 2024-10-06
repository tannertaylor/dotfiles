local lazy_path = "/home/tanner/.local/share/lazy.nvim"
vim.opt.rtp:prepend(lazy_path)

local plugins = {
  "autopairs",
  "bufferline",
  "cmp",
  "comment",
  "dressing",
  "fterm",
  "lualine",
  "telescope",
  "treesitter",
  "ts-autotag",
  "which-key",
}

require("lazy").setup({
  spec = tt.utils.map(plugins, function(plugin)
    return { import = "plugins." .. plugin }
  end),
})
