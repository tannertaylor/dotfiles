{ config, lib, ... }: with lib; {
  services = mkIf (!config.headless) {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };
}
