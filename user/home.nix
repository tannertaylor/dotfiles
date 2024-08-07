{ config, lib, ... }: {
  imports = [
    config/bash/bash.nix
    config/git/git.nix
    config/kitty/kitty.nix
    config/neovim/neovim.nix
    config/vivaldi/vivaldi.nix
    config/yazi/yazi.nix
    config/zellij/zellij.nix
  ];

  options = with lib.options; {
    headless = mkEnableOption "headless configuration";
    username = mkOption {
      type = lib.types.str;
      description = "my username";
    };
  };

  config = {
    home = {
      username = config.username;
      homeDirectory = "/home/${config.username}";
      stateVersion = "24.05";
    };
  };
}
