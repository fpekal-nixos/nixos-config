{pkgs, ...}: {
  services.libinput.touchpad.naturalScrolling = true;
  services.libinput.mouse.accelProfile = "flat";

  services.libinput = {
    enable = true;
  };

  services.displayManager.defaultSession = "niri";
  #   services.xserver.displayManager.session = [
  #     {
  #       manage = "window";
  #       name = "mango";
  #       start = ''
  #         exec mango
  #       '';
  #     }
  #   ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    wlr.enable = true;
  };

  programs.niri.enable = true;
  programs.xwayland.enable = true;

  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  services.xserver = {
    enable = true;
    enableTCP = true;

    windowManager.i3 = {
      enable = true;

      extraPackages = [
        pkgs.tilix
        pkgs.i3lock
        pkgs.i3status
        pkgs.dmenu
        pkgs.flameshot
        pkgs.nitrogen
        pkgs.playerctl
        pkgs.xdotool
        pkgs.xss-lock
        pkgs.networkmanagerapplet
        pkgs.i3blocks
        pkgs.rofi
      ];
    };

    # displayManager.lightdm = {
    #   enable = true;
    #   greeters.slick = {
    #     enable = true;
    #     # extraConfig = ''
    #     #         background=/var/lock_screen/lock_screen.png
    #     # '';
    #   };
    # };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  environment.systemPackages = with pkgs; [
    nautilus
    xwayland-satellite
    pulseaudio
    light
    xclip
  ];

  services.pipewire.extraConfig.pipewire = {
    "crackling" = {
      "context.properties" = {
        "default.clock.allowed-rates" = "[ 44100 48000 96000 ]";
        "default.clock.quantum" = 32;
        "default.clock.min-quantum" = 32;
        "default.clock.max-quantum" = 1024;
      };
    };
  };

  services.picom = {
    enable = true;
  };

  programs.dconf.profiles = {
    user.databases = [
      {
        settings = {
          "org.gnome.settings.daemon.peripherals.touchpad".natural-scroll = true;
        };
      }
    ];
  };

  programs.light.enable = true;
}
