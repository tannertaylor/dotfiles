{ ... }: {
  imports = [
    ./virt.nix
    ./rustdesk-server.nix
    ./nomad.nix
  ];

  services.openssh.enable = true;
}
