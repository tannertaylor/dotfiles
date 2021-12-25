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
    use("williamboman/nvim-lsp-installer")

    -- completion engine
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/vim-vsnip")

    -- advanced highlighting
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    })

    -- fuzzy finder
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } }
    })

    -- debugging
    use("puremourning/vimspector")

    -- color schemes
    use("Mofiqul/vscode.nvim")
    use("lunarvim/colorschemes")

    -- prompt
    use("nvim-lualine/lualine.nvim")

    -- auto pair plugins
    use("steelsojka/pears.nvim")
    use("alvan/vim-closetag")

    -- file explorer plugin
    use("kyazdani42/nvim-tree.lua")
    use("kyazdani42/nvim-web-devicons")
end)

require("plugins.treesitter")
require("plugins.lualine")
require("plugins.nvim-tree")
