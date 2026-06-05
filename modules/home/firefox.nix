{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.arkenfox.hmModules.default];
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    profiles.default = {
      extensions.packages = with inputs.firefox-addons.packages; [
        x86_64-linux.bitwarden
        x86_64-linux."2fas-two-factor-authentication"
        x86_64-linux.foxyproxy-standard
        x86_64-linux.libredirect
        x86_64-linux.privacy-badger
        x86_64-linux.ublock-origin
        x86_64-linux.metamask
        x86_64-linux.tridactyl
      ];
      search = {
        default = "brave";
        force = true;
        engines = {
          brave = {
            name = "brave search";
            urls = [
              {
                template = "https://search.brave.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            iconMapObj."16" = "https://brave.com/static-assets/images/brave-favicon.png";
            definedAliases = ["@br"];
          };
          startpage = {
            name = "startpage";
            urls = [
              {
                template = "https://www.startpage.com/do/dsearch";
                params = [
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            iconMapObj."16" = "https://www.startpage.com/favicon.ico";
            definedAliases = ["@sp"];
          };
        };
      };
      extraConfig = ''
        ${builtins.readFile ../../arkenfox/user.js}
      '';
    };
  };
}
