{
	system.stateVersion = "25.05";

	imports = [
		./nix-settings.nix
		./nix-ld.nix
		./openssh.nix
		./home-manager.nix
		./secrets
		./simple-list.nix
		./neovim
		./kill.nix
		# ./transmission.nix
		./fonts.nix
		./zellij.nix
	];
}
