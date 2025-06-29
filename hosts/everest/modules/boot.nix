{ pkgs, ... }:
{
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;
	#boot.kernelPackages = pkgs.linuxPackages_6_1;
	boot.kernelPackages = pkgs.linuxPackages_latest;

	boot.kernelParams = [
		"kernel.perf_event_paranoid=1"
		"kernel.kptr_restrict=0"
	];
}
