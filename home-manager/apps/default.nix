{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./firefox.nix
    ./kitty.nix
    ./mpv.nix
    ./neovim.nix
    ./nixcord.nix
    ./qutebrowser.nix
    ./spicetify.nix
    ./yt-dlp.nix
    ./zathura.nix
  ];

  home.packages = [
    (pkgs.callPackage ./custom/zapzap.nix {})
    (pkgs.callPackage ./custom/darkmx.nix {})
    (pkgs.callPackage ./custom/fopnu.nix {})
    (pkgs.callPackage ./custom/tixati.nix {})
  ];
}
