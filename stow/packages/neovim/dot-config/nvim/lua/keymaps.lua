local keymaps = {
  n = {
    -- root: Core Commands
    {
      key = "<leader>e",
      action = function() tt.term.open_yazi() end,
      desc = "Toggle File Explorer",
    },

    -- b: Buffer Commands
    {
      key = "<leader>bb",
      action = ":BufferLinePick<cr>",
      desc = "Choose Buffer",
    },
    {
      key = "<leader>bc",
      action = ":bd<cr>",
      desc = "Close Current Buffer",
    },
    {
      key = "<leader>bn",
      action = ":BufferLineCycleNext<cr>",
      desc = "Move to Next Buffer",
    },
    {
      key = "<leader>bp",
      action = ":BufferLineCyclePrev<cr>",
      desc = "Move to Previous Buffer",
    },
    {
      key = "<leader>bx",
      action = ":BufferLinePickClose<cr>",
      desc = "Choose Buffer to Close",
    },

    -- f: Find Commands
    {
      key = "<leader>fa",
      action = ":Telescope live_grep<cr>",
      desc = "Find Everywhere",
    },
    {
      key = "<leader>fb",
      action = ":Telescope buffers<cr>",
      desc = "Find Buffers",
    },
    {
      key = "<leader>fd",
      action = ":Telescope diagnostics<cr>",
      desc = "Find Diagnostics",
    },
    {
      key = "<leader>fe",
      action = function()
        require("telescope.builtin").diagnostics({
          severity = "error",
        })
      end,
      desc = "Find Errors",
    },
    {
      key = "<leader>ff",
      action = ":Telescope find_files<cr>",
      desc = "Find Files",
    },
    {
      key = "<leader>fh",
      action = ":Telescope help_tags<cr>",
      desc = "Find Help",
    },
    {
      key = "<leader>fi",
      action = ":Telescope lsp_implementations<cr>",
      desc = "Find Implementations",
    },
    {
      key = "<leader>fr",
      action = ":Telescope lsp_references<cr>",
      desc = "Find References",
    },
    {
      key = "<leader>fs",
      action = ":Telescope lsp_workspace_symbols<cr>",
      desc = "Find Symbols",
    },

    -- g: Go-To Commands
    {
      key = "<leader>gd",
      action = function() vim.lsp.buf.definition() end,
      desc = "Go To Definition",
    },

    -- LSP Commands
    {
      key = "<leader>la",
      action = function() vim.lsp.buf.code_action() end,
      desc = "Quick Fix (Code Actions)",
    },
    {
      key = "<leader>ld",
      action = function() vim.diagnostic.open_float() end,
      desc = "View Line Diagnostics",
    },
    {
      key = "<leader>lh",
      action = function() vim.lsp.buf.hover() end,
      desc = "View Documentation (Hover)",
    },
    {
      key = "<leader>lr",
      action = function() vim.lsp.buf.rename() end,
      desc = "Rename Symbol",
    },
    {
      key = "<leader>lR",
      action = function() vim.lsp.buf.references() end,
      desc = "View References Window",
    },

    -- t: Terminal Commands
    {
      key = "<leader>tg",
      action = function() tt.term.terminals.lazygit:open() end,
      desc = "Open LazyGit",
    },
    {
      key = "<leader>tt",
      action = function() tt.term.terminals.main:open() end,
      desc = "Open Terminal"
    },
  },

  i = {
    {
      key = "<c-space>",
      action = function() require("cmp").complete() end,
      desc = "Show Completion Menu",
    }
  },

  ict = {
    {
      key = "<c-bs>",
      action = "<c-w>",
      desc = "Delete Previous Word (Backspace)",
    },
    {
      key = "<c-h>",
      action = "<c-w>",
      desc = "Delete previous Word (^H)",
    }
  },

  t = {
    {
      key = "<c-c><c-c>",
      action = function() tt.term.close_all() end,
      desc = "Close Terminals",
    }
  },
}

for modeStr, mappings in pairs(keymaps) do
  local modes = tt.utils.split_string_to_chars(modeStr)
  for _, mapping in ipairs(mappings) do
    vim.keymap.set(modes, mapping.key, mapping.action, {
      desc = mapping.desc,
    })
  end
end
