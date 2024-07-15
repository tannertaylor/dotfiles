{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Utilities
    wget home-manager ripgrep zoxide fzf jq usbutils yazi tldr lsd bat

    # Shell
    kitty zellij starship

    # Productivity
    firefox obsidian

    # Dev
    neovim git lazygit

    # Virtualization
    docker docker-compose

    # Desktop Environment / Window Manager
    kdePackages.kcalc

    # Work
    slack remmina
  ];
}
