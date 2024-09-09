{ ... }: {
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
  };

  xdg.configFile."zellij/config.kdl".text = ''
    theme "ayu"

    themes {
      ayu {
        fg "#BFBDB6"
        bg "#0D1017"
        black "#0B0E14"
        red "#F07178"
        green "#7FD962"
        yellow "#E6B673"
        blue "#59C2FF"
        magenta "#D2A6FF"
        cyan "#95E6CB"
        white "#BFBDB6"
        orange "#F29668"
      }
    }
    
    ui {
      pane_frames {
        hide_session_name true
      }
    }

    keybinds {
      unbind "Ctrl n" "Ctrl h"

      shared_except "locked" { 
        bind "Ctrl w" { SwitchToMode "move"; }
        bind "Ctrl r" { SwitchToMode "resize"; }
      }

      shared_except "locked" "normal" {
        bind "Ctrl c" { SwitchToMode "normal"; }
      }

      tab {
        bind "Ctrl h" { MoveTab "Left"; }
        bind "Ctrl l" { MoveTab "Right"; }
      }
    }
  '';

  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
      default_tab_template {
        pane size=1 borderless=true {
          plugin location="zellij:tab-bar"
        }

        children

        pane size=1 borderless=true {
          plugin location="zellij:status-bar"
        }
      }

      swap_tiled_layout name="basic" {
        tab split_direction="vertical" {
          pane size="65%"
          pane split_direction="horizontal" { children; }
        }
      }

      swap_tiled_layout name="dev" {
        tab split_direction="vertical" {
          pane size="75%" {
            pane size="75%"
            pane stacked=true { children; }
          }
          pane
        }
      }

      swap_floating_layout name="staggered" {
        floating_panes
      }
    }
  '';
}
