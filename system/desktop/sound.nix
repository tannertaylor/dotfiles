{ config, lib, ... }: with lib; {
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = !config.headless;
  services.pipewire = mkIf (!config.headless) {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}

# hardware.pulseaudio.enable = false;
# security.rtkit.enable = true;
# services.pipewire = {
#   enable = true;
#   alsa.enable = true;
#   alsa.support32Bit = true;
#   pulse.enable = true;
# };
