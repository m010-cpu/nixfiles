{pkgs, ...}: {
  services.usbmuxd = {
    enable = true;
    # package = pkgs.usbmuxd2;
  };

  environment.systemPackages = with pkgs; [
    # libimobiledevice broken
    idevicerestore
    ideviceinstaller
    ifuse
  ];
}
