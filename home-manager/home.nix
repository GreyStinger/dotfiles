{ config , inputs , nix-colors , username , pkgs , ... }:

{
  imports = [
    nix-colors.homeManagerModules.default
    inputs.nixcord.homeManagerModules.nixcord
    inputs.spicetify-nix.homeManagerModules.default
    inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
    ./system/apollo.nix
    ./common
    ./windowmanagers
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

  programs.hyprcursor-phinger.enable = true;

  # Pywal temp until I get hellwal working on nix
  programs.pywal.enable = true;

  home.packages = with pkgs; [
    inputs.goplaying.packages.${system}.default

    eww

    # (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code

    alsa-utils
    arandr
    android-studio
    bash-language-server
    blueman
    brightnessctl
    busybox           # For cpu usage in eww
    caligula          # Really good dd cli tool
    calf
    clang
    cliphist          # clipboard stuff
    dbeaver-bin
    dmenu             # for dwm
    easyeffects
    feh
    ffmpegthumbnailer
    filezilla
    gimp
    glib.dev
    gnumake
    gnupg
    godot_4
    hamster
    heroic
    imagemagick
    inetutils
    insomnia
    jq                # for eww with hyprland
    keepassxc
    kleopatra
    krita
    lua-language-server
    # modem-manager-gui
    mutt-wizard
    nautilus
    nix-index
    nix-prefetch-git
    obs-studio
    obsidian
    openssl
    pass
    pavucontrol
    pfetch
    picom                       # TODO Migrate to services .nix
    podman
    podman-compose
    podman-desktop
    podman-tui
    python312Packages.pygments  # For texlive
    qbittorrent
    rclone                      # For gdrive mount
    sqlite                      # For neovim TimeTracker
    socat                       # For hyprland eww workspace tracking
    telegram-desktop
    texlab
    texliveFull
    thunderbird
    tor-browser-bundle-bin
    ripgrep
    ueberzugpp                  # ranger preview
    upower
    virt-manager
    vlc
    wacomtablet
    waypaper
    wl-clipboard                # Clipboard manager for wayland
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

