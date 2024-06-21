{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Utilities
    alacritty wget home-manager ripgrep

    # Shell
    starship

    # Productivity
    google-chrome

    # Dev
    neovim git lazygit dotnet-sdk_8

    # Virtualization
    docker docker-compose

    # Language Servers
    omnisharp-roslyn # C#
    nil # Nix
  ];
}
