{pkgs, ...}: {
  programs.river = {
    enable = true;
    xwayland.enable = false;
    extraPackages = with pkgs; [
      river-filtile
      swaybg
      grim
      slurp

      wl-clipboard-rs
      wl-color-picker
      wlr-randr

      (pkgs.rustPlatform.buildRustPackage rec {
        pname = "flow";
        version = "v0.2.0";

        src = pkgs.fetchFromGitHub {
          owner = "stefur";
          repo = "flow";
          rev = version;
          hash = "sha256-VVM6EuefMWlB3B6XUiGwx8MTmEIhPykLw0erdK1A5sE=";
        };

        cargoLock.lockFile = "${src}/Cargo.lock";
      })
    ];
  };

  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    GDK_BACKEND = "wayland";
    CLUTTER_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "river";
    XDG_SESSION_DESKTOP = "river";
  };
}
