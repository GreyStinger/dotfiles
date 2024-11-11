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

    fonts.fontconfig.enable = true;

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
      dbeaver-bin
      easyeffects
      feh
      ffmpegthumbnailer
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
      pfetch
      qbittorrent
      rclone
      sioyek
      sqlite
      telegram-desktop
      texliveBasic
      thunderbird
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

