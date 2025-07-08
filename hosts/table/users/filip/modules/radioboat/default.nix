{ pkgs, ... }:
{
	home-manager.users.filip = {
		home = {
			packages = [
				pkgs.radioboat
			];

			file.".config/radioboat/urls.csv".source = ./urls.csv;
			file.".config/mpv/mpv.conf".source = ./mpv.conf;
		};
	};

	environment.persistence."/persistent" = {
		users.filip = {
			files = [
				".tracks"
			];
		};
	};
}
