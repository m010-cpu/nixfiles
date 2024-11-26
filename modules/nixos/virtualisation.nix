{
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = false;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };

    virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = ["mo"];
  };
}
