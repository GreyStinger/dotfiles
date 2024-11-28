{ ... }:

{
  programs.neomutt = {
    enable = true;
    editor = "vim";
    vimKeys = true;
    sidebar = {
      enable = true;
      shortPath = true;
    };
  };
}
