local groups = {
  { key = "<leader>", group = "Leader Commands" },
  { key = "<leader>b", group = "Buffer Commands" },
  { key = "<leader>c", group = "Comment Commands" },
  { key = "<leader>f", group = "Find Commands" },
  { key = "<leader>g", group = "Go-To Commands" },
  { key = "<leader>l", group = "LSP Commands" },
  { key = "<leader>t", group = "Terminal Commands" },
}

return {
  {
    "folke/which-key.nvim",
    commit = "8badb359f7ab8711e2575ef75dfe6fbbd87e4821",

    opts = {
      window = {
        border = "single",
      },
    },

    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.add(groups)
    end
  }
}
