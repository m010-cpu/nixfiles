{
  security.polkit.enable = true;

  services.opensnitch.enable = true;

  # services.clamav = {
  #   daemon = {
  #     enable = true;
  #     settings = {
  #       ConcurrentDatabaseReload = "no";
  #     };
  #   };
  #
  #   updater = {
  #     enable = true;
  #     frequency = 1;
  #     interval = "daily";
  #   };
  #
  #   fangfrisch = {
  #     enable = true;
  #     interval = "daily";
  #   };
  # };
}
