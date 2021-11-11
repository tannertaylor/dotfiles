-- make sure packer is installed
local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. packer_path)
end

-- plugin configuration
require("packer").startup(function(use)
    -- have packer update itself
    use("wbthomason/packer.nvim")

    -- language server protocol
    use("neovim/nvim-lspconfig")

    -- color schemes
    use("Mofiqul/vscode.nvim")
end)
