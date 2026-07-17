{
  backdrop.enabled = true;

  theme = {
    builtin = "Gruvbox";
    mode = "dark";
    source = "wallpaper";
    wallpaper_scheme = "m3-content";

    templates = {
      builtin_ids = ["btop" "cava" "foot" "niri"];
      community_ids = ["zen-browser" "obsidian" "fuzzel" "discord" "opencode" "neovim"];
    };
  };

  lockscreen = {
    blurred_desktop = true; # Lockscreen has blurred screen in background from before locking
  };

  lockscreen_widgets = {
    enabled = true;
    schema_version = 2;
    widget_order = ["lockscreen-login-box@eDP-1" "lockscreen-widget-0000000000000001" "lockscreen-widget-0000000000000002" "lockscreen-widget-0000000000000003"];

    widget = {
      "lockscreen-login-box@eDP-1" = {
        box_height = 70.0;
        box_width = 400.0;
        cx = 960.0;
        cy = 961.0;
        output = "eDP-1";
        rotation = 0;
        type = "login_box";

        settings = {
          background_color = "surface_variant";
          background_opacity = 0.88;
          background_radius = 12.0;
          center_password_text = false;
          input_opacity = 1.0;
          input_radius = 6.0;
          show_caps_lock = true;
          show_keyboard_layout = true;
          show_login_button = true;
          show_password_hint = true;
        };
      };

      "lockscreen-widget-0000000000000001" = {
        box_height = 0.0;
        box_width = 0.0;
        cx = 960.0;
        cy = 806.0;
        output = "eDP-1";
        rotation = 0.0;
        type = "media_player";

        settings = {
          hide_when_no_media = true;
        };
      };

      "lockscreen-widget-0000000000000002" = {
        box_height = 368.0;
        box_width = 1840.0;
        cx = 960.0;
        cy = -5.0;
        rotation = 0.0;
        type = "audio_visualizer";

        settings = {
          background = false;
          bands = 32;
          show_when_idle = true;
        };
      };

      "lockscreen-widget-0000000000000003" = {
        box_height = 560.0;
        box_width = 672.0;
        cx = 960.0;
        cy = 396.0;
        output = "eDP-1";
        rotation = 0.0;
        type = "clock";

        settings = {
          background = false;
          clock_style = "analog";
          font_family = "";
        };
      };
    };
  };

  shell = {
    font_family = "DepartureMono Nerd Font";
    screen_time_enabled = true;
    niri_overview_type_to_launch_enabled = true;
    polkit_agent = true;
  };

  wallpaper = {
    directory = "~/.wallpapers";
    default = {
      path = "/home/filip/.wallpapers/chiaki.png";
      last = "/home/filip/.wallpapers/chiaki.png";
      monitors.eDP-1 = "/home/filip/.wallpapers/chiaki.png";
    };
  };

  location.auto_locate = true;

  idle = {
    behavior_order = ["lock" "screen-off" "lock-and-suspend"];

    behavior = {
      lock = {
        action = "lock";
        enabled = true;
        timeout = 600.0;
      };

      lock-and-suspend = {
        action = "lock_and_suspend";
        enabled = false;
        timeout = 900.0;
      };

      screen-off = {
        action = "screen_off";
        enabled = true;
        timeout = 660.0;
      };
    };
  };

  bar.default = {
    scale = 1.15;
    background_opacity = 0.75;
    widget_spacing = 10;
    capsule = true;
    end = [
      "notifications"
      "clipboard"
      "network"
      "bluetooth"
      "volume"
      "brightness"
      "battery"
      "control-center"
      "tray"
      "session"
    ];
    start = ["launcher" "wallpaper" "workspaces" "media"];
  };

  # Bar widgets
  widget = {
    brightness.enabled = false;
    clock.scale = 1.25;
    control-center.enabled = false;
    workspaces = {
      display = "none";
      hide_when_empty = true;
    };
  };
}
