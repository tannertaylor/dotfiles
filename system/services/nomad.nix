{ config, lib, ... }: with lib; {
  services.nomad = mkIf config.homelab {
    enable = true;
    settings = {
      server = {
        enabled = true;
        bootstrap_expect = 1;
      };
      
      client = {
        enabled = true;
      };
    };
  };
}
