{ inputs, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		inputs.boomer.packages.x86_64-linux.boomer
		vesktop
	];
}
