{...}:

{
  programs.git = {
    enable = true;
    userName = "GreyStinger";
    userEmail = "jaydenandrews010@gmail.com";
    extraConfig = {
      init.defaultBranch = "master";
      core = {
        editor = "nvim";
      };
      rebase = {
        autoSquash = true;
        autoStash = true;
      };
      rerere = {
        autoupdate = true;
        enabled = true;
      };
    };
    ignores = [
      ".direnv/"
      "result"
    ];
    aliases = {
      cl = "clone";
      ct = "commit";
      co = "checkout";
      ss = "status -bs";
      st = "stash";
      ad = "add";
      df = "diff";
      ps = "push";
      pl = "pull";
    };
  };
 }

