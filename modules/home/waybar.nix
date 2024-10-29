{ lib, ... }:

{
  programs.waybar = {
    enable = true;
    settings = lib.importJSON ./waybar/config.json;
    style = ''
      ${builtins.readFile ./waybar/style.css}
    '';
  };
}
