{ pkgs, ... }:

{
  home.file = {
    ".config/rofi/images/launcher.png".source = ./rofi/images/launcher.png;
    ".config/rofi/images/power.png".source = ./rofi/images/power.png;
    ".config/rofi/scripts/launcher".source = ./rofi/scripts/launcher;
    ".config/rofi/scripts/power".source = ./rofi/scripts/power;
    ".config/rofi/settings/launcher.rasi".source = ./rofi/settings/launcher.rasi;
    ".config/rofi/settings/powermenu.rasi".source = ./rofi/settings/powermenu.rasi;
  };

  home.packages = with pkgs; [ rofi ];
}
