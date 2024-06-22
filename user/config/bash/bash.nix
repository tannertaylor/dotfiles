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
      eval $(starship init bash)
      stty werase '^h' # Set ctrl+backspace (^h) to erase previous word in TTY settings.
    '';
  };
}
