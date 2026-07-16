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

    programs.noctalia = {
      enable = true;
      settings = import ./settings.nix;
      package = inputs.noctalia.packages.x86_64-linux.cuda;
    };

    home.file.".config/foot/foot.ini" = {
      text = ''
        [main]
        include=~/.config/foot/themes/noctalia
        include=/etc/xdg/foot/foot.ini
      '';
    };
  };
}
