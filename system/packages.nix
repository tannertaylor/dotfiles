{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Utilities
    wget home-manager ripgrep zoxide fzf jq usbutils ranger

    # Shell
    kitty tmux starship

    # Productivity
    firefox

    # Dev
    neovim git lazygit

    # Virtualization
    docker docker-compose

    # Desktop
    kdePackages.kcalc remmina

    # Work
    slack
  ];
}
