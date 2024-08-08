{ lib, username, ... }: {
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
    headless = mkEnableOption "Headless Configuration";
  };

  config = {
    home = {
      username = username;
      homeDirectory = "/home/${username}";
      stateVersion = "24.05";
    };
  };
}
