{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Utilities
    alacritty wget home-manager ripgrep

    # Shell
    starship

    # Productivity
    google-chrome

    # Dev
    neovim git lazygit

    # Virtualization
    docker docker-compose
  ];
}
