{lib, ...}: {
  services.displayManager.gdm = {
    enable = true;
  };

  services.gnome.localsearch.enable = true;
  services.gnome.tinysparql.enable = true;

  programs.dconf = {
    enable = true;

    profiles.gdm = {
      databases = [
        {
          settings = {
            "org/gnome/shell" = {
              disabled-extensions = ["network" "bluetooth"];
            };

            "org/gnome/desktop/interface" = {
              scaling-factor = lib.gvariant.mkUint32 1;
              text-scaling-factor = 1.0;
            };
          };
        }
      ];
    };
  };
}
