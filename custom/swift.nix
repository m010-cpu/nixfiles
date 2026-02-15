{pkgs ? import <nixpkgs> {}}: let
  version = "6.2.3";
  platform = "debian12";

  tarballName = "swift-${version}-RELEASE-${platform}.tar.gz";
in
  pkgs.stdenv.mkDerivation rec {
    pname = "swift-toolchain";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://download.swift.org/swift-${version}-release/${platform}/swift-${version}-RELEASE/${tarballName}";
      sha256 = "sha256-1Ht0FvaOdbO47VOMk53G5anpqN4tYFOJZh0u8x51t3I=";
    };

    nativeBuildInputs = [
      pkgs.gnutar
      pkgs.gzip
      pkgs.makeWrapper
    ];

    phases = ["unpackPhase" "installPhase" "postInstall"];

    unpackPhase = ''
      tar xzf "$src"
    '';

    installPhase = ''
      cd "swift-${version}-RELEASE-${platform}"

      mkdir -p "$out"
      cp -r usr/* "$out/"

      # Create $out/bin and only expose Swift-related binaries
      mkdir -p "$out/bin"

      wanted_bins="
        swift
        swiftc
        swift-build
        swift-test
        swift-run
        swift-package
        swift-driver
        swift-frontend
        swift-demangle
        sourcekit-lsp
      "

      for b in $wanted_bins; do
        if [ -x "$out/usr/bin/$b" ]; then
          ln -s "$out/usr/bin/$b" "$out/bin/$b"
        fi
      done
    '';

    # Runtime libraries Swift expects on Linux; extended with ncurses for REPL.
    propagatedBuildInputs = with pkgs; [
      libuuid
      libxml2
      zlib
      libbsd
      icu
      ncurses
    ];

    postInstall = ''
      # Build a runtime library search path including Swift’s libs and deps
      RUNTIME_LIB_PATH="$out/lib:$out/usr/lib:${
        pkgs.lib.makeLibraryPath propagatedBuildInputs
      }"

      for b in swift swiftc swift-build swift-test swift-run swift-package; do
        if [ -x "$out/bin/$b" ]; then
          wrapProgram "$out/bin/$b" \
            --set-default LD_LIBRARY_PATH "$RUNTIME_LIB_PATH"
        fi
      done
    '';

    meta = with pkgs.lib; {
      description = "Swift compiler and tools packaged from the official Linux tarball";
      homepage = "https://www.swift.org/install/linux/tarball/";
      license = licenses.unfree;
      platforms = platforms.linux;
    };
  }
