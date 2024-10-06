return {
  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()
      local actions = require("telescope.actions")

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<c-j>"] = actions.move_selection_next,
              ["<c-k>"] = actions.move_selection_previous,
            },
          },
        },
      })
    end
  }
}
