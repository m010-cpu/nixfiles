{ pkgs, ... }:

{
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
  ];
  home.username = "mo";
  home.homeDirectory = "/home/mo";

  fonts.fontconfig.enable = true;

  home.file = {
    # ".config/wezterm".source = ./wezterm;
    ".config/nvim".source = ./nvim;
    #".config/hypr".source = ./hypr;
    ".config/hypr/pyprland.toml".source = ./hypr/pyprland.toml;
    ".config/wallpaper".source = ./wallpaper;
  };

  stylix = {
    targets = {
      firefox.profileNames = [ "dev-edition-default" ];
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

    man-pages
    man-pages-posix

    fastfetch
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

    wireshark
    tenv

    pyprland
    hyprpaper
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
