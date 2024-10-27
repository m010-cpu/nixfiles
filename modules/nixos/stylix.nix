{ pkgs, inputs, ... }:

{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-estuary-light.yaml";
    image = /home/mo/.config/wallpaper/paper.png;
    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";

    fonts = {
      monospace = {
        package = pkgs.nerdfonts;
        name = "MesloLGS Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerdfonts;
        #package = pkgs.nerdfonts.override { fonts = ["MesloLG"]; };
        name = "MesloLGS Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 11;
        desktop = 11;
        popups = 11;
        terminal = 11;
      };
    };

  };
}
