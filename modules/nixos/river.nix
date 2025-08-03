{pkgs, ...}: {
  programs.river = {
    enable = true;
    xwayland.enable = false;
    extraPackages = with pkgs; [
      river-filtile
      swaybg
      grim
      slurp

      wl-clipboard-rs
      wl-color-picker
      wlr-randr
    ];
  };

  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    GDK_BACKEND = "wayland";
    CLUTTER_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
}
