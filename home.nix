{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules/home/hyprland.nix
    ./modules/home/hypridle.nix
    ./modules/home/swaylock.nix
    ./modules/home/zsh.nix
    ./modules/home/wezterm.nix
    ./modules/home/gammastep.nix
    # ./modules/home/mako.nix
    ./modules/home/swaync.nix
    ./modules/home/firefox.nix
    ./modules/home/neovim.nix
    ./modules/home/vscode.nix
    ./modules/home/notion.nix
    ./modules/home/rofi.nix
    ./modules/home/waybar.nix
    ./modules/home/zathura.nix
    ./modules/home/direnv.nix
    ./modules/home/spicetify.nix
    # ./modules/home/opensnitch.nix
    # ./modules/home/dconf.nix
  ];
  home.username = "mo";
  home.homeDirectory = "/home/mo";

  fonts.fontconfig.enable = true;

  home.file = {
    ".config/nvim".source = ./nvim;
    ".config/hypr/pyprland.toml".source = ./hypr/pyprland.toml;
  };

  stylix = {
    targets = {
      neovim.enable = false;
    };
  };

  home.packages = with pkgs; [
    alacritty
    thunderbird
    insomnia
    burpsuite
    haruna
    clapper
    celluloid
    localsend
    bitwarden-desktop
    goldwarden
    discord
    kicad
    xournalpp
    anki
    teams-for-linux
    zoom-us
    wechat-uos
    rnote
    parabolic
    ungoogled-chromium
    opensnitch-ui
    libreoffice
    jetbrains.idea-ultimate
    telegram-desktop
    code-cursor
    lmstudio
    calibre
    qemu
    vagrant
    brave
    inputs.zen-browser.packages."${system}".twilight-official

    rofi-network-manager
    rofi-bluetooth

    # gnome-tweaks
    # gnomeExtensions.system-monitor
    # gnomeExtensions.forge

    # gnome-disk-utility
    gnome-calculator
    gnome-calendar
    gnome-disk-utility
    gnome-usage
    gnome-tecla

    xfce.ristretto
    xfce.tumbler

    rhythmbox
    libgpod

    wireshark
    gns3-server
    gns3-gui
    ubridge
    dynamips

    git
    wget
    yt-dlp
    spotdl
    fastfetch
    powertop
    openssl
    bat
    gh
    man-pages
    man-pages-posix
    font-awesome
    mpd
    ffmpeg
    cachix

    gcc
    gdb
    criterion
    libbpf
    rustup

    usbutils
    hfsprogs
    inetutils
    binutils
    p7zip
    evtest
    ripgrep
    fd
    unzip
    bc
    file
    powershell
    xxd
    exiftool
    apktool
    zsteg
    steghide
    stegsolve
    binwalk
    testdisk
    foremost
    pngcheck
    ghidra
    radare2
    pkcrack
    bkcrack
    apktool
    keepass
    hashcat
    autopsy
    sleuthkit
    ilspycmd
    avalonia-ilspy
    volatility3
    (callPackage ./vol.nix {})
    mitmproxy

    networkmanagerapplet
    pyprland
    hyprpicker
    hyprlandPlugins.hyprspace
    wl-clipboard-rs
    hyprshot
    brightnessctl
    playerctl
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
