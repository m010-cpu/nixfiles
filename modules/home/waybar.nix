{ lib, ... }:

{
  programs.waybar = {
    enable = true;
    settings = lib.importJSON ./waybar/config;
    style = ''
      ${builtins.readFile ./waybar/style.css}
    '';
  };
}
