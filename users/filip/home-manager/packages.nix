{
  pkgs,
  inputs,
  config,
  ...
}: {
  home-manager.users.filip = {
    imports = [inputs.zen-browser.homeModules.default];

    programs.zen-browser = let
      custom-zen = inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.beta-unwrapped.overrideAttrs (oldAttrs: rec {
        libName = "zen-bin-1.17.15b";
        fsautoconfig = builtins.fetchurl {
          url = "https://raw.githubusercontent.com/MrOtherGuy/fx-autoconfig/master/program/config.js";
          sha256 = "1mx679fbc4d9x4bnqajqx5a95y1lfasvf90pbqkh9sm3ch945p40";
        };

        configpref = builtins.fetchurl {
          url = "https://raw.githubusercontent.com/MrOtherGuy/fx-autoconfig/refs/heads/master/program/defaults/pref/config-prefs.js";
          sha256 = "sha256-a/0u0TnRj/UXjg/GKjtAWFQN2+ujrckSwNae23DBfs4=";
        };

        libname = "zen-bin-*";
        postInstall =
          (oldAttrs.postInstall or "")
          + ''
            for libdir in "$out"/lib/${libname}; do
              chmod -R u+w "$libdir"
              cp "${fsautoconfig}" "$libdir/config.js"
              mkdir -p "$libdir/defaults/pref"
              cp "${configpref}" "$libdir/defaults/pref/config-pref.js"
            done
          '';
      });
    in {
      enable = true;

      extraPrefsFiles = [
        (builtins.fetchurl {
          url = "https://raw.githubusercontent.com/sineorg/bootloader/main/program/config.js";
          sha256 = "117a6gkaz1kinjflfzqc6qsb4r06x93w08q4lfdzh5a1cng95s5v";
        })
      ];

      package = pkgs.wrapFirefox custom-zen {};
    };

    home.packages = with pkgs; [
      htop
      zip
      unzip
    ];
  };
}
