local lazy_path = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
  local lazy_repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=v11.14.1" })
end
vim.opt.rtp:prepend(lazy_path)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})
