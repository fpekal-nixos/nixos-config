{
  home-manager.users.filip = {
    programs.opencode = {
      enable = true;
      web.enable = true;

      tui = {
        theme = "matugen";
      };

      settings = {
        permission = {
          "*" = "ask";
          "glob" = "allow";
          "task" = "allow";
          "skill" = "allow";
          "question" = "allow";
          "webfetch" = "allow";
          "websearch" = "allow";
        };
      };
    };
  };
}
