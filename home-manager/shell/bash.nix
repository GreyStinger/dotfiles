{ ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      l = "ls -h";
      ll = "ls -lh";
      la = "ls -lAh";
      lm = "ls -m";
      ncls = ''clear && pfetch && echo "^^ Nice ^^"'';
    };
  };
}

