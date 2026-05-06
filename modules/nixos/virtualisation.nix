{pkgs, ...}: {
  programs.virt-manager.enable = true;
  virtualisation = {
    libvirtd.enable = true;

    virtualbox.host.enable = true;

    vmware.host.enable = true;

    waydroid = {
      enable = true;
      package = pkgs.waydroid-nftables;
    };

    docker = {
      enable = true;
      enableOnBoot = false;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
      daemon.settings = {
        dns = ["9.9.9.9" "1.1.1.1"];
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
