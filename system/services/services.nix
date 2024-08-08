{ ... }: {
  imports = [
    ./virt.nix
    ./rustdesk-server.nix
  ];

  services.openssh.enable = true;
}
