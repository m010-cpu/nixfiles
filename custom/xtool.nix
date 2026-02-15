{pkgs ? import <nixpkgs> {}}: let
  pname = "xtool";
  version = "1.16.0";

  src =
    {
      x86_64-linux = pkgs.fetchurl {
        url = "https://github.com/xtool-org/xtool/releases/download/${version}/xtool-x86_64.AppImage";
        sha256 = "sha256-G7YKTre5uSBs3AifsFj0HSmrFOZMv79LmE6vWPGpYEg=";
      };

      aarch64-linux = pkgs.fetchurl {
        url = "https://github.com/xtool-org/xtool/releases/download/${version}/xtool-aarch64.AppImage";
        sha256 = "REPLACE_ME";
      };
    }.${
      pkgs.stdenv.hostPlatform.system
    }
      or (throw "xtool: unsupported platform ${pkgs.stdenv.hostPlatform.system}");
in
  pkgs.appimageTools.wrapType2 {
    inherit pname version src;

    extraPkgs = pkgs: [
      # pkgs.swift
      pkgs.usbmuxd
      pkgs.libimobiledevice
    ];

    meta = with pkgs.lib; {
      description = "Cross-platform Xcode replacement";
      homepage = "https://xtool.sh";
      license = licenses.mit;
      platforms = ["x86_64-linux" "aarch64-linux"];
      mainProgram = "xtool";
    };
  }
