{pkgs ? import <nixpkgs> {}}:
pkgs.python2.pkgs.buildPythonApplication rec {
  pname = "volatility";
  version = "2.6.1";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "volatilityfoundation";
    repo = "volatility";
    rev = "refs/tags/${version}";
    sha256 = "sha256-LhvYZZqcWolgkgfrdgyYAR6RO2eSznDmVGOzcSlVIu0=";
  };
  build-system = with pkgs.python2.pkgs; [
    setuptools
  ];
  # nativeBuildInputs = with pkgs.python2.pkgs; [
  #   setuptools
  # ];

  dependencies = [
    (pkgs.python2.pkgs.fetchPypi {
      pname = "distorm3";
      version = "3.4.2";
      sha256 = "sha256-wVNDJHl1nj9DJ1fCsxPPmXaAbb3IB+dopfH26EbgObI=";
    })
    (pkgs.python2.pkgs.fetchPypi {
      pname = "yara";
      version = "1.7.7";
      sha256 = "sha256-PunPV30zYMeFlz/PYvdi3yHh3PBfpJd0C8Fq4jweouk=";
    })
    (pkgs.python2.pkgs.fetchPypi {
      pname = "pillow";
      version = "11.0.0";
      sha256 = "sha256-crrLrySsAD/qm/+YN9Hu22CIdY1B4QDBVSkwFR9ndzk=";
    })
    (pkgs.python2.pkgs.fetchPypi {
      pname = "pycrypto";
      version = "2.6.1";
      sha256 = "sha256-8s4emJsnLPy2d2FnY+Ci5+xlnv+meoiqkrOmVSj2Cjw=";
    })
    (pkgs.python2.pkgs.fetchPypi {
      pname = "openpyxl";
      version = "3.0.0";
      sha256 = "sha256-NAoasgaXZFWbnVgCekOiTbGNsOJd64D4HsuMp+5SU9s=";
    })
    (pkgs.python2.pkgs.fetchPypi {
      pname = "ujson";
      version = "2.0.3";
      sha256 = "sha256-vS3v/Jg4J1EOUUX7ZuTMD1d0gMYv4LSIITn499J66aM=";
    })
    (pkgs.python2.pkgs.fetchPypi {
      pname = "ipython";
      version = "5.10.0";
      sha256 = "sha256-0fni0CuwkA3e97avEUrKOlzz3EO53h8Z03xK7bxyT+4=";
    })
    (pkgs.python2.pkgs.fetchPypi {
      pname = "capstone";
      version = "4.0.2";
      sha256 = "sha256-KEKRMJLJtp/ZA3RLwbh0iOFFFiVGC6rBcwVuGAjsHGY=";
    })
    pkgs.python2.pkgs.pytz
  ];

  # propagatedBuildInputs = [
  #   (pkgs.python2.pkgs.fetchPypi {
  #     pname = "distorm3";
  #     version = "3.4.2";
  #     sha256 = "sha256-wVNDJHl1nj9DJ1fCsxPPmXaAbb3IB+dopfH26EbgObI=";
  #   })
  #   (pkgs.python2.pkgs.fetchPypi {
  #     pname = "yara";
  #     version = "1.7.7";
  #     sha256 = "sha256-PunPV30zYMeFlz/PYvdi3yHh3PBfpJd0C8Fq4jweouk=";
  #   })
  #   (pkgs.python2.pkgs.fetchPypi {
  #     pname = "pillow";
  #     version = "11.0.0";
  #     sha256 = "sha256-crrLrySsAD/qm/+YN9Hu22CIdY1B4QDBVSkwFR9ndzk=";
  #   })
  #   (pkgs.python2.pkgs.fetchPypi {
  #     pname = "pycrypto";
  #     version = "2.6.1";
  #     sha256 = "sha256-8s4emJsnLPy2d2FnY+Ci5+xlnv+meoiqkrOmVSj2Cjw=";
  #   })
  #   (pkgs.python2.pkgs.fetchPypi {
  #     pname = "openpyxl";
  #     version = "3.0.0";
  #     sha256 = "sha256-NAoasgaXZFWbnVgCekOiTbGNsOJd64D4HsuMp+5SU9s=";
  #   })
  #   (pkgs.python2.pkgs.fetchPypi {
  #     pname = "ujson";
  #     version = "2.0.3";
  #     sha256 = "sha256-vS3v/Jg4J1EOUUX7ZuTMD1d0gMYv4LSIITn499J66aM=";
  #   })
  #   (pkgs.python2.pkgs.fetchPypi {
  #     pname = "ipython";
  #     version = "5.10.0";
  #     sha256 = "sha256-0fni0CuwkA3e97avEUrKOlzz3EO53h8Z03xK7bxyT+4=";
  #   })
  #   (pkgs.python2.pkgs.fetchPypi {
  #     pname = "capstone";
  #     version = "4.0.2";
  #     sha256 = "sha256-KEKRMJLJtp/ZA3RLwbh0iOFFFiVGC6rBcwVuGAjsHGY=";
  #   })
  #   pkgs.python2.pkgs.pytz
  # ];

  preBuild = ''
    export HOME=$(mktemp -d);
  '';

  doCheck = false;

  pythonImportsCheck = [
    "volatility"
  ];
}
