{
  services.vaultwarden = {
    enable = true;
    config = {
      DOMAIN = "https://vaultwarden.everest.stream";
      SIGNUPS_ALLOWED = true;
    };
  };

  # TODO: Put nginx config in here
}
