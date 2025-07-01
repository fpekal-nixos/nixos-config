{ pkgs, ... }:
let
	pShadow = "/persistent/etc/shadow";
in
{
	system.activationScripts = {
		etc_shadow = ''
			[ -f "/etc/shadow" ] && cp --update=all /etc/shadow ${pShadow}
			[ -f "${pShadow}" ] && cp --update=none ${pShadow} /etc/shadow
		'';

		users.deps = [ "etc_shadow" ];
	};

	systemd.services."etc_shadow_persistence" = {
		enable = true;
		description = "Persist /etc/shadow on shutdown";

		wantedBy = [ "multi-user.target" ];
		path = [ pkgs.util-linux ];
		unitConfig.defaultDependencies = true;
		serviceConfig = {
			Type = "oneshot";
			RemainAfterExit = true;
			# Service is stopped before shutdown
			ExecStop = pkgs.writeShellScript "persist_etc_shadow" ''
				mkdir --parents /persistent/etc
				cp --update=all /etc/shadow ${pShadow}
			'';
		};
	};
}
