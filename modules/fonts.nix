{ pkgs, ... }:
{
  fonts.packages = [
    pkgs.nerd-fonts.gohufont
    pkgs.cozette
  ];
}
