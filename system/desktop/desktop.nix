{ config, lib, ... }: with lib; {
  imports = [
    ./keyboard.nix
    ./sound.nix
    ./fonts.nix
  ];

  services = mkIf (!config.headless) {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };
}
