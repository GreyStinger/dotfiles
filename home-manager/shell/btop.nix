{ pkgs, ... }:

let
  btopCatppuccinTheme = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "btop";
    rev = "f437574b600f1c6d932627050b15ff5153b58fa3";
    sha256 = "1rwpsb252mb6kjgai47ns0ssd7xh7zbpbvanz6p62g8m4z0rjhcq";
  };
  theme = "catppuccin-mocha";
in
{
  home.packages = [ btopCatppuccinTheme ];

  xdg.configFile."btop/themes/${theme}.theme".source = "${btopCatppuccinTheme}/${theme}.theme";

  programs.btop = {
    enable = true;
    package = pkgs.btop.override { cudaSupport = true; };
    settings = {
      color_theme = theme;
      theme_background = false;
      vim_keys = true;
      proc_sorting = "memory";
      rounded_corners = false;
    };
  };
}

