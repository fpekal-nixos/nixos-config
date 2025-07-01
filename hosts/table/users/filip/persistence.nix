{
	environment.persistence."/persistent" = {
		users.filip = {
			directories = [
				".config/vesktop"
				".local/state/nvim"
				".local/share/nvim"
				".local/share/zoxide"
				".local/share/PrismLauncher"
				".zen"
				".ssh"
			];

			files = [
				".config/sops/age/keys.txt"
				".bash_history"
				".gitconfig"
			];
		};
	};

	systemd.services."persist-persistent-home-filip-.config-sops-age-keys.txt".before = [
		"sops-install-secrets.service"
	];
}
