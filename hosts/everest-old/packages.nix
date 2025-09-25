{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    jdk23
  ];

  programs.steam.enable = true;
}
