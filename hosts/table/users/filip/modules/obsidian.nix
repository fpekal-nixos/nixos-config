{ pkgs, ... }:
{
  environment.persistence."/persistent" = {
    users.filip = {
      directories = [
        "Kontener"
        ".config/obsidian"
      ];
    };
  };

  home-manager.users.filip = {
    services.syncthing.settings.folders = {
      "Kontener" = {
        id = "kontener";
        label = "Kontener";
        path = "~/Kontener";
        devices = [ "everest" ];
      };
    };

    home.packages = [
      pkgs.obsidian
    ];
  };
}
