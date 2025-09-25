{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sunshine
  ];

  hardware.uinput.enable = true;
}
