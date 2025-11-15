{pkgs, ...}: {
  services.sunshine = {
    enable = true;
    autoStart = true;
    openFirewall = true;
    capSysAdmin = true;

    applications.apps = [
      {
        name = "MoonDeckStream";
        cmd = "/run/current-system/sw/bin/MoonDeckStream";
        exclude-global-prep-cmd = "false";
        auto-detach = "true";
      }
      {
        name = "Desktop";
        exclude-global-prep-cmd = "false";
        auto-detach = "true";
      }
    ];
  };

  networking.firewall.allowedTCPPorts = [
    59999
  ];

  environment.systemPackages = [
    (pkgs.callPackage ../packages/moondeck-buddy.nix {})
    pkgs.egl-wayland
    pkgs.eglexternalplatform
  ];
}
