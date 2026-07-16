{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.prismlauncher
    pkgs.openjdk25
  ];

  environment.persistence."/persistent" = {
    users.filip = {
      directories = [
        ".local/share/PrismLauncher"
      ];
    };
  };
}
