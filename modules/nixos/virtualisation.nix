{pkgs, ...}: {
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

  users.groups.ubridge = {};
  security.wrappers.ubridge = {
    capabilities = "cap_net_raw,cap_net_admin=eip";
    group = "ubridge";
    owner = "root";
    permissions = "u=rwx,g=rx,o=r";
    source = "${pkgs.ubridge}/bin/ubridge";
  };
  # services.gns3-server = {
  #   enable = true;
  #   ubridge.enable = true;
  #   dynamips.enable = true;
  #   vpcs.enable = true;
  # };
}
