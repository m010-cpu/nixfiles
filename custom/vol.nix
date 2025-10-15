{pkgs ? import <nixpkgs> {}}: let
  python2Packages = pkgs.python2Packages;

  buildPythonPackage = python2Packages.buildPythonPackage;
  fetchPypi = python2Packages.fetchPypi;

  distorm3 = buildPythonPackage rec {
    pname = "distorm3";
    version = "3.4.2";
    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-wVNDJHl1nj9DJ1fCsxPPmXaAbb3IB+dopfH26EbgObI=";
    };
    doCheck = false;
  };

  # yara = buildPythonPackage rec {
  #   pname = "yara";
  #   version = "1.7.7";
  #   src = fetchPypi {
  #     inherit pname version;
  #     sha256 = "sha256-PunPV30zYMeFlz/PYvdi3yHh3PBfpJd0C8Fq4jweouk=";
  #   };
  #   doCheck = false;
  # };

  # pillow = buildPythonPackage rec {
  #   pname = "pillow";
  #   version = "6.2.2";
  #   src = fetchPypi {
  #     inherit pname version;
  #     sha256 = "sha256-crrLrySsAD/qm/+YN9Hu22CIdY1B4QDBVSkwFR9ndzk=";
  #   };
  #   doCheck = false;
  # };

  # pycrypto = buildPythonPackage rec {
  #   pname = "pycrypto";
  #   version = "2.6.1";
  #   src = fetchPypi {
  #     inherit pname version;
  #     sha256 = "sha256-8s4emJsnLPy2d2FnY+Ci5+xlnv+meoiqkrOmVSj2Cjw=";
  #   };
  #   doCheck = false;
  # };

  # openpyxl = buildPythonPackage rec {
  #   pname = "openpyxl";
  #   version = "2.6.4";
  #   src = fetchPypi {
  #     inherit pname version;
  #     sha256 = "sha256-HVOAFnjhjX/jjBFvGtDCODplRnDEyIBhBbYRyS2S8uM=";
  #   };
  #   doCheck = false;
  # };

  # ujson = buildPythonPackage rec {
  #   pname = "ujson";
  #   version = "2.0.3";
  #   src = fetchPypi {
  #     inherit pname version;
  #     sha256 = "sha256-vS3v/Jg4J1EOUUX7ZuTMD1d0gMYv4LSIITn499J66aM=";
  #   };
  #   doCheck = false;
  # };

  # ipython = buildPythonPackage rec {
  #   pname = "ipython";
  #   version = "5.10.0";
  #   src = fetchPypi {
  #     inherit pname version;
  #     sha256 = "sha256-0fni0CuwkA3e97avEUrKOlzz3EO53h8Z03xK7bxyT+4=";
  #   };
  #   doCheck = false;
  # };

  capstone = buildPythonPackage rec {
    pname = "capstone";
    version = "4.0.2";
    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-KEKRMJLJtp/ZA3RLwbh0iOFFFiVGC6rBcwVuGAjsHGY=";
    };
    doCheck = false;
  };
in
  pkgs.python2.pkgs.buildPythonApplication rec {
    pname = "volatility";
    version = "2.6.1";
    pyproject = false;

    src = pkgs.fetchFromGitHub {
      owner = "volatilityfoundation";
      repo = "volatility";
      rev = "refs/tags/${version}";
      sha256 = "sha256-LhvYZZqcWolgkgfrdgyYAR6RO2eSznDmVGOzcSlVIu0=";
    };

    # build-system = with pkgs.python2.pkgs; [
    #   setuptools
    # ];

    propagatedBuildInputs = with pkgs.python2.pkgs; [
      distorm3
      # yara-python
      # pillow
      pycryptodome
      # openpyxl
      # ujson
      # ipython
      capstone
      pytz
    ];

    doCheck = false;

    pythonImportsCheck = [
      "volatility"
    ];
  }
