{pkgs, ...}: {
  services.displayManager.defaultSession = "hyprland";

  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    pyprland
    wl-clipboard-rs
    hyprpicker
    hyprshot
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GDK_BACKEND = "wayland";
    CLUTTER_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    SDL_VIDEODRIVER = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";

    MOZ_ENABLE_WAYLAND = "1";

    HYPRSHOT_DIR = "Downloads";
  };
}
