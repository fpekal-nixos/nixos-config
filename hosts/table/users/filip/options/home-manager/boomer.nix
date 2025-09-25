{
  config,
  lib,
  ...
}:
with lib;
with types; {
  options = {
    programs.boomer = {
      enableConfig = mkOption {
        type = bool;
        default = false;
      };

      min_scale = mkOption {
        type = float;
        default = 0.01;
      };

      scroll_speed = mkOption {
        type = float;
        default = 1.5;
      };

      drag_friction = mkOption {
        type = float;
        default = 6.0;
      };

      scale_friction = mkOption {
        type = float;
        default = 4.0;
      };
    };
  };

  config = let
    cfg = config.programs.boomer;
  in {
    home.file = mkIf cfg.enableConfig {
      ".config/boomer/config".text = ''
        min_scale = ${toString cfg.min_scale}
        scroll_speed = ${toString cfg.scroll_speed}
        drag_friction = ${toString cfg.drag_friction}
        scale_friction = ${toString cfg.scale_friction}
      '';
    };
  };
}
