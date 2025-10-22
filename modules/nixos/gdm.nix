{pkgs, ...}: {
  # services.displayManager.defaultSession = "hyprland";
  services.displayManager.defaultSession = "river";
  # services.displayManager.defaultSession = "sway";

  services.xserver = {
    enable = true;

    displayManager.gdm = {
      enable = true;
      wayland = true;
    };

    # desktopManager.gnome.enable = true;
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
          chooser_cmd = "${pkgs.rofi-wayland}/bin/rofi -dmenu";
        };
      };
    };

    configPackages = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
      # pkgs.xdg-desktop-portal-hyprland
    ];

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
