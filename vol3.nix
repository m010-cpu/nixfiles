{pkgs ? import <nixpkgs> {}}:
pkgs.python3.pkgs.buildPythonApplication rec {
  pname = "vol3";
  version = "2.8.0";
  pyproject = true;

  src = pkgs.python3.pkgs.fetchFromGitHub {
    owner = "volatilityfoundation";
    repo = "volatility3";
    tag = "v${version}";
    hash = "sha256-XMoVfT1Wd8r684y4crTOjW9GklSTkivOGv1Ii10KzII=";
  };

  build-system = with pkgs.python3.pkgs; [
    setuptools
  ];

  dependencies = with pkgs.python3.pkgs; [
    capstone
    jsonschema
    pefile
    pycryptodome
    yara-python
  ];

  # preBuild = ''
  #   export HOME=$(mktemp -d);
  # '';

  # Project has no tests
  doCheck = false;

  pythonImportsCheck = [
    "vol3"
  ];
}
