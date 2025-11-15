{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation (finalAttrs: {
  pname = "moondeck-buddy";
  version = "1.9.1";
  srchash = "sha256-ASqEyhELzOz0sU5sysluay0pMqiBj1lFCEWMQ0oe8YE=";

  src = pkgs.fetchFromGitHub {
    owner = "FrogTheFrog";
    repo = "moondeck-buddy";
    rev = finalAttrs.version;
    hash = finalAttrs.srchash;
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    pkgs.cmake
    pkgs.qt6.wrapQtAppsNoGuiHook
  ];
  buildInputs = [
    pkgs.qt6.qtbase
    pkgs.kdePackages.qthttpserver
    pkgs.procps
  ];
})
