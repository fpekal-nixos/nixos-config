{
	imports = [
		./authorized-keys
		./home-manager
	];

	users.users.filip = {
		isNormalUser = true;
		initialPassword = "genowefa";
		description = "Filip Pekala";
		extraGroups = [ "networkmanager" "wheel" "video" "dialout" ];
	};
}
