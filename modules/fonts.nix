{ pkgs, inputs, ... }: {
  fonts.packages = [
    pkgs.nerd-fonts.gohufont
    pkgs.cozette
    inputs.fairfax-nerdfont.packages.x86_64-linux.default
  ];
}
