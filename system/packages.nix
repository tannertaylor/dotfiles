{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # File and File System Utilities
    yazi zoxide lsd bat

    # Search Utilities
    fzf ripgrep

    # Networking Utilities
    wget speedtest-rs

    # Miscellaneous Utilities
    home-manager jq usbutils tldr 

    # Shell
    kitty zellij starship

    # Productivity
    firefox obsidian

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
