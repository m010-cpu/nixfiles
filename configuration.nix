{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix

    ./modules/nixos/lanzaboote.nix

    ./modules/nixos/nix.nix
    ./modules/nixos/power.nix
    ./modules/nixos/fingerprint.nix
    ./modules/nixos/auth.nix
    ./modules/nixos/bluetooth.nix
    ./modules/nixos/audio.nix
    ./modules/nixos/virtualisation.nix
    ./modules/nixos/security.nix
    ./modules/nixos/layout.nix
    ./modules/nixos/disk.nix
    ./modules/nixos/udev.nix

    ./modules/nixos/gdm.nix
    ./modules/nixos/hyprland.nix
    ./modules/nixos/stylix.nix

    ./modules/home/starship.nix
    ./modules/nixos/appimage.nix
    ./modules/nixos/ios.nix
  ];

  # Networking
  networking.hostName = "terra";
  networking.networkmanager.enable = true;

  # Timezone/Language
  time.timeZone = "Europe/Monaco";

  i18n.defaultLocale = "en_US.UTF-8";

  fonts.fontDir.enable = true;

  # Keymap
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # User
  users.users.mo = {
    isNormalUser = true;
    description = "mo";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "libvirtd"
      "vboxusers"
      "ubridge"
    ];
    shell = pkgs.zsh;
  };

  services.nfs.server.enable = true;
  networking.firewall.allowedTCPPorts = [2049];
  networking.firewall.allowedUDPPorts = [2049];

  # Environment
  environment.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = "1";
  };

  # Packages
  environment.systemPackages = with pkgs; [
    efibootmgr
    swaylock
  ];

  system.stateVersion = "25.05";
}
