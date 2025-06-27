{ pkgs, inputs, ... }:
{
	home-manager.users.filip.home.packages =
	with pkgs;
	[
		htop
		zip
		unzip
		inputs.zen-browser.packages.x86_64-linux.default
	];
}
