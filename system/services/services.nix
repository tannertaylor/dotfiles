{ ... }: {
  imports = [
    ./virt.nix
  ];

  services.openssh.enable = true;
}
