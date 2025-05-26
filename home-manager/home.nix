{ config, inputs, nix-colors, username, pkgs, system, ... }:

let
  goplaying = inputs.goplaying.packages.${system}.goplaying;
in {
  imports = [
    nix-colors.homeManagerModules.default
    inputs.spicetify-nix.homeManagerModules.default
    inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
    ./system/apollo.nix
    ./common
    ./git
    ./apps
    ./services
    ./shell
    ./games/osu.nix
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

  services.picom = {
    enable = false;
  };

  home.packages = with pkgs; [
    goplaying

    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code

    acpi # For dwm battery status
    alsa-utils
    arandr
    bash-language-server
    blender
    blueman
    bottles
    brightnessctl
    caligula # Really good dd cli tool
    calf
    cliphist # clipboard stuff
    dbeaver-bin
    drawio
    easyeffects
    feh
    figma-linux
    flutter
    ffmpegthumbnailer
    filezilla
    gcc
    gimp3
    glib.dev
    gnumake
    gnupg
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
    nautilus
    nix-index
    nix-prefetch-git
    nixfmt-rfc-style
    npins
    obs-studio
    obsidian
    openssl
    p7zip
    pass
    pavucontrol
    pfetch
    podman
    podman-compose
    podman-desktop
    podman-tui
    poppler_utils
    protonmail-desktop
    protonmail-bridge
    rclone # For gdrive mount
    signal-desktop
    sqlite
    sysstat # Questionable - was this fo dwm?
    teams-for-linux
    telegram-desktop
    thunderbird
    ripgrep
    ueberzugpp # ranger preview
    upower
    vlc
    wacomtablet
    xclip
    xdotool
    zoom-us

    # Tree sitter
    tree-sitter-grammars.tree-sitter-latex
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
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    CC = "clang";
    CXX = "clang++";
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  programs.home-manager.enable = true;
}

