{pkgs, ...}: {
  #TODO: Change it so it uses home-manager native options
  home-manager.users.filip.home.file = {
    ".config/i3/config".source = ./i3-config;
    ".config/i3/raise-volume.sh".source = pkgs.writeScript "raise-volume.sh" (builtins.readFile ./raise-volume.sh);

    ".config/i3blocks/config".source = ./i3blocks-config;
  };
}
