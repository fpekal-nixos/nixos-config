{
  pkgs,
  inputs,
  ...
}: {
  fonts.packages = [
    pkgs.nerd-fonts.gohufont
    pkgs.cozette
    pkgs.linja-sike
    inputs.fairfax-nerdfont.packages.x86_64-linux.default
  ];
}
