{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation {
  pname = "lotion";
  version = "1.5.0";

  src = pkgs.fetchurl {
    url = "https://github.com/puneetsl/lotion/releases/download/v1.5.0/Lotion-linux-x64-1.5.0.zip";
    sha256 = "sha256-oSLWDExUKRmwR1uix1DnGPnQfKarn1VYm4t6L+m1LYQ=";
  };

  buildInputs = [pkgs.unzip];

  installPhase = ''
    mkdir -p $out
    unzip $src -d $out

    mkdir -p $out/bin
    cat > $out/bin/lotion <<EOF
    #!/usr/bin/env bash
    export ELECTRON_RUN_AS_NODE=0
    exec $out/Lotion-linux-x64/lotion "\$@"
    EOF
    chmod +x $out/bin/lotion
  '';

  meta = {
    description = "Unofficial Notion.so Electron desktop app";
    homepage = "https://github.com/puneetsl/lotion";
    license = pkgs.lib.licenses.mit;
    platforms = pkgs.lib.platforms.linux;
  };
}
