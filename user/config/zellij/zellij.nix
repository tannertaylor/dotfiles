{ ... }: {
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      theme = "gruvbox-dark";
    };
  };
}
