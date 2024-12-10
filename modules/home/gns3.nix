{pkgs, ...}: {
  home.packages = with pkgs; [
    gns3-server
    gns3-gui
    ubridge
    dynamips
  ];

  security.wrappers.ubridge = {
    capabilities = "cap_net_raw,cap_net_admin=eip";
    group = "ubridge";
    owner = "root";
    permissions = "u=rwx,g=rx,o=r";
    source = "${pkgs.ubridge}/bin/ubridge";
  };
}
