{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload = [
        "~/.config/wallpapers/farewell.jpg"
        "~/.config/wallpapers/bikini_bottom.jpg"
        "~/.config/wallpapers/you_challenge_me.jpg"
        "~/.config/wallpapers/in_my_way.jpg"
      ];
      wallpaper = [ ", ~/.config/wallpapers/in_my_way.jpg" ];
    };
  };
}
