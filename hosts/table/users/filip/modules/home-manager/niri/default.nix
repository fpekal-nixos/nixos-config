{pkgs, ...}: {
  home-manager.users.filip = {
    home.file.".config/niri/config.kdl".source = ./config.kdl;

    programs.swaylock = {
      enable = true;
      settings = {
        image = "/home/filip/.wallpapers/Bsodwindows10.png";
      };
    };
  };

  environment.systemPackages = [
    pkgs.fuzzel
    pkgs.swaylock
  ];
}
