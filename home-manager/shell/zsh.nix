{ config, ... }:

let
  generic-rclone-args =
    "--buffer-size=32M --vfs-cache-max-age=24h --vfs-cache-mode=full --vfs-read-chunk-size=128M --vfs-read-chunk-size-limit=off --vfs-cache-max-size=10G";
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      l = "ls -h";
      ll = "ls -lh";
      la = "ls -lAh";
      lm = "ls -m";
      update = "home-manager switch --impure";
      sys-update = "sudo nixos-rebuild switch --flake /etc/nixos#default";
      set-multimon =
        "feh --bg-fill ~/.config/xinit/bg0.jpg --bg-fill ~/.config/xinit/bg2.png";
      rclone-mount-gdrive =
        "rclone mount ${generic-rclone-args} gdrive: ~/gdrive -vv";
      rclone-mount-crypt =
        "rclone mount ${generic-rclone-args} gdrive-crypt: ~/gdrive-crypt -vv";
      kta = "bash ~/.config/home-manager/shell/scripts/attach_tmux_in_kitty.sh";
    };
    completionInit = ''
      #compdef open-webui

      _open_webui_completion() {
        eval $(env _TYPER_COMPLETE_ARGS="$\{words[1,$CURRENT\}" _OPEN_WEBUI_COMPLETE=complete_zsh open-webui)
      }

      compdef _open_webui_completion open-webui
    '';
    oh-my-zsh = {
      enable = false;
      plugins = [ "git" ];
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
