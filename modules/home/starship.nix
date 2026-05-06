{pkgs, ...}: {
  programs.starship = {
    enable = true;
    package = pkgs.starship;
    presets = [
      "nerd-font-symbols"
    ];
    settings = {
      command_timeout = 100;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };
}
