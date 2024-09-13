{ pkgs, ... }: with pkgs; {
  package = vimPlugins.FTerm-nvim;

  setup = ''
    -- require("FTerm").setup()
  '';
}
