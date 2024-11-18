{ pkgs, config, ... }:

let
  catppuccinMpvRepo = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "mpv";
    rev = "8d82ef42bde7cc7cc4fad7ce690aa90feab46f34";
    sha256 = "sha256-l5s9WTxNlI4glAYnbfPZ6K8O3knf5zzgDfOKwFxl/jQ=";
  };
in
{
  xdg.configFile."mpv/catppuccinMpvTheme.conf".source = "${catppuccinMpvRepo}/themes/mocha/mauve.conf";

  programs.mpv = {
    enable = true;
    config = {
      osc = false;
      include = "~/.config/mpv/catppuccinMpvTheme.conf";
      vo = "gpu";
      profile = "gpu-hq";
      force-window = true;
      ytdl-format = "bestvideo[height<=1080]+bestaudio";
    };
    bindings = {
      F       = "script-binding quality_menu/video_formats_toggle";
      "Alt+f" = "script-binding quality_menu/audio_formats_toggle";
    };
    scriptOpts = { };
    scripts = with pkgs.mpvScripts; [
      quality-menu
      mpris
      thumbnail

      # sponsorblock
    ];
  };
}

