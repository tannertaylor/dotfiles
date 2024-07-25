{ ... }: {
  # Docker
  virtualisation.docker.enable = true;

  # KVM
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
