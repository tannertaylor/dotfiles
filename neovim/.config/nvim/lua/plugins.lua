-- make sure packer is installed
local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. packer_path)
end

-- plugin configuration
require("packer").startup(function()
    -- have packer update itself
    use("wbthomason/packer.nvim")

    -- language server protocol
    use("neovim/nvim-lspconfig")
    use("kabouzeid/nvim-lspinstall")

    -- color schemes
    use("tomasr/molokai")
end)
