{
  appimageTools,
  fetchurl,
  lib,
}: let
  pname = "helium";
  version = "0.11.3.2";

  src = fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-x86_64.AppImage";
    hash = "sha256-5gdyKg12ZV2hpf0RL+eoJnawuW/J8NobiG+zEA0IOHA=";
  };

  appimageContents = appimageTools.extractType2 {inherit pname version src;};
in
  appimageTools.wrapType2 {
    inherit pname version src;

    extraInstallCommands = ''
      mkdir -p "$out/share/applications"
      cp "${appimageContents}/helium.desktop" \
         "$out/share/applications/"
      substituteInPlace "$out/share/applications/helium.desktop" \
        --replace-quiet 'Exec=AppRun' 'Exec=helium' \
        --replace-quiet 'Exec=/opt/helium/helium-wrapper' 'Exec=helium' \
        --replace-quiet 'Exec=/opt/helium/helium' 'Exec=helium'

      mkdir -p "$out/share/icons"
      cp -r "${appimageContents}/usr/share/icons/hicolor" \
            "$out/share/icons/"
    '';

    meta = with lib; {
      description = "Helium Browser for Linux — private, fast, and honest Chromium-based browser";
      homepage = "https://github.com/imputnet/helium-linux";
      license = with licenses; [gpl3Only bsd3];
      platforms = ["x86_64-linux"];
      mainProgram = "helium";
    };
  }
