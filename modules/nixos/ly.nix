{pkgs, ...}: {
  services.displayManager.defaultSession = "hyprland";

  services.displayManager.ly = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;

    configPackages = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-hyprland
    ];

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
