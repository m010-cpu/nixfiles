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
  ];
  home.username = "mo";
  home.homeDirectory = "/home/mo";

  fonts.fontconfig.enable = true;

  home.file = {
    #".zshrc".source = ./.zshrc;
    ".p10k.zsh".source = ./.p10k.zsh;
    # ".config/wezterm".source = ./wezterm;
    ".config/nvim".source = ./nvim;
    #".config/hypr".source = ./hypr;
    ".config/hypr/pyprland.toml".source = ./hypr/pyprland.toml;
    ".config/wallpaper".source = ./wallpaper;
  };

  stylix = {
    # enable = true;
    # autoEnable = true;
  };

  home.packages = with pkgs; [
    alacritty
    wget
    thunderbird
    git
    zathura
    insomnia

    man-pages
    man-pages-posix

    fastfetch
    ripgrep
    fd
    unzip
    bc
    file
    zellij

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
    rofi-wayland

    brightnessctl
    playerctl

    wl-clipboard-rs
    hyprshot
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
