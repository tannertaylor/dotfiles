return {
  {
    "nvim-telescope/telescope.nvim",
    commit = "dc6fc321a5ba076697cca89c9d7ea43153276d81",

    dependencies = {
      {
        "nvim-lua/plenary.nvim",
        commit = "2d9b06177a975543726ce5c73fca176cedbffe9d",
      }
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
