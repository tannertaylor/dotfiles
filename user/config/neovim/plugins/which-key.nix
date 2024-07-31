{ pkgs, ... }: let
  keymaps = [
    { key = "<leader>"; group = "Leader Commands"; }
    { key = "<leader>e"; action = ":NvimTreeToggle<cr>"; desc = "Toggle File Explorer"; }

    { key = "<leader>b"; group = "Buffer Commands"; }
    { key = "<leader>bc"; action = ":bd<cr>"; desc = "Close Current Buffer"; }
    { key = "<leader>bb"; action = ":BufferLinePick<cr>"; desc = "Choose Buffer"; }
    { key = "<leader>bx"; action = ":BufferLinePickClose<cr>"; desc = "Pick Buffer to Close"; }
    { key = "<leader>bn"; action = ":BufferLineCycleNext<cr>"; desc = "Move to Next Buffer"; }
    { key = "<leader>bp"; action = ":BufferLineCyclePrev<cr>"; desc = "Move to Previous Buffer"; }

    { key = "<leader>c"; group = "Comment Commands"; } # managed in comment.nix

    { key = "<leader>f"; group = "Find Commands"; }
    { key = "<leader>fa"; action = ":Telescope live_grep<cr>"; desc = "Find Everywhere"; }
    { key = "<leader>fb"; action = ":Telescope buffers<cr>"; desc = "Find Buffers"; }
    { key = "<leader>fd"; action = ":Telescope diagnostics<cr>"; desc = "Find Diagnostic"; }
    { key = "<leader>ff"; action = ":Telescope find_files<cr>"; desc = "Find Files"; }
    { key = "<leader>fh"; action = ":Telescope help_tags<cr>"; desc = "Find Help"; }
    { key = "<leader>fi"; action = ":Telescope lsp_implementations<cr>"; desc = "Find Implementations"; }
    { key = "<leader>fr"; action = ":Telescope lsp_references<cr>"; desc = "Find References"; }
    { key = "<leader>fs"; action = ":Telescope lsp_workspace_symbols<cr>"; desc = "Find Symbols"; }

    { key = "<leader>g"; group = "Go-To Commands"; }
    { key = "<leader>gd"; action = ":lua vim.lsp.buf.definition()<cr>"; desc = "Go to Definition"; }

    { key = "<leader>l"; group = "LSP Commands"; }
    { key = "<leader>la"; action = ":lua vim.lsp.buf.code_action()<cr>"; desc = "Quick Fix (Code Action)"; }
    { key = "<leader>ld"; action = ":lua vim.diagnostic.open_float()<cr>"; desc = "View Line Diagnostics"; }
    { key = "<leader>lh"; action = ":lua vim.lsp.buf.hover()<cr>"; desc = "View Documentation (Hover)"; }
    { key = "<leader>lr"; action = ":lua vim.lsp.buf.rename()<cr>"; desc = "Rename Symbol"; }
  ];

  keymapsLuaList = map (x:
    if x ? desc then ''["${x.key}"] = { "${x.action}", "${x.desc}" },''
    else if x ? group then ''["${x.key}"] = { name = "${x.group}" },''
    else ''["${x.key}"] = { "${x.action}" },''
  ) keymaps;

  keymapsLua = builtins.concatStringsSep "\n" keymapsLuaList;
in {
  package = pkgs.vimPlugins.which-key-nvim;
  setup = ''
    local wk = require('which-key')
    wk.setup({
      triggers = { "<leader>" },
      window = {
        border = "single",
      },
    })
    wk.register({
      ${keymapsLua}
    })
  '';
}
