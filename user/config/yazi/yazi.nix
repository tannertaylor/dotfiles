{ pkgs, lib, ... }: {
  programs.yazi = {
    enable = true;

    settings = {
      manager = {
        show_hidden = true;
      };

      opener = {
        edit = [
          { run = let script = "nvim-yazi-wrapper"; in "${lib.attrsets.getBin pkgs.writeShellScriptBin script ''
            if [ -z $NVIM_REMOTE ]; then
              nvim "$@"
            else
              nvim --server "$NVIM_REMOTE" --remote "$@"
            fi
          ''}/bin/${script} $@"; desc = "Neovim"; block = true; }
        ];
      };

      open = {
        rules = [
          { mime = "*"; use = "edit";  }
        ];
      };
    };
  };
}
