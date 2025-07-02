{ pkgs, ... }:
{
	environment.persistence."/persistent" = {
		users.filip = {
			directories = [
				".config/light"
			];
		};
	};

	# Enables the use of special keys on the keyboard
	services.acpid.enable = true;

	home-manager.users.filip = {
		systemd.user.services.light = {
			Service = {
				ExecStart = "${pkgs.light}/bin/light -I";
			};

			Install = {
				WantedBy = [ "default.target" ];
			};
		};
	};
}
