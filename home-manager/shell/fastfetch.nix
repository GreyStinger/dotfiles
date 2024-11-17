{ config, ... }:

{
  xdg.configFile."fastfetch/democracy_duck.jpg".source = ../assets/democracy_duck.jpg;

  # Kind of goofed but I don't have a better solution for in tmux as of yet
  programs.zsh.shellAliases = {
    tfetch = "kitty +kitten icat -n --engine magick --align=left --use-window-size 40,18,1380,1200 ${config.xdg.configHome}/fastfetch/democracy_duck.jpg | fastfetch --raw - --logo-width 40 --logo-height 19";
    ctfetch = "clear && tfetch";
  };
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "${config.xdg.configHome}/fastfetch/democracy_duck.jpg";
        type = "kitty";
        height = 18;
      };
      display = {
        separator = " : ";
      };
      modules = [
        "title"
        "separator"
        {
          type = "os";
          key = "󱄅  OS";
        }
        {
          type = "kernel";
          key = "  Kernel";
        }
        {
          type = "packages";
          key = "  Dependancies";
        }
        {
          type = "shell";
          key = "  Shell";
        }
        {
          type = "LM";
          key = "󱡓  Display Manager";
        }
        {
          type = "wm";
          key = "  Window Manager";
        }
        {
          type = "cpu";
          key = "  CPU";
        }
        {
          type = "memory";
          key = "  Memory";
        }
        {
          type = "disk";
          key = "  Disk (/)";
        }
        {
          type = "localip";
          key = "󰛵  Local IP";
        }
        "separator"
        {
          type = "Player";
          key = "󰥠  Media Player";
        }
        {
          type = "Media";
          key = "󰝚  Media";
        }
        "break"
        "colors"
      ];
    };
  };
}
