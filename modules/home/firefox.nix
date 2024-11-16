{
  pkgs,
  inputs,
  ...
}:

{
  imports = [ inputs.arkenfox.hmModules.default ];

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;

    # arkenfox = {
    #   enable = true;
    #   version = "128.0";
    # };

    profiles.dev-edition-default = {
      extensions = with inputs.firefox-addons.packages; [
        x86_64-linux.bitwarden
        x86_64-linux."2fas-two-factor-authentication"
        x86_64-linux.foxyproxy-standard
        x86_64-linux.libredirect
        x86_64-linux.privacy-badger
        x86_64-linux.ublock-origin
        x86_64-linux.metamask
        x86_64-linux.tridactyl
      ];

      extraConfig = ''
        ${builtins.readFile ../../arkenfox/user.js}
      '';

      # arkenfox = {
      #   enable = true;
      #   # enableAllSections = true;
      #   "0000".enable = true;
      #   # "2800"."2811"."privacy.clearOnShutdown.history".enable = lib.mkForce false;
      #   "1200" = {
      #     enable = true;
      #     "1201"."security.ssl.require_safe_negotiation".enable = false;
      #   };
      #
      # };

    };

  };
}
