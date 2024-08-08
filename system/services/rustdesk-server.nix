{ config, lib, pkgs, ... }: with lib; {
  options = with options; {
    services.rustdesk-server.signal = {
      enable = mkEnableOption "rustdesk signal server";
    };
  };

  config = mkIf config.services.rustdesk-server.signal.enable {
    environment.systemPackages = [ pkgs.rustdesk-server ];

    # based on https://github.com/rustdesk/rustdesk-server/blob/1.1.11-1/systemd/rustdesk-hbbs.service
    systemd.services.rustdesk-signal-server = {
      description = "rustdesk signal server";
      serviceConfig = {
        Type = "simple";
        LimitNOFILE = "1000000";
        ExecStart = attrsets.getBin pkgs.rustdesk-server;
        WorkingDirectory = "/var/lib/rustdesk-server";
        Restart = "always";
        StandardOutput = "append:/var/log/rustdesk-server/hbbs.log";
        StandardError = "append:/var/log/rustdesk-server/hbbs.error";
      };
      wantedBy = [ "multi-user.target" ];
    };
  };
}
