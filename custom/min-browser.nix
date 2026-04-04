{pkgs ? import <nixpkgs> {}}: let
  pname = "min-browser";
  version = "1.35.4";
  src = pkgs.fetchurl {
    url = "https://github.com/minbrowser/min/releases/download/v${version}/min-${version}-amd64.deb";
    sha256 = "214cc05152b4c2eee39082ea89067db2f78b1c02a0ba36b263a2eebed0213d17";
  };
in
  pkgs.stdenv.mkDerivation {
    inherit pname version src;
    nativeBuildInputs = with pkgs; [dpkg makeWrapper autoPatchelfHook];
    buildInputs = with pkgs; [
      alsa-lib
      at-spi2-atk
      cups
      gtk3
      libdrm
      libxkbcommon
      mesa
      nss
      xorg.libXdamage
    ];
    unpackPhase = "dpkg-deb -x $src .";
    installPhase = ''
      mkdir -p $out/{opt,bin,share}
      cp -r opt/Min $out/opt/Min
      makeWrapper $out/opt/Min/min $out/bin/min \
        --prefix LD_LIBRARY_PATH : "${pkgs.lib.makeLibraryPath [pkgs.libGL pkgs.mesa]}"
      cp -r usr/share/applications $out/share/
      substituteInPlace $out/share/applications/min.desktop \
        --replace-fail "/opt/Min/min" "$out/bin/min"
      cp -r usr/share/icons $out/share/
    '';
    meta = with pkgs.lib; {
      description = "A fast, minimal browser that protects your privacy";
      homepage = "https://github.com/minbrowser/min";
      license = licenses.asl20;
      platforms = ["x86_64-linux"];
    };
  }
