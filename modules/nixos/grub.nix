{
  boot = {
    loader = {
      grub = {
        enable = true;
        useOSProber = true;
        device = "nodev";
        efiSupport = true;
      };
      efi.efiSysMountPoint = "/boot";
      efi.canTouchEfiVariables = true;
    };
    initrd.luks.devices."luks-d37e5199-7e17-4394-8f2d-fefceb646aed".device = "/dev/disk/by-uuid/d37e5199-7e17-4394-8f2d-fefceb646aed";
  };
}
