{pkgs, ...}: {
  environment.persistence."/persistent" = {
    users.filip = {
      files = [
        ".config/niri/noctalia.kdl"
      ];
    };
  };

  home-manager.users.filip = {
    home.file = {
      ".config/niri/config.kdl".source = ./config.kdl;
      ".config/niri/dynamic-transparency.kdl".source = ./dynamic-transparency.kdl;

      ".config/niri/change-sink.sh".source = pkgs.writeScript "change-sink.sh" (builtins.readFile ./change-sink.sh);
      ".config/niri/change-sink-raw.sh".source = pkgs.writeScript "change-sink-raw.sh" (builtins.readFile ./change-sink-raw.sh);
      ".config/niri/change-transparency.sh".source = pkgs.writeScript "change-sink-raw.sh" (builtins.readFile ./change-transparency.sh);
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
    pkgs.swaybg
    pkgs.jq
  ];
}
