{ config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      l="ls -h";
      ll="ls -lh";
      la="ls -lAh";
      lm="ls -m";
      update = "home-manager switch --impure";
      sys-update = "sudo nixos-rebuild switch --flake /etc/nixos#default";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
