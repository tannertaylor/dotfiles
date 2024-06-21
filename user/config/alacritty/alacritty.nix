{ ... }: let
  mkFont = style: { 
    family = "SpaceMono Nerd Font Mono";
    style = style;
  };
in {
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    live_config_reload = true;
    window.opacity = 0.85;

    font = {
      normal = mkFont "Regular";
      bold = mkFont "Bold";
      italic = mkFont "Italic";
      bold_italic = mkFont "BoldItalic";
      size = 10;
    };

    keyboard.bindings = [
      {
        key = "Backspace";
	mods = "Control";
	chars = "\\u0017";
      }
    ];
  };
}
