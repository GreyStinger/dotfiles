{ config, ... }:

{
  programs.cava = {
    enable = true;
    settings = {
      general = {
        framerate = 60;
        bars = 0;
        bar_width = 2;
        bar_spacing = 1;
      };
      input = {
        method = "pipewire";
        source = "auto";
        sample_rate = 44100;
        sample_bits = 16;
      };
      output = {
        method = "ncurses";
        channels = "mono";
        mono_option = "average";
      };
      smoothing = {
        noise_reduction = 60;
        gravity = 100;
        integral = 0;
      };
      # background_opacity = 0.8;
      # color = {
      #   # foreground = "'#${config.colorScheme.palette.base06}'";
      #   # background = "'#${config.colorScheme.palette.base00}'";
      #   gradient = 1;
      #   gradient_count = 8;
      #   gradient_color_1 = "'#94e2d5'";
      #   gradient_color_2 = "'#89dceb'";
      #   gradient_color_3 = "'#74c7ec'";
      #   gradient_color_4 = "'#89b4fa'";
      #   gradient_color_5 = "'#cba6f7'";
      #   gradient_color_6 = "'#f5c2e7'";
      #   gradient_color_7 = "'#eba0ac'";
      #   gradient_color_8 = "'#f38ba8'";
      # };
      eq = {
        "1" = 1; # bass
        "2" = 1;
        "3" = 1; # midtone
        "4" = 1;
        "5" = 1; # treble
      };
    };
  };
}

