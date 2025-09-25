{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation rec {
  pname = "gdre_tools";
  version = "1.0.2";

  src = pkgs.fetchurl {
    url = "https://github.com/GDRETools/gdsdecomp/releases/download/v${version}/GDRE_tools-v${version}-linux.zip";
    sha256 = "2a47e84776ad86ed1587aa155d96b6541c54fe988df00b9869a9bc4fe7b5b96e";
  };

  nativeBuildInputs = [
    pkgs.unzip
    pkgs.autoPatchelfHook
  ];

  unpackPhase = ''
    unzip $src -d .
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp gdre_tools.x86_64 $out/bin/gdre_tools
    cp gdre_tools.pck $out/bin/

    chmod +x $out/bin/gdre_tools
  '';

  meta = with pkgs.lib; {
    description = "GDRE Tools - gdsdecomp";
    homepage = "https://github.com/GDRETools/gdsdecomp";
    license = licenses.mit;
  };
}
