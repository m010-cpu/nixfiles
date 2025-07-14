{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    systemd.variables = ["--all"];

    extraConfig = ''
      ${builtins.readFile ../../hypr/hyprland.conf}
    '';
  };
}
