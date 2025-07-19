{
	home-manager.users.filip = {
		services.syncthing = {
			enable = true;

			overrideDevices = true;
			overrideFolders = true;

			settings.options = {
				localAnnounceEnabled = true;
				relaysEnabled = true;
				urAccepted = -1;
			};
		};
	};

	environment.persistence."/persistent" = {
		users.filip = {
			directories = [
				".local/state/syncthing"
			];
		};
	};
}
