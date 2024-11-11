{ pkgs, ... }:

let
  catppuccinXresourcesRepo = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "xresources";
    rev = "41afcd788311ea2fce124029d9a02e2d65e0b3e6";
    sha256 = "0mn88af5y8z4riasg045q1xqfblcqv0f56j9fmy8c6f3k1nmzv7m";
  };
in
{
    home.file.".Xresources".source = "${catppuccinXresourcesRepo}/themes/mocha.Xresources";
}
