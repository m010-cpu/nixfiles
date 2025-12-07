{
  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  programs.dconf = {
    enable = true;

    profiles.gdm = {
      databases = [
        {
          settings."org/gnome/shell" = {
            disabled-extensions = ["network" "bluetooth"];
          };
        }
      ];
    };
  };
}
