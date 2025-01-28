{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./eww.nix
    ./firefox.nix
    ./ghostty.nix
    ./kitty.nix
    ./mpv.nix
    ./neovim.nix
    ./nixcord.nix
    ./qutebrowser.nix
    ./rofi.nix
    ./spicetify.nix
    ./vesktop.nix
    ./yt-dlp.nix
    ./zathura.nix
  ];

  home.packages = [
    (pkgs.callPackage ./custom/darkmx.nix { })
    (pkgs.callPackage ./custom/fopnu.nix { })
    (pkgs.callPackage ./custom/tixati.nix { })
  ];
}
