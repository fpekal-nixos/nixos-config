{ pkgs, ... }:
{
	environment.systemPackages = [
		pkgs.prismlauncher
	];

	environment.persistence."/persistent" = {
		users.filip = {
			directories = [
				".local/share/PrismLauncher"
			];
		};
	};
}
