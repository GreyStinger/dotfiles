{ pkgs, ... }:

let
  lazer = pkgs.osu-lazer-bin;
in {
  home.packages = [
    lazer
  ];
}
