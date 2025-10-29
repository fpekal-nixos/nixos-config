{
  pkgs,
  config,
  ...
}: {
  config = {
    # SET IN POWER-SAVING!!!
    # services.xserver.videoDrivers = [ "nvidia" ];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.nvidia = {
      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
        sync.enable = true;
        # reverseSync.enable = true;
        offload = {
          enable = false;
          enableOffloadCmd = false;
        };
      };

      powerManagement = {
        enable = true;
        finegrained = false;
      };

      modesetting.enable = true;
      nvidiaSettings = true;

      open = true;
      # package = config.boot.kernelPackages.nvidiaPackages.production;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };

    #environment.systemPackages = [
    #  (pkgs.callPackage ./packages/nvidia-offload.nix {})
    #];
  };
}
