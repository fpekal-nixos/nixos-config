{pkgs, ...}: {
  # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";

    useOSProber = true; # Detect Windows
  };
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelParams = [
    "pcie_aspm=off"
    "hibernate.compressor=lzo"
  ];

  zramSwap = {
    enable = true;
  };
}
