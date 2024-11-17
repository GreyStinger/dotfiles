{ lib, pkgs, config, ... }:

{
  home.file."Projects".source =
    config.lib.file.mkOutOfStoreSymlink /data/jayden/projects;
  home.file."darkmx".source =
    config.lib.file.mkOutOfStoreSymlink /data/jayden/shares/darkmx;
  home.file."fopnu".source =
    config.lib.file.mkOutOfStoreSymlink /data/jayden/shares/fopnu;
}
