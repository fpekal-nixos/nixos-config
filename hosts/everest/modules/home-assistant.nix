{ pkgs, ... }:
{
	services.home-assistant = {
		enable = true;
		extraPackages =
			python3Packages:
				with pkgs;
				with python3Packages;
			[
				gtts
				radios
				pysyncthru
				url-normalize
				pybravia
				plexapi
				plexwebsocket
				plexauth
				androidtvremote2
				nextcord
			];

		config.homeassistant = {
			unit_system = "metric";
			time_zone = "Europe/Warsaw";
			temperature_unit = "C";
			name = "Home";
		};
	};
}
