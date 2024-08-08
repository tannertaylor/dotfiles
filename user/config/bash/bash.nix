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
      nixOSFlake = if config.headless then "headless" else "personal";
    in ''
      # Shell Setup
      eval "$(starship init bash)"
      eval "$(zoxide init bash)"
      eval "$(thefuck --alias)"
      stty werase '^h' # Set ctrl+backspace (^h) to erase previous word in TTY settings.

      # Env Vars
      EDITOR="nvim"
      REPOS="$HOME/code"
      NIX_FLAKE_PATH="$REPOS/tannertaylor/dotfiles"

      # Functions
      function sys-rebuild() { sudo nixos-rebuild switch --flake "$NIX_FLAKE_PATH#${nixOSFlake}"; }
      function hm-rebuild() { home-manager switch --flake "$NIX_FLAKE_PATH#${homeManagerFlake}"; }

      function cd() { zoxide add "$@" && builtin cd "$@"; }
    '';
  };
}
