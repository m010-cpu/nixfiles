{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules/home/stylix.nix

    # ./modules/home/hyprland.nix
    # ./modules/home/hypridle.nix

    ./modules/home/river.nix

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
    wechat
    rnote
    parabolic
    ungoogled-chromium
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
    ivpn
    ente-auth
    openvpn
    transmission_4
    onlyoffice-desktopeditors

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

    gcc
    gdb
    criterion
    libbpf
    cargo
    rustc

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
    autopsy
    sleuthkit
    ilspycmd
    avalonia-ilspy
    volatility3
    (callPackage ./custom/vol.nix {})
    (callPackage ./custom/gdsdecomp.nix {})
    (callPackage ./custom/ida-pro/ida-pro.nix {})
    mitmproxy
    wabt

    networkmanagerapplet
    brightnessctl
    playerctl
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
