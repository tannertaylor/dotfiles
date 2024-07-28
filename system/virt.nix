{ pkgs, ... }: {
  # Docker
  virtualisation.docker.enable = true;

  # libvirtd
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [
    swtpm # TPM emulator for Windows 11 VM
  ];
}
