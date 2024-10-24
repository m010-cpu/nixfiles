{ lib, inputs, ... }:

{
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  boot = {
    bootspec.enable = true;

    initrd.systemd.enable = true;
    initrd.luks.devices."luks-d37e5199-7e17-4394-8f2d-fefceb646aed".device = "/dev/disk/by-uuid/d37e5199-7e17-4394-8f2d-fefceb646aed";
    loader.systemd-boot.enable = lib.mkForce false;

    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";

    };
  };
}
