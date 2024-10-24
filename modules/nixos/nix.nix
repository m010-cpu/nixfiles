{ config, ...}:

{
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
    nixpkgs.config.allowUnfree = true;
    
    nix.settings.auto-optimise-store = true;
    nix.optimise.automatic = true;
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
}
