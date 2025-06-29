{ pkgs, ... }:
{
	services.plex.enable = true;
	systemd.services.plex.serviceConfig = {
		ProtectHome = pkgs.lib.mkForce false;
		ProtectControlGroups = pkgs.lib.mkForce false;
		ProtectKernelModules = pkgs.lib.mkForce false;
		ProtectKernelTunables = pkgs.lib.mkForce false;
		ProtectSystem = pkgs.lib.mkForce false;
	};
}
