# Packages only the IDA plugin files from ida-pro-mcp.
# The plugin runs inside IDA's own Python with zero external deps.
#
# The `ida-pro-mcp` CLI proxy (which needs `mcp[cli]` from PyPI) is NOT
# packaged here — run it via `uvx ida-pro-mcp` or install it with pip
# in your user environment, which is how upstream intends it.
#
{
  pkgs,
  lib,
}:
pkgs.stdenv.mkDerivation {
  pname = "ida-pro-mcp";
  version = "1.4.0";

  src = pkgs.fetchFromGitHub {
    owner = "mrexodia";
    repo = "ida-pro-mcp";
    rev = "1.4.0";
    hash = "sha256-abH6i/Xr3P3/gP8L151FZBU9ovp/olFWwKenPz7BuF8=";
  };

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    mkdir -p $out/share/ida-pro-mcp

    # The loader script that IDA's plugin system picks up
    cp src/ida_pro_mcp/ida_mcp.py $out/share/ida-pro-mcp/

    # The package directory it imports at runtime
    cp -r src/ida_pro_mcp/ida_mcp $out/share/ida-pro-mcp/
  '';

  meta = {
    description = "IDA Pro MCP plugin for AI-assisted reverse engineering";
    homepage = "https://github.com/mrexodia/ida-pro-mcp";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
}
