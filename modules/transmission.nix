{
  services.transmission =
    let
      home-path = "/srv/transmission-daemon";
    in
    {
      enable = true;

      settings = {
        watch-dir = "${home-path}/downloads/torrents";
        watch-dir-enabled = true;
        trash-original-torrent-files = true;

        download-dir = "${home-path}/downloads";

        speed-limit-up = 0;
        speed-limit-up-enabled = true;

        rpc-enabled = true;
        rpc-bind-address = "0.0.0.0";
        rpc-whitelist-enabled = false;
      };

      home = home-path;
    };
}
