{lib, ...}: {
  programs.clash-verge = {
    enable = true;
    serviceMode = true;
  };

  # security.wrappers.".verge-mihomo-w" = {
  #   owner = "root";
  #   group = "root";
  #   capabilities = "cap_net_bind_service,cap_net_raw,cap_net_admin=+ep";
  #   source = "${pkgs.clash-verge-rev}/bin/verge-mihomo";
  # };
  systemd.services.clash-verge.serviceConfig = {
    AmbientCapabilities = ["CAP_NET_BIND_SERVICE"];
    CapabilityBoundingSet = lib.mkAfter ["CAP_NET_BIND_SERVICE"];
  };
}
