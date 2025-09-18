{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    inputs.boomer.packages.x86_64-linux.boomer
    vesktop
    (callPackage ../../../packages/spotify.nix { })
  ];

  home-manager.users.filip.programs.boomer = {
    enableConfig = true;

    min_scale = 1.0;
    scroll_speed = 0.5;
  };
}
