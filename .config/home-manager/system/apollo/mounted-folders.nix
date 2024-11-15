{ lib, pkgs, config, ... }:

let
  dataProjectsDirSrc  = "/data/jayden/projects";
  homeProjectsDirDest = "${config.home.homeDirectory}/Projects";
in
{
  home.activation.symlinkActivation = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ln -sf ${dataProjectsDirSrc} ${homeProjectsDirDest}
  '';
}
