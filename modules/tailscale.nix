{ host, config, ... }:
let
	prefix = "vpn/tailscale/";
	key = "${prefix}${host}-key";
	keyFile = config.sops.secrets.${key}.path;
in {
	services.tailscale = {
		enable = true;

		authKeyFile = keyFile;
		openFirewall = true;

		extraUpFlags = [
			"--advertise-tags=tag:table"
		];
	};

	sops.secrets.${key} = {};

	systemd.services.tailscaled-autoconnect = {
		after = [ "network-online.target" ];
		wants = [ "network-online.target" ];
	};
}
