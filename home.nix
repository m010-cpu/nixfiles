{
  pkgs,
  ...
}:

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
      neovim.enable = false;
    };
  };

  home.packages = with pkgs; [
    alacritty
    wget
    thunderbird
    git
    zathura
    insomnia
    burpsuite

    man-pages
    man-pages-posix

    exiftool
    fastfetch
    ripgrep
    fd
    unzip
    bc
    file
    binutils
    p7zip
    powershell

    binwalk
    testdisk
    foremost

    networkmanagerapplet
    powertop

    bitwarden-desktop
    spotify
    spicetify-cli
    discord

    wireshark
    tenv

    waybar
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
