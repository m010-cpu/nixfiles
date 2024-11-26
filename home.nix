{pkgs, ...}: {
  imports = [
    ./modules/home/hyprland.nix
    ./modules/home/swaylock.nix
    ./modules/home/zsh.nix
    ./modules/home/wezterm.nix
    ./modules/home/gammastep.nix
    ./modules/home/firefox.nix
    ./modules/home/neovim.nix
    ./modules/home/vscode.nix
    ./modules/home/notion.nix
    ./modules/home/rofi.nix
    ./modules/home/waybar.nix
    ./modules/home/zathura.nix
    ./modules/home/direnv.nix
    ./modules/home/spicetify.nix
    ./modules/home/opensnitch.nix.nix
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
    wget
    thunderbird
    git
    insomnia
    burpsuite
    yt-dlp
    haruna
    clapper
    celluloid
    localsend

    man-pages
    man-pages-posix

    fastfetch
    evtest
    ripgrep
    fd
    unzip
    bc
    file
    binutils
    p7zip
    powershell
    xxd

    exiftool
    binwalk
    testdisk
    foremost
    volatility3
    keepass
    pngcheck

    networkmanagerapplet
    powertop

    bitwarden-desktop
    goldwarden
    discord
    kicad

    gns3-gui
    gns3-server
    wireshark
    tenv

    pyprland
    hyprpicker
    hyprlandPlugins.hyprspace

    brightnessctl
    playerctl

    wl-clipboard-rs
    hyprshot
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
