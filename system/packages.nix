{ config, pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    # File and File System Utilities
    yazi zoxide lsd bat

    # Search Utilities
    fzf ripgrep

    # Networking Utilities
    wget speedtest-rs

    # Miscellaneous Utilities
    home-manager jq usbutils tldr htop thefuck

    # Shell
    kitty zellij starship

    # Dev
    neovim git lazygit gcc

    # Virtualization
    docker docker-compose

    # Work
    slack remmina
  ] ++ lib.lists.optionals (!config.headless) [
    # Productivity
    kitty vivaldi logseq discord

    # Desktop Environment / Window Manager
    kdePackages.kcalc kdePackages.bluedevil
  ] ++ lib.lists.optionals (config.hostname == "srv001") [
    rustdesk-server
  ];
}
