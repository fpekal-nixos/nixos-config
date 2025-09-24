{
  home-manager.users.filip = {
    programs.neovide = {
      enable = true;

      settings = {
        font = {
          normal = [
            {
              family = "FairfaxHax Nerd Font";
              style = "Regular";
            }
          ];
          size = 19.0;

          features = {
            "FairfaxHax Nerd Font" = [
              "+liga"
              "+clig"
              "+dlig"
              "+hlig"
              "+ccmp"
              "+rlig"
            ];
          };
        };
      };
    };
  };
}
