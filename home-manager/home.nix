{ config, inputs, nix-colors, username, pkgs, system, ... }:

let
  goplaying = inputs.goplaying.packages.${system}.goplaying;
in {
  imports = [
    nix-colors.homeManagerModules.default
    # inputs.nixcord.homeModules.nixcord
    inputs.spicetify-nix.homeManagerModules.default
    inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
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

  catppuccin.flavor = "mocha";
  catppuccin.enable = true;
  catppuccin.cava.transparent = true;
  catppuccin.ghostty.enable = false;
  catppuccin.nvim.enable = false;
  catppuccin.tmux.enable = false;

  fonts.fontconfig.enable = true;

  programs.hyprcursor-phinger.enable = true;

  # Pywal temp until I get hellwal working on nix
  programs.pywal.enable = true;

  home.packages = with pkgs; [
    goplaying
    ladybird

    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code

    acpi # For dwm battery status
    alsa-utils
    arandr
    bash-language-server
    blueman
    brightnessctl
    caligula # Really good dd cli tool
    calf
    cliphist # clipboard stuff
    dbeaver-bin

    dmenu # for dwm
    easyeffects
    feh
    flutter
    ffmpegthumbnailer
    filezilla
    gcc
    gimp3
    glib.dev
    gnumake
    gnupg
    godot_4
    hamster
    heroic
    imagemagick
    inetutils
    insomnia
    jellyfin-media-player
    jdk17
    jq # for eww with hyprland
    keepassxc
    kdePackages.kleopatra
    krita
    libreoffice
    lua-language-server
    mutt-wizard
    nautilus
    nix-index
    nix-prefetch-git
    nixfmt-rfc-style
    npins
    obsidian
    openssl
    pass
    pavucontrol
    pfetch
    picom # TODO Migrate to services .nix
    podman
    podman-compose
    podman-desktop
    podman-tui
    postgresql.dev # For python psycopg2
    poppler_utils
    python312Packages.pygments # For texlive
    rclone # For gdrive mount
    signal-desktop
    sqlite # For neovim TimeTracker
    sysstat
    teams-for-linux
    telegram-desktop
    texlab
    texliveFull
    thunderbird
    tor-browser-bundle-bin
    ripgrep
    ueberzugpp # ranger preview
    upower
    virt-manager
    vlc
    wacomtablet
    xclip
    xdotool
    zoom-us

    # Tree sitter
    tree-sitter-grammars.tree-sitter-latex
    # Wayland

    # eww
    # busybox # Keep disaled because of issues TODO: remove from eww config
    # socat # For hyprland eww workspace tracking
    # wl-clipboard # Clipboard manager for wayland
    # waypaper
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
      android-sdk.accept_license = true;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    CC = "clang";
    CXX = "clang++";
  };

  programs.home-manager.enable = true;
}

