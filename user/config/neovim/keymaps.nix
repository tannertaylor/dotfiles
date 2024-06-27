{ ... }: let
  keymaps = {
    n = [
      { key = "<Space>"; action = "<Noop>"; }
      { key = "<Leader>e"; action = ":Telescope file_browser<CR>"; }
      { key = "<Leader>ff"; action = ":Telescope find_files<CR>"; }
      { key = "<Leader>fa"; action = ":Telescope live_grep<CR>"; }
      { key = "<Leader>tt"; action = ":ToggleTerm<CR>"; }
      { key = "<Leader>o"; action = ":Oil<CR>"; }
      { key = "<A-j>"; action = ":m +1<CR>=="; }
      { key = "<A-k>"; action = ":m -2<CR>=="; }
    ];

    v = [
      { key = "<A-j>"; action = ":m '>+1<CR>gv=gv"; }
      { key = "<A-k>"; action = ":m '<-2<CR>gv=gv"; }
    ];

    i = [
      { key = "<C-BS>"; action = "<C-w>"; }
      { key = "<C-h>"; action = "<C-w>"; }
    ];

    t = [
      { key = "<C-j>"; action = ":ToggleTerm<CR>"; }
    ];
  };
in {
  programs.nixvim.keymaps =
    map (keymap: keymap // { mode = [ "n" ]; }) keymaps.n ++
    map (keymap: keymap // { mode = [ "v" ]; }) keymaps.v ++
    map (keymap: keymap // { mode = [ "i" ]; }) keymaps.i ++
    map (keymap: keymap // { mode = [ "t" ]; }) keymaps.t
  ;
}
