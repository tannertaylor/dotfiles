{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Utilities
    wget home-manager ripgrep

    # Shell
    kitty alacritty starship

    # Productivity
    google-chrome

    # Dev
    neovim git lazygit

    # Virtualization
    docker docker-compose
  ];
}
