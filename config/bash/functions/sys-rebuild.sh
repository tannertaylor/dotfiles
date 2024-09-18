function sys-rebuild() {
  sudo nixos-rebuild switch --flake "$NIXOS_FLAKE_PATH"
}
