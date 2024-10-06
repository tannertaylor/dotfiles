{ config, pkgs, lib, ... }: {
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

      # Collect all function script files
      funcScripts = [
        ./functions/cd.sh
        ./functions/hm-rebuild.sh
        ./functions/sys-rebuild.sh
      ];

      functions = map (file: builtins.readFile file) funcScripts;
    in ''
      # Shell Setup
      eval "$(zoxide init bash)"
      stty werase '^h' # Set ctrl+backspace (^h) to erase previous word in TTY settings.

      # Load Nix
      source /home/tanner/.nix-profile/etc/profile.d/nix.sh

      # Env Vars
      EDITOR="nvim"
      PATH="$PATH:/home/tanner/.dotnet/tools:/home/tanner/.cargo/bin"
      REPOS="$HOME/code/tannertaylor"
      HM_FLAKE_PATH="$REPOS/dotfiles#${homeManagerFlake}"
      NIXOS_FLAKE_PATH="$REPOS/nixos-config#$HOSTNAME"

      # Functions
      ${lib.concatStrings (lib.intersperse "\n" functions)}
    '';
  };
}
