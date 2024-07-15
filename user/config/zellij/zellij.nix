{ ... }: {
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      theme = "gruvbox-dark";
      hide_session_name = true;
    };
  };
}
