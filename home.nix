{pkgs, ...}: {
  imports = [
    ./modules/home/hyprland.nix
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
    ./modules/home/opensnitch.nix
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
    gns3-gui
    gns3-server
    wireshark
    anki
    teams-for-linux
    zoom-us

    git
    wget
    yt-dlp
    fastfetch
    powertop
    openssl
    bat
    gh
    man-pages
    man-pages-posix

    gcc
    gdb
    tenv

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
    volatility3
    pngcheck
    ghidra
    radare2
    keepass

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
