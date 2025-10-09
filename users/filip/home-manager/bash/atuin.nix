{config, ...}: {
  sops.secrets."atuin/key" = {
    path = "/home/filip/.secrets/atuin-key";
    owner = "filip";
  };

  sops.secrets."atuin/session" = {
    path = "/home/filip/.secrets/atuin-session";
    owner = "filip";
  };

  home-manager.users.filip = {
    programs.atuin = {
      enable = true;
      daemon.enable = true;

      settings = {
        sync_address = "http://everest.stream:8888";

        session_path = config.sops.secrets."atuin/session".path;
        key_path = config.sops.secrets."atuin/key".path;
      };
    };
  };
}
