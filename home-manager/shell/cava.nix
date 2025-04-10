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

