{ pkgs, ... }:

let
  tixati-custom = pkgs.callPackage ./custom/tixati-custom.nix { };
in
{
  home.packages = [
    tixati-custom
  ];
}
