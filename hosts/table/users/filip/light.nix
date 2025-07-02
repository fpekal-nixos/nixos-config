{ pkgs, ... }:
{
	environment.persistence."/persistent" = {
		users.filip = {
			directories = [
				".config/light"
			];
		};
	};

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
