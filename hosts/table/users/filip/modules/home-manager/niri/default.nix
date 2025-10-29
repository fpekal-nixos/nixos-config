{pkgs, ...}: {
  home-manager.users.filip = {
    home.file = {
      ".config/niri/config.kdl".source = ./config.kdl;

      ".config/niri/change-sink.sh".source = pkgs.writeScript "change-sink.sh" (builtins.readFile ./change-sink.sh);
      ".config/niri/change-sink-raw.sh".source = pkgs.writeScript "change-sink-raw.sh" (builtins.readFile ./change-sink-raw.sh);
    };

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
