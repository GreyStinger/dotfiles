{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload = [ "~/.config/wallpapers/farewell.jpg" ];
      wallpaper = [ ", ~/.config/wallpapers/farewell.jpg" ];
    };
  };
}
