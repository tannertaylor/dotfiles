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
      unbind "Ctrl n" "Ctrl h"

      shared { 
        bind "Ctrl d" { SwitchToMode "move"; }
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

      swap_floating_layout name="basic" {
        floating_panes max_panes=1 {
          pane { x "10%"; y "10%"; width "80%"; height "80%"; }
        }

        floating_panes max_panes=10 {
          pane { x "5%"; y 1; width "90%"; height "90%"; }
          pane { x "5%"; y 2; width "90%"; height "90%"; }
          pane { x "5%"; y 3; width "90%"; height "90%"; }
          pane { x "5%"; y 4; width "90%"; height "90%"; }
          pane { x "5%"; y 5; width "90%"; height "90%"; }
          pane { x "5%"; y 6; width "90%"; height "90%"; }
          pane { x "5%"; y 7; width "90%"; height "90%"; }
          pane { x "5%"; y 8; width "90%"; height "90%"; }
          pane { x "5%"; y 9; width "90%"; height "90%"; }
          pane focus=true { x "5%"; y 10; width "90%"; height "90%"; }
        }
      }

      swap_floating_layout name="staggered" {
        floating_panes
      }
    }
  '';
}
