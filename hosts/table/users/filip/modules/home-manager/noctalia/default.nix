{
  inputs,
  pkgs,
  ...
}: {
  environment.persistence."/persistent" = {
    users.filip = {
      directories = [
        ".cache/noctalia"
      ];
      files = [
        ".config/noctalia/colors.json"
      ];
    };
  };

  services.upower = {
    enable = true;
  };

  home-manager.users.filip = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    home.sessionVariables = {
      QT_QPA_PLATFORMTHEME = "gtk3";
    };

    programs.noctalia-shell = {
      enable = true;
      settings = import ./settings.nix;
    };
  };
}
