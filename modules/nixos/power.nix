{
  services.thermald.enable = true;
  powerManagement.powertop.enable = true;
  services.system76-scheduler.settings.cfsProfiles.enable = true;

  services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_AC = 0;
      CPU_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    };
  };
}
