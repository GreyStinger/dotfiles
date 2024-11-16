{ pkgs, ... }:

let
  scripts = [ "tmux-nicklist-portable.pl" ];

  irssiScripts = pkgs.fetchFromGitHub {
    owner = "irssi";
    repo = "scripts.irssi.org";
    rev = "d78865e56871157a2f9af8caaf633a7f9598758f";
    sha256 = "sha256-BIsUwAgNu+Cu0o7Ie1wHJFrE1DFrMV9FsCtrUJ0wH1U=";
  };
  irssiMurfTheme = pkgs.fetchurl {
    url = "https://irssi-import.github.io/themes/murf.theme";
    sha256 = "sha256-Jf22JvFbBdZd265IxeW6eEQn3VkBVg+PCBWWldGCjMg=";
  };

  generateScriptLink = script: {
    ".irssi/scripts/${script}" = {
      source = "${irssiScripts}/scripts/${script}";
    };
  };
  scriptLinks =
    builtins.foldl' (acc: script: acc // generateScriptLink script) {} scripts;

  themeLink = { ".irssi/murf.theme" = { source = irssiMurfTheme; }; };
  irssiLinks = scriptLinks // themeLink;
in
{
  home.file = irssiLinks;

  programs.irssi = {
    enable = true;
    extraConfig = ''
      settings = {
        core = {
          real_name = "Jayden Andrews";
          user_name = "GreyStinger";
          nick = "Grey";
        };

        "fe-common/core" = {
          autolog = "yes";
          autocreate_windows = "yes";
        };

        "fe-common/msg" = {
          hilight_color = "8";
        };

        "fe-common/format" = {
          itemplstr = "yes";
        };

        "fe-common/dcc" = { download_path = "~/Downloads"; };

        lookandfeel = {
          theme = "murf";
        };

      };
    '';
  };
}
