{
  services.samba = {
    enable = true;

    settings = {
      global = {
        "allow insecure wide links" = "yes";
      };
    };

    shares =
      let
        mksamba = (
          arg:
          ({
            browseable = "yes";
            "follow symlinks" = "yes";
            "wide links" = "yes";
            writeable = "yes";
          })
          // arg
        );
      in
      {
        tymczasowe = mksamba {
          # Każdy ma dostęp, przesyłanie plików międzt dwoma komputerami
          path = "/srv/samba/tymczasowe";
          "force group" = "users";
          "directory mask" = 2775;
          "create mask" = 664;
        };
        strona = mksamba {
          # Każdy ma dostęp, przesyłanie plików międzt dwoma komputerami
          path = "/srv/www/html";
          "force group" = "users";
          "directory mask" = 2775;
          "create mask" = 664;
        };
        filip = mksamba {
          path = "/srv/samba/filip";
          "valid users" = "filip";
        };
        filip-archiwum = mksamba {
          path = "/srv/samba/filip-archiwum";
          "valid users" = "filip";
          writeable = "no";
        };
        jan = mksamba {
          path = "/srv/samba/jan";
          "valid users" = "jan";
        };
      };
  };
}
