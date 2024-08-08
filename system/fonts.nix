{ config, pkgs, lib, ... }: with lib; {
    fonts.packages = mkIf (!config.headless) (with pkgs; [
        (nerdfonts.override { fonts = [ "SpaceMono" ]; })
    ]);
}
