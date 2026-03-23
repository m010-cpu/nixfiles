{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
  imports = [
    ./modules/home/stylix.nix

    # ./modules/home/hyprland.nix
    # ./modules/home/hypridle.nix
    # ./modules/home/river.nix
    ./modules/home/sway.nix

    ./modules/home/swayidle.nix
    ./modules/home/swaylock.nix
    ./modules/home/zsh.nix
    ./modules/home/wezterm.nix
    ./modules/home/gammastep.nix
    ./modules/home/kanshi.nix
    # ./modules/home/mako.nix
    # ./modules/home/swaync.nix
    ./modules/home/firefox.nix
    ./modules/home/neovim.nix
    ./modules/home/vscode.nix
    # ./modules/home/notion.nix
    ./modules/home/rofi.nix
    # ./modules/home/waybar.nix
    ./modules/home/zathura.nix
    ./modules/home/direnv.nix
    ./modules/home/spicetify.nix
    ./modules/home/opencode.nix
    # ./modules/home/opensnitch.nix
    # ./modules/home/dconf.nix
  ];

  home.username = "mo";
  home.homeDirectory = "/home/mo";

  fonts.fontconfig.enable = true;

  home.file = {
    ".config/nvim".source = ./nvim;
    # ".config/hypr/pyprland.toml".source = ./hypr/pyprland.toml;
  };

  home.packages = with pkgs; [
    inputs.terra-shell.packages.${stdenv.hostPlatform.system}.default
    inputs.zen-browser.packages.${stdenv.hostPlatform.system}.twilight-official

    pkgs-unstable.antigravity
    pkgs-unstable.code-cursor
    pkgs-unstable.mpris-timer
    pkgs-unstable.bitwarden-desktop
    pkgs-unstable.discord
    pkgs-unstable.ente-auth
    pkgs-unstable.ivpn
    pkgs-unstable.ivpn-service
    pkgs-unstable.tutanota-desktop
    pkgs-unstable.claude-code

    clash-verge-rev

    adwaita-icon-theme
    adwaita-fonts

    alacritty
    thunderbird
    insomnia
    burpsuite
    haruna
    clapper
    celluloid
    localsend
    kicad
    xournalpp
    anki
    teams-for-linux
    zoom-us
    wechat
    rnote
    parabolic
    ungoogled-chromium
    google-chrome
    libreoffice
    # jetbrains.idea
    # jetbrains.clion
    telegram-desktop
    kooha
    lmstudio
    calibre
    qemu
    vagrant
    brave
    openvpn
    transmission_4
    onlyoffice-desktopeditors
    bottles
    devpod
    eas-cli
    figma-linux

    rofi-network-manager
    rofi-bluetooth

    # gnome-tweaks
    # gnomeExtensions.system-monitor
    # gnomeExtensions.forge

    gnome-disk-utility
    gnome-calculator
    gnome-calendar
    gnome-disk-utility
    gnome-usage
    gnome-tecla
    sushi
    nautilus
    seahorse

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
    git-lfs
    wget
    yt-dlp
    spotdl
    fastfetch
    powertop
    powerstat
    openssl
    bat
    gh
    man-pages
    man-pages-posix
    font-awesome
    mpd
    ffmpeg
    cachix
    htop
    clamav
    whois
    dig
    ncdu

    gcc
    gdb
    criterion
    libbpf
    cargo
    rustc
    python3
    nodejs_24
    intel-undervolt

    nmap
    usbutils
    hfsprogs
    inetutils
    binutils
    p7zip
    evtest
    ripgrep
    fd
    zip
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
    # Fix Nonparenting WM
    (ghidra.overrideAttrs (oldAttrs: {
      postFixup = ''
        mkdir -p "$out/bin"
        ln -s "$out/lib/ghidra/ghidraRun" "$out/bin/ghidra"
        ln -s "$out/lib/ghidra/support/analyzeHeadless" "$out/bin/ghidra-analyzeHeadless"

        wrapProgram "$out/lib/ghidra/support/launch.sh" \
          --set-default NIX_GHIDRAHOME "$out/lib/ghidra/Ghidra" \
          --set _JAVA_AWT_WM_NONREPARENTING 1 \
          --prefix PATH : ${lib.makeBinPath [openjdk21]}
      '';
    }))
    binaryninja-free
    radare2
    pkcrack
    bkcrack
    apktool
    keepass
    hashcat
    pkgs-unstable.autopsy
    pkgs-unstable.sleuthkit
    ilspycmd
    avalonia-ilspy
    volatility3
    mitmproxy
    wabt
    mgba
    unicorn

    (callPackage ./custom/vol.nix {})
    (callPackage ./custom/gdsdecomp.nix {})
    (callPackage ./custom/ida-pro/ida-pro.nix {})
    (callPackage ./custom/lotion.nix {})
    (callPackage ./custom/xtool.nix {})
    (callPackage ./custom/handy.nix {})

    networkmanagerapplet
    brightnessctl
    playerctl
  ];

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
