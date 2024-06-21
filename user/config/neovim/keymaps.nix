{ ... }: let
  keymaps = {
    n = [
      { key = "<Space>"; action = "<Noop>"; }
      { key = "<Leader>e"; action = "<cmd>Telescope file_browser<CR>"; }
      { key = "<Leader>ff"; action = "<cmd>Telescope find_files<CR>"; }
      { key = "<Leader>fa"; action = "<cmd>Telescope live_grep<CR>"; }
    ];
  };
in {
  programs.nixvim.keymaps = map (keymap: keymap // { mode = [ "n" ]; }) keymaps.n;
}
