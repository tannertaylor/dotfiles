{ username, ... }: {
  imports = [
    config/alacritty/alacritty.nix
    config/bash/bash.nix
    config/git/git.nix
    config/kitty/kitty.nix
    config/neovim/neovim.nix
    config/tmux/tmux.nix
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };
}
