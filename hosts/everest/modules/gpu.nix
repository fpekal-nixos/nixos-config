{ config, ... }:
{
  hardware.graphics.enable = true;
	#hardware.opengl = {

	#	enable = true;
	#	#driSupport = true;
	#	#driSupport32Bit = true;
	#	extraPackages = with pkgs; [ vaapiVdpau ];
	#};

	services.xserver.videoDrivers = ["nvidia"];

	hardware.nvidia = {
		powerManagement.enable = true;
		powerManagement.finegrained = false;
		modesetting.enable = true;
		#nvidiaPersistenced = true;
		nvidiaSettings = true;
		open = false;
		#package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
		#	version = "550.40.07";
		#	sha256_64bit = "sha256-KYk2xye37v7ZW7h+uNJM/u8fNf7KyGTZjiaU03dJpK0=";
		#	sha256_aarch64 = "sha256-AV7KgRXYaQGBFl7zuRcfnTGr8rS5n13nGUIe3mJTXb4=";
		#	openSha256 = "sha256-mRUTEWVsbjq+psVe+kAT6MjyZuLkG2yRDxCMvDJRL1I=";
		#	settingsSha256 = "sha256-c30AQa4g4a1EHmaEu1yc05oqY01y+IusbBuq+P6rMCs=";
		#	persistencedSha256 = "sha256-11tLSY8uUIl4X/roNnxf5yS2PQvHvoNjnd2CB67e870=";
		#};
		package = config.boot.kernelPackages.nvidiaPackages.production;
	};
}
