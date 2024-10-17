{...}:
{
  programs.dircolors = {
    enable = true;
    extraConfig = ''
      TERM alacritty
    '';
    settings = {
      ".iso" = "01;31"; # .iso files bold red like .zip and other archives
      ".gpg" = "01;33"; # .gpg files bold yellow
      # Images to non-bold magenta instead of bold magenta like videos
      ".bmp"   = "00;35";
      ".gif"   = "00;35";
      ".jpeg"  = "00;35";
      ".jpg"   = "00;35";
      ".mjpeg" = "00;35";
      ".mjpg"  = "00;35";
      ".mng"   = "00;35";
      ".pbm"   = "00;35";
      ".pcx"   = "00;35";
      ".pgm"   = "00;35";
      ".png"   = "00;35";
      ".ppm"   = "00;35";
      ".svg"   = "00;35";
      ".svgz"  = "00;35";
      ".tga"   = "00;35";
      ".tif"   = "00;35";
      ".tiff"  = "00;35";
      ".webp"  = "00;35";
      ".xbm"   = "00;35";
      ".xpm"   = "00;35";
    };
  };
}

