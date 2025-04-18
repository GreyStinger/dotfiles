{ pkgs, ... }:

{
  programs.btop = {
    enable = true;
    package = pkgs.btop.override { cudaSupport = true; };
    settings = {
      theme_background = false;
      vim_keys = true;
      proc_sorting = "memory";
      rounded_corners = false;
    };
  };
}

