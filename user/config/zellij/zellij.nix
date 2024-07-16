{ ... }: {
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
  };

  xdg.configFile."zellij/config.kdl".text = ''
    theme "gruvbox-dark"
    hide_session_name true

    keybinds {
      unbind "Ctrl h" "Ctrl n"

      shared { 
        bind "Ctrl d" { SwitchToMode "move"; }
        bind "Ctrl r" { SwitchToMode "resize"; }
      }
    }
  '';
}
