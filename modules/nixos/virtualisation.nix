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
  };
  # services.gns3-server = {
  #   enable = true;
  #   ubridge.enable = true;
  #   dynamips.enable = true;
  #   vpcs.enable = true;
  # };
}
