{ pkgs, ... }:

let
  catppuccinKittyRepo = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "kitty";
    rev = "b14e8385c827f2d41660b71c7fec1e92bdcf2676";
    sha256 = "1h9zqc6gcz9rpn7p6ir3jy9glnj336jdcz5ildagd0fm5kn8vlz7";
  };
in
{
  home.file.".config/kitty/catppuccin-mocha.conf".source = "${catppuccinKittyRepo}/themes/mocha.conf";

  programs.kitty = {
    enable = true;
    font = { name = "JetBrains Mono"; };
    keybindings = {
      # Rebinds for tmux
      "alt+left"         = "previous_tab";
      "alt+right"        = "next_tab";
      "ctrl+shift+left"  = "no_op";
      "ctrl+shift+right" = "no_op";
    };
    settings = {
      include               = "catppuccin-mocha.conf";
      bold_font             = "auto";
      italic_font           = "auto";
      bold_italic_font      = "auto";
      font_size             = 11;
      window_padding_width  = 2;
      enable_ligatures      = false;
      enable_audio_bell     = "no";
      visual_bell           = true;
      scrollback_lines      = 8000;
      scrollback_pager      = "less";
      gpu_renderer          = "auto";
      repaint_delay         = 10;
    };
  };
}
