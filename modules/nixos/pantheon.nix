{pkgs, ...}: {
  services.xserver = {
    enable = true;

    desktopManager.pantheon = {
      enable = true;
      extraWingpanelIndicators = with pkgs.pantheon; [
        wingpanel-indicator-keyboard
        wingpanel-indicator-nightlight
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    pantheon-tweaks
  ];
}
