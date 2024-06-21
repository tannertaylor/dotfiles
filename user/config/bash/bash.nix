{ ... }: {
  programs.bash = {
    enable = true;

    shellAliases = {
      ll = "ls -al";
      cl = "clear";
      dc = "docker compose";
      tf = "terraform";
    };

    bashrcExtra = "eval $(starship init bash)";
  };
}
