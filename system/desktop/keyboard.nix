{ config, lib, ... }: with lib; mkIf (!config.headless) {
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "ctrl:nocaps";
}
