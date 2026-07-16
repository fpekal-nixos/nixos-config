{pkgs, ...}: {
  # environment.persistence."/persistent" = {
  #   users.filip = {
  #     directories = [".config/dconf"];
  #   };
  # };

  programs.dconf.enable = true;

  environment.systemPackages = [
    pkgs.adwaita-icon-theme
  ];
}
