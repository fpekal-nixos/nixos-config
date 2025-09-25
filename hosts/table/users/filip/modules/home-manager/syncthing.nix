{
  home-manager.users.filip = {
    services.syncthing = {
      enable = true;

      overrideDevices = true;
      overrideFolders = true;

      settings = {
        options = {
          localAnnounceEnabled = true;
          relaysEnabled = true;
          urAccepted = -1;
        };

        devices = {
          "everest" = {
            id = "JJXFRYP-2DFMLYX-S3PVLVA-B2I737G-RX3K4MK-JRKQRBI-HBVEURV-LCJUUAH";
          };
        };
      };
    };
  };

  environment.persistence."/persistent" = {
    users.filip = {
      directories = [
        ".local/state/syncthing"
      ];
    };
  };
}
