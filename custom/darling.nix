{pkgs}:
pkgs.clangStdenv.mkDerivation rec {
  pname = "darling";
  version = "0.1.20260222";

  src = pkgs.fetchFromGitHub {
    owner = "darlinghq";
    repo = "darling";
    rev = "v${version}";
    fetchSubmodules = true;
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  nativeBuildInputs = with pkgs; [
    cmake
    pkg-config
    bison
    flex
    python3
  ];

  buildInputs = with pkgs; [
    glib
    openssl
    dbus
    fuse
    cairo
    freetype
    fontconfig
    libxml2
    libpng
    libuuid
    libcap
  ];

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
    "-DTARGET_i386=OFF"
  ];

  meta = with pkgs.lib; {
    description = "Darwin/macOS emulation layer for Linux";
    longDescription = ''
      Darling is a translation layer that lets you run macOS software on Linux,
      similar to how Wine runs Windows software. Most GUI applications do not
      run yet, and the kernel module (darling-mach) must be loaded separately —
      this package only builds the userspace components.
    '';
    homepage = "https://www.darlinghq.org";
    license = licenses.gpl3Only;
    platforms = ["x86_64-linux"];
    mainProgram = "darling";
    broken = true;
  };
}
