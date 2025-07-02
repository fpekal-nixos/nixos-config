{ pkgs, ... }:
{
  services.libinput.touchpad.naturalScrolling = true;
  services.libinput.mouse.accelProfile = "flat";

  services.xserver = {
    enable = true;
    enableTCP = true;

		libinput = {
			enable = true;
		};

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
      ];
    };

    displayManager.lightdm = {
      enable = true;
      greeters.slick = {
        enable = true;
        extraConfig = ''
                background=/var/lock_screen/lock_screen.png
        '';
      };
    };

		displayManager.defaultSession = "none+i3";
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

	environment.systemPackages = with pkgs; [
		pulseaudio
		light
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
