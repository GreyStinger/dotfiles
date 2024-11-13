{ ... }:

{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    icons = "auto";
    git = false;
    extraOptions = [
      "--header"
      "--group"
      "--no-time"
      "--mounts"
      "--no-permissions"
      "--octal-permissions"
    ];
  };
}
