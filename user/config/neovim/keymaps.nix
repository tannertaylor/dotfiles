{ ... }: let
  keymaps = {
    n = [
      { key = "<Space>"; action = "<Noop>"; }
      { key = "<Leader>e"; action = "<cmd>Telescope file_browser<CR>"; }
      { key = "<Leader>ff"; action = "<cmd>Telescope find_files<CR>"; }
      { key = "<Leader>fa"; action = "<cmd>Telescope live_grep<CR>"; }
      { key = "<Leader>tt"; action = "<cmd>ToggleTerm<CR>"; }
      { key = "<Leader>o"; action = "<cmd>Oil<CR>"; }
    ];

    i = [
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
    map (keymap: keymap // { mode = [ "i" ]; }) keymaps.i ++
    map (keymap: keymap // { mode = [ "t" ]; }) keymaps.t
  ;
}
