{ config, lib, ... }: with lib; {
  programs.kitty = mkIf (!config.headless) {
    enable = true;
    font.name = "SpaceMono Nerd Font Regular";
    theme = "Ayu";
  };
}
