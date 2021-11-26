require("plugins")
require("lsp")
require("options")
require("commands")
require("auto_commands")
require("keymap")
require("treesitter")

-- simple plugin "setups"
require("lualine").setup()
require("pears").setup(function(conf)
    conf.preset("tag_matching")
end)
