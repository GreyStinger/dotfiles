{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./bash.nix
    ./bat.nix
    ./btop.nix
    ./cava.nix
    ./dircolors.nix
    ./fzf.nix
    ./neofetch.nix
    ./ranger.nix
    ./starship.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  options = {
    extraShell = lib.mkOption {
      description = "Additional shell applications";
      type = lib.types.bool;
      default = false;
    };
  };
}

