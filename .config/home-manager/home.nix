{ config
, inputs
, nix-colors
, username
, pkgs
, ...
}:
let
  overlays = [
    (import /home/jayden/.config/nixpkgs/overlays/zapzap.nix)
  ];
in
  {
    imports = [
      nix-colors.homeManagerModules.default
      inputs.nixcord.homeManagerModules.nixcord
      inputs.spicetify-nix.homeManagerModules.default
      ./git
      ./apps
      ./shell
    ];

    colorScheme = nix-colors.colorSchemes.catppuccin-mocha;

    home.username = "jayden";
    home.homeDirectory = "/home/jayden";
    home.stateVersion = "23.11";

    home.packages = with pkgs; [
      inputs.goplaying.packages.${system}.default

      alsa-utils
      arandr
      android-studio
      blueman
      brightnessctl
      calf
      clang
      clipster
      cbonsai
      dbeaver-bin
      easyeffects
      feh
      ffmpegthumbnailer
      # firefox
      gimp
      gnome.nautilus
      godot_4
      hamster
      heroic
      imagemagick
      inetutils
      insomnia
      krita
      mangohud
      modem-manager-gui
      neovim
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
      nix-index
      nix-prefetch-git
      obs-studio
      obsidian
      openssl
      pavucontrol
      peaclock
      pipes-rs
      pfetch
      rclone
      sioyek
      starship
      sqlite
      telegram-desktop
      texliveBasic
      thunderbird
      tmux
      ripgrep
      ueberzugpp         # ranger preview
      upower
      vlc
      wacomtablet
      xdotool
      zathura
      zapzap
      zoom-us
    ];

    nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
      overlays = overlays;
    };

    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
    };

    home.sessionVariables = {
      EDITOR = "nvim";
      CC = "clang";
      CXX = "clang++";
    };

    programs.home-manager.enable = true;
}

