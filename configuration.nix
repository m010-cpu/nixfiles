{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ./modules/nixos/lanzaboote.nix

    ./modules/nixos/nix.nix
    ./modules/nixos/power.nix
    ./modules/nixos/fingerprint.nix
    ./modules/nixos/bluetooth.nix
    ./modules/nixos/audio.nix
    ./modules/nixos/virtualisation.nix
    ./modules/nixos/security.nix

    ./modules/nixos/gdm.nix
    ./modules/nixos/stylix.nix

    ./modules/home/starship.nix
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
      "ubridge"
    ];
    shell = pkgs.zsh;
  };

  # Tablet Driver
  hardware.opentabletdriver.enable = true;

  # Auto Disk Mounting
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Authentication
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = {};
  security.pam.services.swaylock.fprintAuth = true;

  security.pam.services.swaylock.text = ''
    # account management.
    account required pam_unix.so

    # authentication management.

    # prompt for a password; pressing enter on a blank field will proceed to fingerprint authentication.
    auth sufficient pam_unix.so nullok likeauth try_first_pass
    auth sufficient ${pkgs.fprintd}/lib/security/pam_fprintd.so
    auth required pam_deny.so

    # password management.
    password sufficient pam_unix.so nullok sha512

    # session management.
    session required pam_env.so conffile=/etc/pam/environment readenv=0
    session required pam_unix.so
  '';

  # Services
  programs = {
    zsh.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.default;
    };
  };

  # Environment
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    #GDK_BACKEND = "wayland";
    #CLUTTER_BACKEND = "wayland";
    #QT_QPA_PLATFORM = "wayland";
    #QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    #SDL_VIDEODRIVER = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    #WAYLAND_DISPLAY = "1";
  };

  # Packages
  environment.systemPackages = with pkgs; [
    efibootmgr
    usbutils
    udiskie
    udisks

    nautilus
    seahorse
    swaylock
  ];

  system.stateVersion = "24.05";
}
