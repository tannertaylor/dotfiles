{ ... }: {
  programs.git = {
    enable = true;
    userName = "Tanner Taylor";
    userEmail = "tanner@tannertaylor.dev";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
