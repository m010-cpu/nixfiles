{pkgs, ...}: {
  services.displayManager.defaultSession = "sway";

  programs.sway = {
    enable = true;
    xwayland.enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      swaylock
      swaybg
      grim
      slurp

      wl-clipboard-rs
      wl-color-picker
      wlr-randr
    ];
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    wlr = {
      enable = true;
      settings = {
        screencast = {
          # chooser_type = "dmenu";
          # chooser_cmd = "${pkgs.bemenu}/bin/bemenu";
          chooser_type = "dmenu";
          chooser_cmd = "${pkgs.rofi}/bin/rofi -dmenu";
        };
      };
    };

    configPackages = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "sway";
    XDG_SESSION_DESKTOP = "sway";
  };
}
