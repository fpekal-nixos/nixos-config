{ config, ... }:
{
	sops = {
		defaultSopsFile = ./secrets.yaml;
		defaultSopsFormat = "yaml";

		age.keyFile = "/home/filip/.config/sops/age/keys.txt";

		# secrets = {
		# 	"vpn/pwr/username" = {};
		# 	"vpn/pwr/password" = {};
		# 	"vpn/tailscale/everest-key" = {};
		# 	"vpn/tailscale/table-key" = {};
		# 	"vpn/tailscale/tmp-key" = {};
		# 	"neovim/codecompanion-key" = {
		# 		owner = "filip";
		# 	};
		# };
	};
}
