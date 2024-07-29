{ ... }: let
  keymaps = {
    n = [
      { key = "<Space>"; action = "<Noop>"; }
      
      # Misc.
      { # Show completion, even if I haven't started typing yet.
        key = "<Leader><Leader>";
        action = ":lua require('cmp').complete({ reason = require('cmp').ContextReason.Auto })<CR>";
      }

      # File and directory browsing
      { key = "<Leader>e"; action = ":NvimTreeToggle<CR>"; }

      # Switch panes
      { key = "<C-h>"; action = "<C-w>h"; }
      { key = "<C-j>"; action = "<C-w>j"; }
      { key = "<C-k>"; action = "<C-w>k"; }
      { key = "<C-l>"; action = "<C-w>l"; }

      # Moving lines
      { key = "<A-j>"; action = ":m +1<CR>=="; }
      { key = "<A-k>"; action = ":m -2<CR>=="; }

      # b = Buffer
      { key = "<Leader>bc"; action = ":bd<CR>"; }
      { key = "<Leader>bb"; action = ":BufferLinePick<CR>"; }
      { key = "<Leader>bx"; action = ":BufferLinePickClose<CR>"; }
      { key = "<Leader>bn"; action = ":BufferLineCycleNext<CR>"; }
      { key = "<Leader>bp"; action = ":BufferLineCyclePrev<CR>"; }

      # c = Comments | set in comment.nix

      # d = Debug

      # f = Find
      { key = "<Leader>fa"; action = ":Telescope live_grep<CR>"; }
      { key = "<Leader>fb"; action = ":Telescope buffers<CR>"; }
      { key = "<Leader>fd"; action = ":Telescope diagnostics<CR>"; }
      { key = "<Leader>ff"; action = ":Telescope find_files<CR>"; }
      { key = "<Leader>fh"; action = ":Telescope help_tags<CR>"; }
      { key = "<Leader>fi"; action = ":Telescope lsp_implementations<CR>"; }
      { key = "<Leader>fs"; action = ":Telescope lsp_workspace_symbols<CR>"; }

      # g = Go To
      { key = "<Leader>gd"; action = ":lua vim.lsp.buf.definition()<CR>"; }
      { key = "<Leader>gr"; action = ":Telescope lsp_references<CR>"; }

      # l = LSP actions
      { key = "<Leader>la"; action = ":lua vim.lsp.buf.code_action()<CR>"; }
      { key = "<Leader>ld"; action = ":lua vim.diagnostic.open_float()<CR>"; }
      { key = "<Leader>lh"; action = ":lua vim.lsp.buf.hover()<CR>"; }
      { key = "<Leader>lr"; action = ":lua vim.lsp.buf.rename()<CR>"; }
    ];

    v = [
      { key = "<A-j>"; action = ":m '>+1<CR>gv=gv"; }
      { key = "<A-k>"; action = ":m '<-2<CR>gv=gv"; }
    ];

    i = [
      { # Show completion, even if I haven't started typing yet.
        key = "<C-Space>";
        action = "<cmd>lua require('cmp').complete()<CR>";
      }

      { key = "<C-Del>"; action = "<esc>ldwi"; }
    ];

    ic = [
      { key = "<C-BS>"; action = "<C-w>"; }
      { key = "<C-h>"; action = "<C-w>"; }
    ];
  };
in {
  programs.nixvim.keymaps =
    map (keymap: keymap // { mode = [ "n" ]; }) keymaps.n ++
    map (keymap: keymap // { mode = [ "v" ]; }) keymaps.v ++
    map (keymap: keymap // { mode = [ "i" ]; }) keymaps.i ++
    map (keymap: keymap // { mode = [ "i" "c" ]; }) keymaps.ic
  ;
}
