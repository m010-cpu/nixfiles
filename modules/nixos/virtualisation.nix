{pkgs, ...}: {
  programs.virt-manager.enable = true;
  virtualisation = {
    libvirtd.enable = true;

    virtualbox.host.enable = true;

    waydroid.enable = true;

    docker = {
      enable = true;
      enableOnBoot = false;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  users.groups.ubridge = {};
  security.wrappers.ubridge = {
    capabilities = "cap_net_raw,cap_net_admin=eip";
    group = "ubridge";
    owner = "root";
    permissions = "u=rwx,g=rx,o=r";
    source = "${pkgs.ubridge}/bin/ubridge";
  };
}
