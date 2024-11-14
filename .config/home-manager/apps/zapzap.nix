{ config, pkgs, ... }:

let
  zapzap-custom = import ./custom/zapzap-custom.nix {
    inherit (pkgs) lib fetchFromGitHub python3Packages qt6;
  };
in
{
  home.packages = [
    zapzap-custom
  ];
}
