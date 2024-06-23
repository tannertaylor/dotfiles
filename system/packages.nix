{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Utilities
    wget home-manager ripgrep kdePackages.kcalc

    # Shell
    kitty tmux starship

    # Productivity
    firefox

    # Dev
    neovim git lazygit

    # Virtualization
    docker docker-compose
  ];
}
