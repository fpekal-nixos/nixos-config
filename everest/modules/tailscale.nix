{ config, ... }:
{
	services.tailscale = {
		enable = true;
		authKeyFile = config.sops.secrets."vpn/tailscale/tmp-key".path;
		extraUpFlags = [
			"--advertise-exit-node"
			"--advertise-routes=192.168.1.0/24,156.17.42.67/32"
		];
		useRoutingFeatures = "server";
	};
}
