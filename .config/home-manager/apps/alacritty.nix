{ pkgs, ... }:

let
  alacrittyCatppuccinTheme = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "alacritty";
    rev = "f6cb5a5c2b404cdaceaff193b9c52317f62c62f7";
    sha256 = "1r2z223hza63v5lmzlg3022mlar67j3a2gh41rsaiqwja2wyiihz";
  };
  themeName = "catppuccin-mocha";
in
{
  home.file.".config/alacritty/${themeName}.toml".source = "${alacrittyCatppuccinTheme}/${themeName}.toml";

  programs.alacritty = {
    enable = true;

    settings = {
      live_config_reload = true;
      import = [ "~/.config/alacritty/${themeName}.toml" ];

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

