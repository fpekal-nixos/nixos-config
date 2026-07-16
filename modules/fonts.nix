{
  pkgs,
  inputs,
  ...
}: {
  fonts.packages = [
    pkgs.nerd-fonts.gohufont
    pkgs.cozette
    pkgs.linja-sike
    pkgs.nerd-fonts.departure-mono
  ];
}
