{pkgs, ...}: {
  # Authentication
  services.gnome.gnome-keyring.enable = true;

  security.pam.services.login.enableGnomeKeyring = true;

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
}
