{ ... }:
 {
  programs.alacritty = {
    enable = true;

    settings = {
      live_config_reload = true;
      colors = {
        bright = {
          black   = "#50545B";
          blue    = "#6CB8F9";
          cyan    = "#5FC0CC";
          green   = "#A2CD83";
          magenta = "#D282E7";
          red     = "#EA757E";
          white   = "#B5BCC9";
          yellow  = "#EFCA84";
        };
        normal = {
          black   = "#32363D";
          blue    = "#62AEEF";
          cyan    = "#55B6C2";
          green   = "#98C379";
          magenta = "#C778DD";
          red     = "#E06B74";
          white   = "#ABB2BF";
          yellow  = "#E5C07A";
        };
        primary = {
          background = "#1E2128";
          foreground = "#ABB2BF";
        };
      };

      font = {
        size = 11;
        bold.family        = "JetBrainsMono Nerd Font";
        bold_italic.family = "JetBrainsMono Nerd Font";
        italic.family      = "JetBrainsMono Nerd Font";
        normal.family      = "JetBrainsMono Nerd Font";
      };

      cursor = {
        unfocused_hollow = false;
        style = {
          blinking = "On";
          shape = "Block";
        };
      };

      env = {
        TERM = "xterm-256color";
        WINIT_X11_SCALE_FACTOR = "1.0";
      };

      window = {
        decorations = "full";
        dynamic_title = true;
        opacity = 1;
        startup_mode = "Windowed";
      };

      window = {
        dimensions = {
          columns = 82;
          lines = 24;
        };
        padding = {
          x = 4;
          y = 6;
        };
      };
    };
  };
}

