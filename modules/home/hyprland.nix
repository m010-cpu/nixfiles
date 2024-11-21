{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.hyprland.homeManagerModules.default];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    systemd.variables = ["--all"];
    package = inputs.hyprland.packages.${pkgs.system}.default;

    # plugins = [
    #   inputs.hyprspace.packages.${pkgs.system}.Hyprspace
    # ];

    #settings = {
    #  source = "/home/mo/.config/hypr/hyprland.conf";
    #};
    extraConfig = ''
      ${builtins.readFile ../../hypr/hyprland.conf}
    '';
  };
}
