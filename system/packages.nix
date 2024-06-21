{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    git
    wget
    alacritty
    google-chrome
    home-manager
    lazygit
    dotnet-sdk_8
    omnisharp-roslyn
    starship
    docker
    docker-compose
    ripgrep
  ];
}
