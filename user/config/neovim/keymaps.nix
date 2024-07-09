{ ... }: let
  keymaps = {
    n = [
      { key = "<Space>"; action = "<Noop>"; }

      # File and directory browsing
      { key = "<Leader>e"; action = ":NvimTreeToggle<CR>"; }
      { key = "<Leader>o"; action = ":Oil<CR>"; }

      # Switch panes
      { key = "<C-h>"; action = "<C-w>h"; }
      { key = "<C-j>"; action = "<C-w>j"; }
      { key = "<C-k>"; action = "<C-w>k"; }
      { key = "<C-l>"; action = "<C-w>l"; }

      # LSP actions
      { key = "<Leader>la"; action = ":Lspsaga code_action<CR>"; }
      { key = "<Leader>ld"; action = ":Lspsaga show_line_diagnostics<CR>"; }
      { key = "<Leader>lh"; action = ":Lspsaga hover_doc<CR>"; }
      { key = "<Leader>lo"; action = ":Lspsaga outline<CR>"; }
      { key = "<Leader>lr"; action = ":Lspsaga rename<CR>"; }

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

      # t = Terminal
      { key = "<Leader>tt"; action = ":ToggleTerm<CR>"; }
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
