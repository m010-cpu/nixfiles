{
  powerManagement.powertop.enable = true;

  services.power-profiles-daemon.enable = false;

  services.upower.enable = true;
  services.thermald.enable = true;

  # services.system76-scheduler.enable = true;
  # services.system76-scheduler.settings.cfsProfiles.enable = true;

  services.tlp = {
    enable = true;
    settings = {
      TLP_DEFAULT_MODE = "BAT";
      TLP_PERSISTENT_DEFAULT = 1;

      CPU_BOOST_ON_AC = 0;
      CPU_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      # START_CHARGE_THRESH_BAT0 = 35;
      # STOP_CHARGE_THRESH_BAT0 = 100;

      RESTORE_DEVICE_STATE_ON_STARTUP = 1;
      # DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";
    };
  };
}
