{ lib, pkgs, config, ... }:

{
  home.file."Projects".source =
    config.lib.file.mkOutOfStoreSymlink /data/jayden/projects;
  home.file."Downloads/darkmx".source =
    config.lib.file.mkOutOfStoreSymlink /data/jayden/shares/darkmx;
  home.file."Downloads/fopnu".source =
    config.lib.file.mkOutOfStoreSymlink /data/jayden/shares/fopnu;
  home.file."Documents/Dionysus".source = config.lib.file.mkOutOfStoreSymlink
    /data/jayden/shares/vm-shares/Dionysus-Share;
}
