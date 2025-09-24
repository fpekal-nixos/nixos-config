{ inputs, ... }:
{
  services.xserver.windowManager.i3.extraPackages = [
    inputs.radiod.packages.x86_64-linux.default
  ];
}
