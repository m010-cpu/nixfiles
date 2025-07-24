{
  config,
  lib,
  modulesPath,
  pkgs,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "thunderbolt"
    "nvme"
    "usb_storage"
    "sd_mod"
    # "hfsplus"
  ];
  boot.initrd.kernelModules = [
    "dm-snapshot"
    "cryptd"
    "thinkpad-acpi"
  ];

  # boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_hardened;
  boot.kernel.sysctl."net.ipv4.icmp_echo_ignore_broadcasts" = lib.mkDefault true;
  boot.kernelModules = ["uinput"];
  boot.kernelParams = [
    "slab_nomerge"
    "page_poison=1"
    "page_alloc.shuffle=1"
    "thinkpad_acpi.fan_control=1"
  ];
  boot.extraModulePackages = [];

  # security.lockKernelModules = lib.mkDefault true;
  security.protectKernelImage = lib.mkDefault true;
  security.forcePageTableIsolation = lib.mkDefault true;
  security.apparmor.enable = lib.mkDefault true;
  security.apparmor.killUnconfinedConfinables = lib.mkDefault true;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/3cf20d9a-567a-4071-bcbd-8bdf61d695f0";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-6b5dac67-6279-49ca-a507-a8a6b42b257b".device = "/dev/disk/by-uuid/6b5dac67-6279-49ca-a507-a8a6b42b257b";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C1B7-842D";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/836d0cc6-abaa-4a3d-939f-aa792835330d";}
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.enableAllFirmware = true;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # OpenCL Driver
  hardware.graphics.extraPackages = with pkgs; [intel-ocl];

  # Tablet Driver
  hardware.opentabletdriver.enable = true;
}
