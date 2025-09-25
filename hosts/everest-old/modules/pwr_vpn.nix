{
  pkgs,
  config,
  ...
}: {
  systemd.services.pwr_vpn = {
    enable = true;
    script = "cat ${
      config.sops.secrets."vpn/pwr/password".path
    } | ${pkgs.openconnect}/bin/openconnect --protocol=gp --user=$(cat ${
      config.sops.secrets."vpn/pwr/username".path
    }) --passwd-on-stdin vpn.student.pwr.edu.pl";
    wantedBy = ["multi-user.target"];
    wants = ["network-online.target"];
  };
}
