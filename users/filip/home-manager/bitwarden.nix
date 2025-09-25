{pkgs, ...}: {
  home-manager.users.filip.programs.rbw = {
    enable = true;

    settings = {
      email = "proxy154d@gmail.com";
      base_url = "https://vaultwarden.everest.stream";
      # identity_url = "https://vaultwarden.everest.stream/identity/connect/token";
      pinentry = pkgs.pinentry-curses;
    };
  };
}
