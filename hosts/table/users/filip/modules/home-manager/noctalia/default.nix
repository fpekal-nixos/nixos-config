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
      user-templates = {
        config = {};
        templates = {
          zen = {
            input_path = ./templates/zen.json;
            output_path = "~/.config/noctalia/templates/zen-generated.json";
            post_hook = "${pkgs.writeShellApplication {
              name = "zen-hook";
              runtimeInputs = [
                pkgs.sqlite
              ];
              text = ''
                sqlite3 ~/.zen/11sz08bn.Default\ Profile/places.sqlite \
                  "UPDATE zen_workspaces SET theme_colors = '$(cat ~/.config/noctalia/templates/zen-generated.json)' WHERE name = 'Default';"
                '';
            }}/bin/zen-hook";
          };
        };
      };
    };
  };
}
