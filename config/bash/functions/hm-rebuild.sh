function hm-rebuild() {
  home-manager switch --flake "$HM_FLAKE_PATH"
}
