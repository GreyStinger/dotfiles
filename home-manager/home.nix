{ config , inputs , nix-colors , username , pkgs , ... }:

{
  imports = [
    nix-colors.homeManagerModules.default
    inputs.nixcord.homeManagerModules.nixcord
    inputs.spicetify-nix.homeManagerModules.default
    ./system/apollo.nix
    ./common
    ./git
    ./apps
    ./services
    ./shell
  ];

  colorScheme = nix-colors.colorSchemes.catppuccin-mocha;

  home.username = "jayden";
  home.homeDirectory = "/home/jayden";
  home.stateVersion = "23.11";

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    inputs.goplaying.packages.${system}.default

    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })

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
    glib.dev
    godot_4
    hamster
    heroic
    imagemagick
    inetutils
    insomnia
    krita
    modem-manager-gui
    nautilus
    neovim
    nix-index
    nix-prefetch-git
    obs-studio
    obsidian
    openssl
    pavucontrol
    pfetch
    picom              # TODO Migrate to services .nix
    qbittorrent
    rclone             # For gdrive mount
    sqlite             # For neovim TimeTracker
    telegram-desktop
    texliveBasic
    thunderbird
    tor-browser-bundle-bin
    ripgrep
    ueberzugpp         # ranger preview
    upower
    virt-manager
    vlc
    wacomtablet
    xdotool
    # zapzap             # native-ish whatsapp client using pyqt
    zoom-us
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
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

