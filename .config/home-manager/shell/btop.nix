{ pkgs, ... }:

let
  btopCatppuccinTheme = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "btop";
    rev = "f437574b600f1c6d932627050b15ff5153b58fa3";
    sha256 = "1rwpsb252mb6kjgai47ns0ssd7xh7zbpbvanz6p62g8m4z0rjhcq";
  };
in
{
  home.packages = [ btopCatppuccinTheme ];

  home.file.".config/btop/themes/catppuccin-mocha.theme".source = "${btopCatppuccinTheme}/catppuccin-mocha.theme";

  programs.btop = {
    enable = true;
    package = pkgs.btop.override { cudaSupport = true; };
    settings = {
      color_theme = "catppuccin-mocha";
      theme_background = false;
      vim_keys = true;
      proc_sorting = "memory";
      rounded_corners = false;
    };
  };
}

