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
    filezilla
    gimp
    glib.dev
    gnumake
    godot_4
    hamster
    heroic
    imagemagick
    inetutils
    insomnia
    keepassxc
    kleopatra
    krita
    lua-language-server
    modem-manager-gui
    mutt-wizard
    nautilus
    # neovim
    nix-index
    nix-prefetch-git
    obs-studio
    obsidian
    openssl
    pass
    pavucontrol
    pfetch
    picom                       # TODO Migrate to services .nix
    python312Packages.pygments  # For texlive
    qbittorrent
    rclone                      # For gdrive mount
    sqlite                      # For neovim TimeTracker
    telegram-desktop
    texliveFull
    thunderbird
    tor-browser-bundle-bin
    ripgrep
    ueberzugpp                  # ranger preview
    upower
    virt-manager
    vlc
    wacomtablet
    xdotool
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

