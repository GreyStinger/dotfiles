{ ... }:

{
  programs.git = {
    enable = true;
    userName = "Jayden Andrews";
    userEmail = "jaydenandrews010@gmail.com";
    extraConfig = {
      merge = { tool = "diffview"; };
      mergetool = {
        prompt = false;
        keepBackup = false;
      };
      "mergetool \"diffview\"" = {
        cmd = ''nvim -n -c "DiffviewOpen" "$MERGE"'';
      };
      init.defaultBranch = "master";
      core = { editor = "nvim"; };
      rebase = {
        autoSquash = true;
        autoStash = true;
      };
      rerere = {
        autoupdate = true;
        enabled = true;
      };
    };
    signing = {
      key = "FAFB11080EBC12BB";
      signByDefault = true;
    };
    ignores = [ ".direnv/" "result" ];
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

