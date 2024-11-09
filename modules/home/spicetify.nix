{ pkgs, inputs, ... }:

{
  imports = [ inputs.spicetify-nix.homeManagerModule ];

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
      ];
    };
}
