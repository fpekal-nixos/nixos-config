{ pkgs, ... }:
{
	environment.persistence."/persistent" = {
		users.filip = {
			directories = [
				"Kontener"
				".config/obsidian"
			];
		};
	};

	home-manager.users.filip.home.packages = [
		pkgs.obsidian
	];
}
