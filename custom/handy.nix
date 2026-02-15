{pkgs ? import <nixpkgs> {}}: let
  version = "0.7.0";
  pname = "handy";

  src = pkgs.fetchurl {
    url = "https://github.com/cjpais/Handy/releases/download/v${version}/Handy_${version}_amd64.AppImage";
    sha256 = "193n0z10nl4apgnvlp4m224m2jdj1jsdj6vhdi66ng62h8ak0fxm";
  };

  appimageContents = pkgs.appimageTools.extract {inherit pname version src;};
in
  pkgs.appimageTools.wrapType2 {
    inherit pname version src;

    extraPkgs = pkgs: [
      pkgs.wtype
    ];

    extraInstallCommands = ''
      mkdir -p "$out/share/applications"

      cp "${appimageContents}/usr/share/applications/Handy.desktop" \
         "$out/share/applications/"

      mkdir -p "$out/share/icons"
      cp -r "${appimageContents}/usr/share/icons/hicolor" \
            "$out/share/icons/"
    '';

    meta = with pkgs.lib; {
      description = "Handy - speech to text";
      homepage = "https://github.com/cjpais/Handy";
      license = licenses.mit;
      platforms = platforms.linux;
    };
  }
