{ ... }: let
  keymaps = {
    n = [
      { key = "<Space>"; action = "<Noop>"; }

      # File and directory browsing
      { key = "<Leader>e"; action = ":Telescope file_browser<CR>"; }
      { key = "<Leader>o"; action = ":Oil<CR>"; }

      # Buffers
      { key = "<Leader>bc"; action = ":bd<CR>"; }
      { key = "<Leader>bb"; action = ":BufferLinePick<CR>"; }
      { key = "<Leader>bx"; action = ":BufferLinePickClose<CR>"; }
      { key = "<Leader>bn"; action = ":BufferLineCycleNext<CR>"; }
      { key = "<Leader>bp"; action = ":BufferLineCyclePrev<CR>"; }

      # LSP actions
      { key = "<Leader>."; action = ":Lspsaga code_action<CR>"; }
      { key = "<Leader>h"; action = ":Lspsaga hover_doc<CR>"; }
      { key = "<Leader>r"; action = ":Lspsaga rename<CR>"; }

      # Searching
      { key = "<Leader>fa"; action = ":Telescope live_grep<CR>"; }
      { key = "<Leader>fb"; action = ":Telescope buffers<CR>"; }
      { key = "<Leader>fd"; action = ":Telescope diagnostics<CR>"; }
      { key = "<Leader>ff"; action = ":Telescope find_files<CR>"; }
      { key = "<Leader>fh"; action = ":Telescope help_tags<CR>"; }
      { key = "<Leader>fi"; action = ":Telescope lsp_implementations<CR>"; }
      { key = "<Leader>fs"; action = ":Telescope lsp_workspace_symbols<CR>"; }

      # Go-to actions
      { key = "<Leader>gd"; action = ":lua vim.lsp.buf.definition()<CR>"; }
      { key = "<Leader>gr"; action = ":Telescope lsp_references<CR>"; }

      # Terminal
      { key = "<Leader>tt"; action = ":ToggleTerm<CR>"; }

      # Moving lines
      { key = "<A-j>"; action = ":m +1<CR>=="; }
      { key = "<A-k>"; action = ":m -2<CR>=="; }
    ];

    v = [
      { key = "<A-j>"; action = ":m '>+1<CR>gv=gv"; }
      { key = "<A-k>"; action = ":m '<-2<CR>gv=gv"; }
    ];

    i = [
      { key = "<C-Del>"; action = "<esc>ldwi"; }
    ];

    ic = [
      { key = "<C-BS>"; action = "<C-w>"; }
      { key = "<C-h>"; action = "<C-w>"; }
    ];

    t = [
      { key = "<C-j>"; action = "<cmd>ToggleTerm<CR>"; }
    ];
  };
in {
  programs.nixvim.keymaps =
    map (keymap: keymap // { mode = [ "n" ]; }) keymaps.n ++
    map (keymap: keymap // { mode = [ "v" ]; }) keymaps.v ++
    map (keymap: keymap // { mode = [ "i" ]; }) keymaps.i ++
    map (keymap: keymap // { mode = [ "t" ]; }) keymaps.t ++
    map (keymap: keymap // { mode = [ "i" "c" ]; }) keymaps.ic
  ;
}
