local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" --"/home/tanner/.local/share/lazy.nvim"

if not vim.loop.fs_stat(lazy_path) then
  local lazy_repo = "https://github.com/folke/lazy.nvim"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazy_repo, lazy_path })
end

vim.opt.rtp:prepend(lazy_path)

local plugins = {
  "autopairs",
  "bufferline",
  "cmp",
  "comment",
  "dressing",
  "fterm",
  "github-theme",
  "lspconfig",
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
