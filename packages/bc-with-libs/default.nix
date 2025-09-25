{
  pkgs ? import <nixpkgs> {},
  stdenv ? pkgs.stdenv,
  bc ? pkgs.bc,
  makeWrapper ? pkgs.makeWrapper,
  lib ? pkgs.lib,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "bc-with-libs";
  version = "1.0.0";

  libs = pkgs.fetchFromGitHub {
    owner = "mikepierce";
    repo = "GNU-bc-Functions";
    rev = "f75178226ecca284b29cf5de4083af19521c9b9c";
    hash = "sha256-mKSRUZBSVVX6qAdOOzwMRCMt10sqn+0WUdPROTy862I=";
  };

  buildInputs = [bc];
  nativeBuildInputs = [makeWrapper];

  unpackPhase = "true";
  installPhase = ''
    mkdir -p $out/bin
    cp ${./run.sh} $out/bin/bc
    chmod +x $out/bin/bc

    substituteInPlace $out/bin/bc --replace-fail %PREFIX% ${finalAttrs.libs}
    wrapProgram $out/bin/bc --set PATH ${lib.makeBinPath [bc]}
  '';
})
