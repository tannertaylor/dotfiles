-- make sure packer is installed
local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. packer_path)
end

-- plugin configuration
require("packer").startup(function(use)
    -- have packer update itself
    use("wbthomason/packer.nvim")

    -- language server protocol and install
    use("neovim/nvim-lspconfig")
    use("kabouzeid/nvim-lspinstall")

    -- completion engine
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/vim-vsnip")

    -- fuzzy finder
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } }
    })

    -- color schemes
    use("Mofiqul/vscode.nvim")

    -- prompt
    use("nvim-lualine/lualine.nvim")

    -- auto pair plugin
    use("steelsojka/pears.nvim")

    -- file explorer plugin
    use("preservim/nerdtree")
end)