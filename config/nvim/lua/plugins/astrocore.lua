-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- vim options can be configured here
    options = {
      opt = {
        shell = "/usr/bin/zsh"
        wrap = true,
        breakindent = true,
        breakindentopt = {
          shift = 2,
          sbr = true,
        },
        showbreak = ">>",
      },
    },
    mappings = {
      n = {
        ["<Leader><Tab>"] = {
          "<cmd>bnext<CR>",
          desc = "Next tab",
        },
        ["<Leader><BS>"] = {
          "<cmd>bprevious<CR>",
          desc = "Previous tab",
        },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
