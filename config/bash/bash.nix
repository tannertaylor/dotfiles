{ config, ... }: {
  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "lsd";
      ll = "lsd -al";
      cl = "clear";
      dc = "docker compose";
      tf = "terraform";
      lg = "lazygit";
      cat = "bat";
      speedtest = "speedtest-rs";
    };

    bashrcExtra = let
      homeManagerFlake = if config.headless then "headless" else "personal";
      nixOSFlake = if config.headless then "$HOSTNAME" else "personal";
    in ''
      # Shell Setup
      eval "$(starship init bash)"
      eval "$(zoxide init bash)"
      eval "$(thefuck --alias)"
      stty werase '^h' # Set ctrl+backspace (^h) to erase previous word in TTY settings.

      # Env Vars
      EDITOR="nvim"
      REPOS="$HOME/code/tannertaylor"
      HM_FLAKE_PATH="$REPOS/dotfiles"
      NIXOS_FLAKE_PATH="$REPOS/nixos-config"
      DEVFLAKES="github:tannertaylor/devflakes"

      # Functions
      function sys-rebuild() { sudo nixos-rebuild switch --flake "$NIXOS_FLAKE_PATH#${nixOSFlake}"; }
      function hm-rebuild() { home-manager switch --flake "$HM_FLAKE_PATH#${homeManagerFlake}"; }

      function cd() {
        if [ -z "$@" ]; then
          builtin cd
        else
          zoxide add "$@" && builtin cd "$@"
        fi
      }
    '';
  };
}
