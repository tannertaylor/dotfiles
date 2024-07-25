{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # File and File System Utilities
    yazi zoxide lsd bat rclone

    # Search Utilities
    fzf ripgrep

    # Networking Utilities
    wget speedtest-rs

    # Miscellaneous Utilities
    home-manager jq usbutils tldr htop thefuck

    # Shell
    kitty zellij starship

    # Productivity
    vivaldi logseq discord

    # Dev
    neovim git lazygit

    # Virtualization
    docker docker-compose

    # Desktop Environment / Window Manager
    kdePackages.kcalc kdePackages.bluedevil

    # Work
    slack remmina
  ];
}
