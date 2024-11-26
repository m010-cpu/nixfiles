{
  security.polkit.enable = true;

  services.clamav.daemon.enable = true;
  services.clamav.updater.enable = true;

  services.opensnitch.enable = true;
  services.opensnitch-ui.enable = true;
}
