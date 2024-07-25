{ username, ... }: {
  imports = [
    config/alacritty/alacritty.nix
    config/bash/bash.nix
    config/git/git.nix
    config/gtk/gtk.nix
    config/kitty/kitty.nix
    config/neovim/neovim.nix
    config/virt-manager/virt-manager.nix
    config/vivaldi/vivaldi.nix
    config/yazi/yazi.nix
    config/zellij/zellij.nix
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };
}
