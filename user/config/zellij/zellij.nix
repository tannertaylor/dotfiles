{ ... }: {
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
  };

  xdg.configFile."zellij/config.kdl".text = ''
    theme "gruvbox-dark"
    
    ui {
      pane_frames {
        hide_session_name true
      }
    }

    keybinds {
      unbind "Ctrl h" "Ctrl n"

      shared { 
        bind "Ctrl d" { SwitchToMode "move"; }
        bind "Ctrl r" { SwitchToMode "resize"; }
      }
    }
  '';

  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
      pane size=1 borderless=true {
        plugin location="zellij:tab-bar"
      }

      pane

      pane size=1 borderless=true {
        plugin location="zellij:status-bar"
      }
    }
  '';
}
