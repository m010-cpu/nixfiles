{pkgs, ...}: {
  services.displayManager.ly = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;

    configPackages = [
      pkgs.xdg-desktop-portal
    ];

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
