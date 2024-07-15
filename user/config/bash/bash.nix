{ ... }: {
  programs.bash = {
    enable = true;

    shellAliases = {
      ll = "ls -al";
      cl = "clear";
      dc = "docker compose";
      tf = "terraform";
      lg = "lazygit";
    };

    bashrcExtra = ''
      eval "$(starship init bash)"
      eval "$(zoxide init bash)"
      stty werase '^h' # Set ctrl+backspace (^h) to erase previous word in TTY settings.

      REPOS="$HOME/code"
      NIX_FLAKE_PATH="$REPOS/tannertaylor/dotfiles"

      function sys-rebuild() { sudo nixos-rebuild switch --flake "$NIX_FLAKE_PATH"; }
      function hm-rebuild() { home-manager switch --flake "$NIX_FLAKE_PATH" -b bak; }
    '';
  };
}
